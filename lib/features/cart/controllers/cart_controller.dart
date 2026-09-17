import 'package:flutter/foundation.dart';
import 'package:more_devs_do_zero/features/cart/models/cart_item_model.dart';
import 'package:more_devs_do_zero/features/home/models/product_model.dart';

class CartController extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  bool get isEmpty => _items.isEmpty;

  int get itemCount => _items.fold(0, (total, item) => total + item.quantity);

  double get total => _items.fold(0, (total, item) => total + item.subtotal);

  int _indexOfProduct(Product product) {
    return _items.indexWhere(
      (item) => item.name == product.name && item.brand == product.brand,
    );
  }

  CartItem? itemOf(Product product) {
    final index = _indexOfProduct(product);
    return index >= 0 ? _items[index] : null;
  }

  int quantityOf(Product product) => itemOf(product)?.quantity ?? 0;

  void addProduct(Product product) {
    final index = _indexOfProduct(product);
    if (index >= 0) {
      _items[index] = _items[index].copyWith(
        quantity: _items[index].quantity + 1,
      );
    } else {
      _items.add(CartItem.fromProduct(product));
    }
    notifyListeners();
  }

  void increment(CartItem item) {
    final index = _indexOfProduct(item);
    if (index < 0) return;
    _items[index] = _items[index].copyWith(
      quantity: _items[index].quantity + 1,
    );
    notifyListeners();
  }

  void decrement(CartItem item) {
    final index = _indexOfProduct(item);
    if (index < 0) return;
    final newQuantity = _items[index].quantity - 1;
    if (newQuantity <= 0) {
      _items.removeAt(index);
    } else {
      _items[index] = _items[index].copyWith(quantity: newQuantity);
    }
    notifyListeners();
  }

  void removeItem(CartItem item) {
    _items.removeWhere(
      (element) => element.name == item.name && element.brand == item.brand,
    );
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
