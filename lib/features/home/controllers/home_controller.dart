import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/features/home/models/category.dart';
import 'package:more_devs_do_zero/features/home/models/product.dart';

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
      // simula uma resposta JSON vinda de uma API

      for (var element in productsJson) {
        products.add(Product.fromJson(element));
      }
      changeIsProductsLoading(false);
    });
  }

  void getCategories() {
    changeIsCategoriesLoading(true);
    Future.delayed(const Duration(seconds: 5), () {
      // simula uma resposta JSON vinda de uma API

      for (var element in categoriesJson) {
        categories.add(Category.fromJson(element));
      }
      changeIsCategoriesLoading(false);
    });
  }

  void onPageChanged(int index) {
    currentIndex = index;
    notifyListeners();
  }
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

final List<Map<String, dynamic>> productsJson = [
  {
    'brand': 'Natural da terra',
    'name': 'Rabanete',
    'imageUrl': 'https://i.postimg.cc/8Pt82Qmf/Image-1.png',
    'price': 10.99,
  },
  {
    'brand': 'Akatsu',
    'name': 'Acerola',
    'imageUrl': 'https://i.postimg.cc/BQMWr9B8/Image.png',
    'price': 7.99,
  },
  {
    'brand': 'Natural da terra',
    'name': 'Cogumelo',
    'imageUrl': 'https://i.postimg.cc/RVP8P1vw/Image-2.png',
    'price': 12.19,
  },
  {
    'brand': 'Natural da terra',
    'name': 'Cogumelo',
    'imageUrl': 'https://i.postimg.cc/RVP8P1vw/Image-2.png',
    'price': 12.19,
  },
];
final List<Map<String, dynamic>> categoriesJson = [
  {'name': 'Frutas', 'imageUrl': 'https://i.postimg.cc/SNX7hc6F/Image.png'},
  {
    'name': 'Verduras',
    'imageUrl': 'https://i.postimg.cc/8PFBSLh2/Image-(1).png',
  },
  {'name': 'Padaria', 'imageUrl': 'https://i.postimg.cc/xTky2LvV/Image-1.png'},
  {
    'name': 'Importados',
    'imageUrl': 'https://i.postimg.cc/Yq4fHQ6w/Image-2.png',
  },
];
