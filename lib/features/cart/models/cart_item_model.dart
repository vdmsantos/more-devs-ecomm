import 'package:more_devs_do_zero/features/home/models/product_model.dart';

//Representa um produto dentro do carrinho junto da sua quantidade
class CartItem extends Product {
  final int quantity;

  CartItem({
    required super.brand,
    required super.name,
    required super.imageUrl,
    required super.price,
    required super.category,
    super.description,
    this.quantity = 1,
  });

  factory CartItem.fromProduct(Product product, {int quantity = 1}) {
    return CartItem(
      brand: product.brand,
      name: product.name,
      imageUrl: product.imageUrl,
      price: product.price,
      category: product.category,
      description: product.description,
      quantity: quantity,
    );
  }

  //valor total da linha (preço do produto x quantidade)
  double get subtotal => price * quantity;

  CartItem copyWith({int? quantity}) {
    return CartItem(
      brand: brand,
      name: name,
      imageUrl: imageUrl,
      price: price,
      category: category,
      description: description,
      quantity: quantity ?? this.quantity,
    );
  }
}
