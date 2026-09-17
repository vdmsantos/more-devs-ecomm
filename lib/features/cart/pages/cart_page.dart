import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/features/cart/controllers/cart_controller.dart';
import 'package:more_devs_do_zero/features/cart/widgets/cart_item_card.dart';
import 'package:more_devs_do_zero/features/cart/widgets/empty_cart.dart';
import 'package:more_devs_do_zero/features/cart/widgets/remove_cart_item_dialog.dart';
import 'package:more_devs_do_zero/shared/app_colors.dart';
import 'package:more_devs_do_zero/shared/app_text_style.dart';
import 'package:more_devs_do_zero/shared/widgets/app_elevated_button.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  static const String route = '/cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Carrinho', style: AppTextStyle.title),
      ),
      body: Consumer<CartController>(
        builder: (context, controller, child) {
          if (controller.isEmpty) {
            return EmptyCart(onKeepBuying: () => Navigator.of(context).pop());
          }

          final items = controller.items;

          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: items.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return CartItemCard(
                      item: item,
                      onIncrement: () => controller.increment(item),
                      onDecrement: () =>
                          decrementCartItem(context, controller, item),
                    );
                  },
                ),
              ),
              _CartSummary(
                total: controller.total,
                onContinue: () {},
              ),
            ],
          );
        },
      ),
    );
  }
}

class _CartSummary extends StatelessWidget {
  const _CartSummary({required this.total, required this.onContinue});

  final double total;
  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(top: BorderSide(color: AppColors.grey100)),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Text(
              'R\$ ${total.toStringAsFixed(2).replaceAll('.', ',')}',
              style: AppTextStyle.priceLarge,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: AppElevatedButton(
                label: 'Continuar',
                type: ButtonType.filled,
                onPressed: onContinue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
