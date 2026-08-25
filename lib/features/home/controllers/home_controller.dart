import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/features/home/models/category.dart';
import 'package:more_devs_do_zero/features/home/models/product.dart';
import 'package:more_devs_do_zero/shared/view_state.dart';

class HomeController extends ChangeNotifier {
  int currentIndex = 0;
  final CarouselSliderController controller = CarouselSliderController();

  List<Product> products = [];
  ViewState productsState = ViewState.loading;

  List<Category> categories = [];
  ViewState categoriesState = ViewState.loading;

  void _changeProductsState(ViewState value) {
    productsState = value;
    notifyListeners();
  }

  void _changeCategoriesState(ViewState value) {
    categoriesState = value;
    notifyListeners();
  }

  void getProducts() {
    _changeProductsState(ViewState.loading);
    Future.delayed(const Duration(seconds: 5), () {
      // simula uma resposta JSON vinda de uma API
      try {
        products = [
          for (var element in productsJson) Product.fromJson(element),
        ];
        _changeProductsState(ViewState.success);
      } catch (e) {
        _changeProductsState(ViewState.error);
      }
    });
  }

  void getCategories() {
    _changeCategoriesState(ViewState.loading);
    Future.delayed(const Duration(seconds: 5), () {
      // simula uma resposta JSON vinda de uma API
      try {
        categories = [
          for (var element in categoriesJson) Category.fromJson(element),
        ];
        _changeCategoriesState(ViewState.success);
      } catch (e) {
        _changeCategoriesState(ViewState.error);
      }
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
