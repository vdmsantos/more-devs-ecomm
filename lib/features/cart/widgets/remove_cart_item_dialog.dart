import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/features/cart/controllers/cart_controller.dart';
import 'package:more_devs_do_zero/features/cart/models/cart_item_model.dart';
import 'package:more_devs_do_zero/shared/app_colors.dart';
import 'package:more_devs_do_zero/shared/app_text_style.dart';

//Diminui a quantidade do item. Quando é a última unidade, pede
//confirmação num diálogo antes de remover o produto do carrinho.
Future<void> decrementCartItem(
  BuildContext context,
  CartController controller,
  CartItem item,
) async {
  if (item.quantity > 1) {
    controller.decrement(item);
    return;
  }

  final confirmed = await RemoveCartItemDialog.show(context, item.name);
  if (confirmed) controller.removeItem(item);
}

//Diálogo de confirmação para remover um produto do carrinho.
//Retorna true quando o usuário confirma a remoção.
class RemoveCartItemDialog extends StatelessWidget {
  const RemoveCartItemDialog({super.key, required this.productName});

  final String productName;

  static Future<bool> show(BuildContext context, String productName) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => RemoveCartItemDialog(productName: productName),
    );
    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      title: Text('Remover item', style: AppTextStyle.title),
      content: Text(
        'Deseja remover "$productName" do carrinho?',
        style: AppTextStyle.body,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text('Cancelar', style: TextStyle(color: AppColors.grey)),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text('Remover', style: TextStyle(color: AppColors.red)),
        ),
      ],
    );
  }
}
