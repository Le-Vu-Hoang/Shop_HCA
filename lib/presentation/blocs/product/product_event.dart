import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object?> get props => [];
}

class FetchProducts extends ProductEvent {}
class FetchProductsByFilter extends ProductEvent {
  final String filter;

  const FetchProductsByFilter(this.filter);

  @override
  List<Object?> get props => [filter];
}

class LoadMoreProducts extends ProductEvent{}