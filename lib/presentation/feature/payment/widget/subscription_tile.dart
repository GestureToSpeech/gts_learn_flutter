import 'package:flutter/material.dart';
import 'package:gts_learn/presentation/style/app_colors.dart';
import 'package:purchases_flutter/models/store_product_wrapper.dart';

class SubscriptionTile extends StatelessWidget {
  const SubscriptionTile({
    super.key,
    required this.product,
    required this.selected,
    required this.onTap,
  });

  final StoreProduct product;
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
        trailing: Text(product.priceString),
        onTap: onTap,
      ),
    );
  }
}
