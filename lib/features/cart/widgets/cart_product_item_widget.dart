import 'package:flutter/material.dart';

import '../../../app/app_colors.dart';
import '../../../app/assets_path.dart';
import '../../common/ui/widgets/product_quantity_inc_dec_button.dart';

class CartProductItemWidget extends StatelessWidget {
  const CartProductItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
        elevation: 3,
        color: Colors.white,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4,
            children: [
              Image.asset(
                AssetsPath.dummyImagePng,
                width: 90,
                height: 90,
                fit: BoxFit.scaleDown,
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Nike Shoe - AK45394 New Year Deal',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: textTheme.bodyLarge,
                          ),
                        ),
                      ],
                    ),
                    const Row(
                      children: [
                        Text('Color: Blue'),
                        SizedBox(
                          width: 8,
                        ),
                        Text('Size: XL'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$100',
                          style: textTheme.titleMedium
                              ?.copyWith(color: AppColors.themeColor),
                        ),
                        ProductQuantityIncDecButton(onChange: (int noOfItem) {})
                      ],
                    )
                  ],
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                  )),
            ],
          ),
        ));
  }
}
