import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/features/home/controllers/home_controller.dart';
import 'package:more_devs_do_zero/features/home/models/carousel_data.dart';
import 'package:more_devs_do_zero/features/home/models/category.dart';
import 'package:more_devs_do_zero/features/home/models/product.dart';
import 'package:more_devs_do_zero/features/login/controllers/login_controller.dart';
import 'package:more_devs_do_zero/shared/app_colors.dart';
import 'package:more_devs_do_zero/shared/app_text_style.dart';
import 'package:more_devs_do_zero/shared/widgets/app_elevated_button.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String route = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeController>()
        ..getCategories()
        ..getProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const _HomeView();
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  static final List<CarouselData> _carouselItems = [
    CarouselData(
      titulo: 'Aproveite as ofertas',
      imgAsset: 'assets/images/logo.png',
    ),
    CarouselData(
      titulo: 'Aproveite as ofertas',
      imgAsset: 'assets/images/logo.png',
    ),
  ];

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTextStyle.title.copyWith(fontSize: 20)),
          IconButton(
            onPressed: () {},
            style: IconButton.styleFrom(
              backgroundColor: AppColors.grey100,
              shape: const CircleBorder(),
            ),
            icon: Icon(Icons.chevron_right, color: AppColors.black),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(Category category) {
    return SizedBox(
      width: 80,
      child: Column(
        children: [
          ClipOval(
            child: SizedBox(
              width: 72,
              height: 72,
              child: Image.network(
                category.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(color: AppColors.grey100);
                },
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            category.name,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.smallBlack,
          ),
        ],
      ),
    );
  }

  Widget _buildCategories(HomeController homeController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader('Categorias'),
        const SizedBox(height: 8),
        SizedBox(
          height: 108,
          child: homeController.isCategoriesLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: homeController.categories.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 16),
                  itemBuilder: (context, index) {
                    return _buildCategoryItem(homeController.categories[index]);
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildProductItem(Product product) {
    return SizedBox(
      width: 140,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: 140,
              height: 120,
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(color: AppColors.grey100);
                },
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            product.brand,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.smallGrey,
          ),
          Text(
            product.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.smallBlack,
          ),
          Text(
            'R\$ ${product.price.toStringAsFixed(2)}',
            style: AppTextStyle.smallBlack,
          ),
        ],
      ),
    );
  }

  Widget _buildProducts(HomeController homeController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader('Produtos'),
        const SizedBox(height: 8),
        SizedBox(
          height: 210,
          child: homeController.isProductsLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: homeController.products.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 16),
                  itemBuilder: (context, index) {
                    return _buildProductItem(homeController.products[index]);
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildCarouselItem(CarouselData data) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey[300],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text(data.titulo, style: AppTextStyle.title)),
            Expanded(child: Image.asset(data.imgAsset)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<LoginController>(
          builder: (context, loginController, child) {
            return Text(
              'Olá ${loginController.user!.nome}',
              style: AppTextStyle.title,
            );
          },
        ),
      ),
      body: Consumer<HomeController>(
        builder: (context, homeController, child) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  child: CarouselSlider(
                    carouselController: homeController.controller,
                    items: [
                      for (final data in _carouselItems)
                        _buildCarouselItem(data),
                    ],
                    options: CarouselOptions(
                      height: 136,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        homeController.onPageChanged(index);
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(_carouselItems.length, (index) {
                    final isActive = index == homeController.currentIndex;
                    return GestureDetector(
                      onTap: () =>
                          homeController.controller.animateToPage(index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: isActive ? AppColors.black : AppColors.grey100,
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 24),
                _buildCategories(homeController),
                const SizedBox(height: 24),
                _buildProducts(homeController),
                const SizedBox(height: 24),

                AppElevatedButton(
                  label: 'teste',
                  type: ButtonType.filled,
                  onPressed: () {
                    homeController
                      ..getCategories()
                      ..getProducts();
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
