import 'package:flutter/material.dart';
import 'package:gts_learn/domain/model/product_entity.dart';
import 'package:gts_learn/presentation/style/app_colors.dart';

class SubscriptionTile extends StatelessWidget {
  const SubscriptionTile({
    super.key,
    required this.product,
    required this.selected,
    required this.onTap,
  });

  final ProductEntity product;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: selected ? AppColors.mainGreen : AppColors.white,
      child: ListTile(
        selected: selected,
        title: Text(product.title),
        subtitle: Text(product.description),
        trailing: Text('${product.price} ${product.currencyCode}'),
        onTap: onTap,
      ),
    );
  }
}
