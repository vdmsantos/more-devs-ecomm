import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/shared/app_colors.dart';
import 'package:more_devs_do_zero/shared/app_text_style.dart';
import 'package:more_devs_do_zero/shared/widgets/app_elevated_button.dart';

//Estado exibido quando o carrinho não possui nenhum item
class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key, this.onKeepBuying});

  final VoidCallback? onKeepBuying;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.grey100,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.shopping_cart_outlined,
                size: 48,
                color: AppColors.grey,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Seu carrinho está vazio',
              textAlign: TextAlign.center,
              style: AppTextStyle.title,
            ),
            const SizedBox(height: 8),
            Text(
              'Adicione produtos para continuar com a compra.',
              textAlign: TextAlign.center,
              style: AppTextStyle.subtitleGrey,
            ),
            if (onKeepBuying != null) ...[
              const SizedBox(height: 24),
              AppElevatedButton(
                label: 'Continuar comprando',
                type: ButtonType.outlined,
                onPressed: onKeepBuying,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
