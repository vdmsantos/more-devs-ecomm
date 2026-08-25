import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  int currentIndex = 0;
  final CarouselSliderController controller = CarouselSliderController();

  List<Product> products = [];
  bool isProductsLoading = false;
  bool isCategoriesLoading = false;

  List<Category> categories = [];

  void changeIsProductsLoading(bool value) {
    isProductsLoading = value;
    notifyListeners();
  }

  void changeIsCategoriesLoading(bool value) {
    isCategoriesLoading = value;
    notifyListeners();
  }

  void getProducts() {
    changeIsProductsLoading(true);
    Future.delayed(const Duration(seconds: 5), () {
      products = [
        Product(
          brand: 'Natural da terra',
          name: 'Rabanete',
          imageUrl: 'https://i.postimg.cc/8Pt82Qmf/Image-1.png',
          price: 10.99,
        ),
        Product(
          brand: 'Akatsu',
          name: 'Acerola',
          imageUrl: 'https://i.postimg.cc/BQMWr9B8/Image.png',
          price: 7.99,
        ),
        Product(
          brand: 'Natural da terra',
          name: 'Cogumelo',
          imageUrl: 'https://i.postimg.cc/RVP8P1vw/Image-2.png',
          price: 12.19,
        ),
        Product(
          brand: 'Natural da terra',
          name: 'Cogumelo',
          imageUrl: 'https://i.postimg.cc/RVP8P1vw/Image-2.png',
          price: 12.19,
        ),
      ];
      changeIsProductsLoading(false);
    });
  }

  void getCategories() {
    changeIsCategoriesLoading(true);
    Future.delayed(const Duration(seconds: 5), () {
      categories = [
        Category(
          name: 'Frutas',
          imageUrl: 'https://i.postimg.cc/SNX7hc6F/Image.png',
        ),
        Category(
          name: 'Verduras',
          imageUrl: 'https://i.postimg.cc/8PFBSLh2/Image-(1).png',
        ),
        Category(
          name: 'Padaria',
          imageUrl: 'https://i.postimg.cc/xTky2LvV/Image-1.png',
        ),
        Category(
          name: 'Importados',
          imageUrl: 'https://i.postimg.cc/Yq4fHQ6w/Image-2.png',
        ),
      ];
      changeIsCategoriesLoading(false);
    });
  }

  void onPageChanged(int index) {
    currentIndex = index;
    notifyListeners();
  }
}

class Product {
  final String brand;
  final String name;
  final String imageUrl;
  final double price;

  Product({
    required this.brand,
    required this.name,
    required this.imageUrl,
    required this.price,
  });
}

class Category {
  final String name;
  final String imageUrl;

  Category({required this.name, required this.imageUrl});
}

// produtos
// https://i.postimg.cc/8Pt82Qmf/Image-1.png
// https://i.postimg.cc/BQMWr9B8/Image.png
// https://i.postimg.cc/RVP8P1vw/Image-2.png

// categorias
// https://i.postimg.cc/SNX7hc6F/Image.png
// https://i.postimg.cc/8PFBSLh2/Image-(1).png
// https://i.postimg.cc/xTky2LvV/Image-1.png
// https://i.postimg.cc/Yq4fHQ6w/Image-2.png
