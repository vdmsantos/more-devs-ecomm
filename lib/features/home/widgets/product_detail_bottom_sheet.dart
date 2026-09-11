import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/features/cart/controllers/cart_controller.dart';
import 'package:more_devs_do_zero/features/cart/widgets/quantity_stepper.dart';
import 'package:more_devs_do_zero/features/cart/widgets/remove_cart_item_dialog.dart';
import 'package:more_devs_do_zero/features/home/models/product_model.dart';
import 'package:more_devs_do_zero/shared/app_colors.dart';
import 'package:more_devs_do_zero/shared/app_text_style.dart';
import 'package:more_devs_do_zero/shared/widgets/app_elevated_button.dart';
import 'package:provider/provider.dart';

class ProductDetailBottomSheet extends StatelessWidget {
  const ProductDetailBottomSheet({super.key, required this.product});

  final Product product;

  static Future<void> show(BuildContext context, Product product) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => ProductDetailBottomSheet(product: product),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.grey100,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: AspectRatio(
                aspectRatio: 1.4,
                child: Image.network(product.imageUrl, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 16),
            Text(product.name, style: AppTextStyle.title),
            const SizedBox(height: 4),
            Text(product.brand, style: AppTextStyle.subtitleGrey),
            const SizedBox(height: 12),
            Text(product.description, style: AppTextStyle.body),
            const SizedBox(height: 16),
            Text(
              'R\$ ${product.price.toStringAsFixed(2).replaceAll('.', ',')}',
              style: AppTextStyle.priceLarge,
            ),
            const SizedBox(height: 16),
            Consumer<CartController>(
              builder: (context, cart, child) {
                final item = cart.itemOf(product);

                if (item == null) {
                  return AppElevatedButton(
                    label: 'Adicionar no carrinho',
                    type: ButtonType.filled,
                    onPressed: () => cart.addProduct(product),
                  );
                }

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('No carrinho', style: AppTextStyle.subtitleGrey),
                    QuantityStepper(
                      quantity: item.quantity,
                      onIncrement: () => cart.increment(item),
                      onDecrement: () => decrementCartItem(context, cart, item),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
