import 'package:e_commerce/features/product/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import '../../../../app/app_colors.dart';

class CatagoryItemWidget extends StatelessWidget {
  const CatagoryItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductListScreen.name,arguments: 'Computer');
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.themeColor.withOpacity(0.13),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.computer,
              color: AppColors.themeColor,
              size: 48,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          const Text(
            'Computer',
            style: TextStyle(
                fontSize: 16,
                color: AppColors.themeColor,
                fontWeight: FontWeight.w600,
                letterSpacing: 1),
          )
        ],
      ),
    );
  }
}