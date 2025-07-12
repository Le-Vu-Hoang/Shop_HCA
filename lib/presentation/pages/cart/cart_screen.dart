import 'package:flutter/material.dart';

class CartItemUiModel {
  final String id;
  final String name;
  final String imageUrl;
  final int price;
  final int quantity;
  final bool selected;

  CartItemUiModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.quantity,
    required this.selected,
  });
}

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final List<CartItemUiModel> items = [
    CartItemUiModel(
      id: '1',
      name: 'Áo thun local brand',
      imageUrl: 'https://via.placeholder.com/80x80.png?text=Ao+thun',
      price: 150000,
      quantity: 1,
      selected: false,
    ),
    CartItemUiModel(
      id: '2',
      name: 'Quần jeans ống rộng',
      imageUrl: 'https://via.placeholder.com/80x80.png?text=Quan+jeans',
      price: 350000,
      quantity: 2,
      selected: true,
    ),
    CartItemUiModel(
      id: '3',
      name: 'Giày sneaker trắng',
      imageUrl: 'https://via.placeholder.com/80x80.png?text=Sneaker',
      price: 750000,
      quantity: 1,
      selected: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final totalSelected = items
        .where((e) => e.selected)
        .fold(0, (sum, e) => sum + e.price * e.quantity);

    return Scaffold(
      appBar: AppBar(title: const Text('Giỏ hàng')),
      body: Column(
        children: [
          CheckboxListTile(
            value: items.every((e) => e.selected),
            onChanged: (_) {},
            title: const Text('Chọn tất cả'),
          ),
          const Divider(),
          Expanded(
            child: ListView.separated(
              itemCount: items.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) {
                final item = items[index];
                return ListTile(
                  leading: Image.network(item.imageUrl, width: 60),
                  title: Text(item.name),
                  subtitle: Text('${item.price} × ${item.quantity}'),
                  trailing: Checkbox(
                    value: item.selected,
                    onChanged: (_) {},
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: ElevatedButton(
          onPressed: totalSelected == 0 ? null : () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.redAccent,
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: Text('Mua ngay - ${totalSelected.toString()} đ'),
        ),
      ),
    );
  }
}
