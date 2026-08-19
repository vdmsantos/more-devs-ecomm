import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/features/home/controllers/home_controller.dart';
import 'package:more_devs_do_zero/features/home/models/categoria.dart';
import 'package:more_devs_do_zero/features/home/models/produto.dart';
import 'package:more_devs_do_zero/shared/app_colors.dart';
import 'package:more_devs_do_zero/shared/app_text_style.dart';
import 'package:more_devs_do_zero/shared/models/usuario.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.usuario});

  static const String route = '/home';

  final Usuario usuario;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController homeController = HomeController(
    usuario: widget.usuario,
  );

  @override
  void initState() {
    super.initState();
    homeController.carregarDados();
  }

  @override
  void dispose() {
    homeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //ChangeNotifierProvider.value apenas expõe o HomeController já criado
    //para os widgets filhos via Consumer/context.watch, sem gerenciar seu ciclo de vida
    return ChangeNotifierProvider.value(
      value: homeController,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Olá, ${widget.usuario.nome}',
                      style: AppTextStyle.title,
                    ),
                    Icon(Icons.shopping_cart_outlined),
                  ],
                ),
                SizedBox(height: 24),
                _SectionTitle(title: 'Categorias'),
                SizedBox(height: 12),
                //Consumer reconstrói apenas esse trecho sempre que o
                //HomeController chama notifyListeners(), sem precisar de setState
                Consumer<HomeController>(
                  builder: (context, controller, _) {
                    if (controller.isLoadingCategorias) {
                      return SizedBox(
                        height: 90,
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                    return SizedBox(
                      height: 90,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.categorias.length,
                        separatorBuilder: (_, _) => SizedBox(width: 16),
                        itemBuilder: (context, index) {
                          return _CategoriaItem(
                            categoria: controller.categorias[index],
                          );
                        },
                      ),
                    );
                  },
                ),
                SizedBox(height: 24),
                _SectionTitle(title: 'Produtos'),
                SizedBox(height: 12),
                Consumer<HomeController>(
                  builder: (context, controller, _) {
                    if (controller.isLoadingProdutos) {
                      return SizedBox(
                        height: 190,
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                    return SizedBox(
                      height: 190,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.produtos.length,
                        separatorBuilder: (_, _) => SizedBox(width: 16),
                        itemBuilder: (context, index) {
                          return _ProdutoCard(
                            produto: controller.produtos[index],
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyle.title.copyWith(fontSize: 18)),
        Icon(Icons.chevron_right),
      ],
    );
  }
}

class _Banner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 130,
        color: AppColors.grey100,
        padding: const EdgeInsets.all(16),
        alignment: Alignment.centerLeft,
        child: Text(
          'Aproveite as\nofertas',
          style: AppTextStyle.title.copyWith(fontSize: 20),
        ),
      ),
    );
  }
}

class _CategoriaItem extends StatelessWidget {
  const _CategoriaItem({required this.categoria});

  final Categoria categoria;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(
          child: Image.network(
            categoria.imagemUrl,
            width: 56,
            height: 56,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, progress) {
              if (progress == null) return child;
              return _placeholder(56);
            },
            errorBuilder: (context, error, stackTrace) => _placeholder(56),
          ),
        ),
        SizedBox(height: 4),
        Text(categoria.nome, style: AppTextStyle.smallBlack),
      ],
    );
  }

  Widget _placeholder(double size) {
    return Container(width: size, height: size, color: AppColors.grey100);
  }
}

class _ProdutoCard extends StatelessWidget {
  const _ProdutoCard({required this.produto});

  final Produto produto;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              produto.imagemUrl,
              width: 130,
              height: 110,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, progress) {
                if (progress == null) return child;
                return _placeholder();
              },
              errorBuilder: (context, error, stackTrace) => _placeholder(),
            ),
          ),
          SizedBox(height: 8),
          Text(produto.marca, style: AppTextStyle.smallGrey),
          Text(produto.nome, style: AppTextStyle.smallBlack),
          Text(
            'R\$${produto.preco.toStringAsFixed(2)}',
            style: AppTextStyle.smallGreen,
          ),
        ],
      ),
    );
  }

  Widget _placeholder() {
    return Container(width: 130, height: 110, color: AppColors.grey100);
  }
}
