import 'package:e_commerce/features/product/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import '../../../../app/app_colors.dart';
import '../../data/models/category_model.dart';


class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    super.key, required this.categoryModel,
  });
final CategoryModel categoryModel;
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
            child: Image.network(categoryModel.categoryImg?? '', width: 40,height: 40,fit: BoxFit.scaleDown,),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            categoryModel.categoryName ?? '',
            style: const TextStyle(
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