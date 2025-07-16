import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:e_commercial/domain/entities/cart.dart';
import 'package:e_commercial/domain/usecases/Cart/get_cart_items.dart';
import '../../../injection/injection_container.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  List<CartEntity> _cartItems = [];
  List<CartItemEntity> _selectedItems = [];
  List<CartItemEntity> get selectedItems => _selectedItems;

  CartBloc() : super(CartInitial()) {
    on<GetCartItems>((event, emit) async {
      var result = await sl<GetCartItemsUseCase>().call();
      result.fold(
        (failure) => emit(CartError(message: failure.message)),
        (cart) {
          _cartItems = cart;
          final totalMoney = cart.fold<int>(0, (sum, brandCart) {
            return sum +
                brandCart.items.fold<int>(0, (itemSum, item) {
                  return itemSum + item.amount * item.productVariant.price;
                });
          });

          emit(CartUpdated(cart, totalMoney, _selectedItems));
        }, // Emit loaded state with cart items
      );
    });

    // on<RemoveProductFromCart>((event, emit) {
    //   _cartItems.removeWhere((item) => item.product.id == event.product.id);
    //   emit(CartLoaded(cartItems: _cartItems));
    // });

    // on<ClearCart>((event, emit) {
    //   _cartItems.clear();
    //   emit(CartLoaded(cartItems: _cartItems));
    // });

    on<IncreaseProductQuantity>((event, emit) {
      for (var brand in _cartItems) {
        final itemIndex =
            brand.items.indexWhere((i) => i.variantId == event.variantId);
        if (itemIndex != -1) {
          brand.items[itemIndex] = CartItemEntity(
            id: brand.items[itemIndex].id,
            variantId: brand.items[itemIndex].variantId,
            imageLink: brand.items[itemIndex].imageLink,
            amount: brand.items[itemIndex].amount + 1,
            // tăng
            pinned: brand.items[itemIndex].pinned,
            productVariant: brand.items[itemIndex].productVariant,
          );

          final updatedItem = brand.items[itemIndex];
          final selectedIndex = _selectedItems
              .indexWhere((i) => i.variantId == updatedItem.variantId);
          if (selectedIndex != -1) {
            _selectedItems[selectedIndex] = updatedItem;
            _selectedItems = List.from(_selectedItems);
          }

          break;
        }
      }

      final totalMoney = _cartItems.fold<int>(0, (sum, brandCart) {
        return sum +
            brandCart.items.fold<int>(0, (itemSum, item) {
              return itemSum + item.amount * item.productVariant.price;
            });
      });

      emit(CartUpdated(List.from(_cartItems), totalMoney, List.from(_selectedItems)));
    });

    on<DecreaseProductQuantity>((event, emit) {
      for (var brand in _cartItems) {
        final itemIndex =
            brand.items.indexWhere((i) => i.variantId == event.variantId);
        if (itemIndex != -1) {
          brand.items[itemIndex] = CartItemEntity(
            id: brand.items[itemIndex].id,
            variantId: brand.items[itemIndex].variantId,
            imageLink: brand.items[itemIndex].imageLink,
            amount: brand.items[itemIndex].amount - 1,
            pinned: brand.items[itemIndex].pinned,
            productVariant: brand.items[itemIndex].productVariant,
          );

          final updatedItem = brand.items[itemIndex];
          final selectedIndex = _selectedItems
              .indexWhere((i) => i.variantId == updatedItem.variantId);
          if (selectedIndex != -1) {
            _selectedItems[selectedIndex] = updatedItem;
            _selectedItems = List.from(_selectedItems);
          }

          break;
        }
      }

      final totalMoney = _cartItems.fold<int>(0, (sum, brandCart) {
        return sum +
            brandCart.items.fold<int>(0, (itemSum, item) {
              return itemSum + item.amount * item.productVariant.price;
            });
      });

      emit(CartUpdated(List.from(_cartItems), totalMoney, List.from(_selectedItems)));
    });

    on<UpdateProductQuantity>((event, emit) {
      for (var brand in _cartItems) {
        final index =
            brand.items.indexWhere((item) => item.variantId == event.variantId);
        if (index != -1) {
          brand.items[index] = CartItemEntity(
            id: brand.items[index].id,
            variantId: brand.items[index].variantId,
            imageLink: brand.items[index].imageLink,
            amount: event.quantity,
            pinned: brand.items[index].pinned,
            productVariant: brand.items[index].productVariant,
          );

          final updatedItem = brand.items[index];
          final selectedIndex = _selectedItems
              .indexWhere((i) => i.variantId == updatedItem.variantId);
          if (selectedIndex != -1) {
            _selectedItems[selectedIndex] = updatedItem;
            _selectedItems = List.from(_selectedItems);
          }

          break;
        }
      }
      final totalMoney = _cartItems.fold<int>(0, (sum, brandCart) {
        return sum +
            brandCart.items.fold<int>(0, (itemSum, item) {
              return itemSum + item.amount * item.productVariant.price;
            });
      });

      emit(CartUpdated(List.from(_cartItems), totalMoney, List.from(_selectedItems)));
    });

    on<ToggleVariantSelection>((event, emit) {
      final CartItemEntity? item = _cartItems
          .expand((b) => b.items)
          .firstWhereOrNull((i) => i.variantId == event.variantId);

      if (item == null) return;

      final alreadySelected =
          _selectedItems.any((i) => i.variantId == event.variantId);
      if (alreadySelected) {
        _selectedItems.removeWhere((i) => i.variantId == event.variantId);
      } else {
        _selectedItems.add(item);
      }

      _selectedItems = List.from(_selectedItems);

      final totalMoney = _selectedItems.fold<int>(
        0,
        (sum, i) => sum + i.amount * i.productVariant.price,
      );

      emit(CartUpdated(List.from(_cartItems), totalMoney, List.from(_selectedItems)));
    });

    on<ToggleAllVariantsSelection>((event, emit) {
      _selectedItems.clear();

      if (event.selectAll) {
        _selectedItems = _cartItems.expand((b) => b.items).toList();
      }

      _selectedItems = List.from(_selectedItems);

      final totalMoney = _selectedItems.fold<int>(
        0,
        (sum, i) => sum + i.amount * i.productVariant.price,
      );
      emit(CartUpdated(List.from(_cartItems), totalMoney, List.from(_selectedItems)));
    });

    on<ToggleBrandSelection>((event, emit) {
      final brand = _cartItems.firstWhereOrNull((b) => b.brandId == event.brandId);

      if (brand == null) return;

      if(event.selected) {
        for( var item in brand.items) {
          final alreadySelected = _selectedItems.any((i) => i.variantId == item.variantId);
          if (!alreadySelected) {
            _selectedItems.add(item);
          }
        }
      } else  {
          _selectedItems.removeWhere((i) => brand.items.any((item) => item.variantId == i.variantId));
      }

      _selectedItems = List.from(_selectedItems);


      final totalMoney = _selectedItems.fold<int>(
        0, (sum, i) => sum + i.amount * i.productVariant.price,
      );

      emit(CartUpdated(List.from(_cartItems), totalMoney, List.from(_selectedItems)));
    });
  }
}
