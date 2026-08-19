import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/features/home/models/categoria.dart';
import 'package:more_devs_do_zero/features/home/models/produto.dart';
import 'package:more_devs_do_zero/shared/models/usuario.dart';

//Controller que estende ChangeNotifier: quem estiver "ouvindo" (addListener)
//é notificado (notifyListeners) sempre que o estado mudar, sem precisar de setState
class HomeController extends ChangeNotifier {
  HomeController({required this.usuario});

  final Usuario usuario;

  bool isLoadingCategorias = false;
  bool isLoadingProdutos = false;

  List<Categoria> categorias = [];
  List<Produto> produtos = [];

  Future<void> carregarDados() async {
    await Future.wait([_carregarCategorias(), _carregarProdutos()]);
  }

  Future<void> _carregarCategorias() async {
    isLoadingCategorias = true;
    notifyListeners();

    //Simula chamada da API
    await Future.delayed(const Duration(seconds: 2));

    categorias = [
      Categoria(
        nome: 'Frutas',
        imagemUrl:
            'https://images.unsplash.com/photo-1619566636858-adf3ef46400b?w=200',
      ),
      Categoria(
        nome: 'Verduras',
        imagemUrl:
            'https://images.unsplash.com/photo-1540420773420-3366772f4999?w=200',
      ),
      Categoria(
        nome: 'Padaria',
        imagemUrl:
            'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=200',
      ),
      Categoria(
        nome: 'Importados',
        imagemUrl:
            'https://images.unsplash.com/photo-1523473827533-2a64d0d36748?w=200',
      ),
    ];

    isLoadingCategorias = false;
    notifyListeners();
  }

  Future<void> _carregarProdutos() async {
    isLoadingProdutos = true;
    notifyListeners();

    //Simula chamada da API
    await Future.delayed(const Duration(seconds: 3));

    produtos = [
      Produto(
        nome: 'Rabanete',
        marca: 'Natural da terra',
        preco: 10.99,
        imagemUrl:
            'https://images.unsplash.com/photo-1590779033100-9f60a05a013d?w=300',
      ),
      Produto(
        nome: 'Acerola',
        marca: 'Akatsu',
        preco: 7.99,
        imagemUrl:
            'https://images.unsplash.com/photo-1596591868231-05e908752cc9?w=300',
      ),
      Produto(
        nome: 'Cogumelo',
        marca: 'Natural da terra',
        preco: 12.10,
        imagemUrl:
            'https://images.unsplash.com/photo-1504545102780-26774c1bb073?w=300',
      ),
    ];

    isLoadingProdutos = false;
    notifyListeners();
  }
}
