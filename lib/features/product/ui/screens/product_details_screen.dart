import 'package:e_commerce/app/app_colors.dart';
import 'package:e_commerce/features/product/ui/widget/color_picker_widget.dart';
import 'package:e_commerce/features/product/ui/widget/product_image_carousel_slider.dart';
import 'package:e_commerce/features/common/ui/widgets/product_quantity_inc_dec_button.dart';
import 'package:flutter/material.dart';

import '../widget/size_picker_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  static const String name = '/product/product-details';
  final int productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const ProductImageCarouselSlider(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    'Nike Shoe A2ERF - New Year Special Deal',
                                    style: textTheme.titleMedium,
                                  ),
                                  Row(
                                    children: [
                                    const  Icon(
                                        Icons.star,
                                        color: Colors.amberAccent,
                                        size: 18,
                                      ),
                                    const  Text(
                                        '4.5',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey),
                                      ),
                                      TextButton(
                                          onPressed: () {},
                                          child: const Text('Reviews')),
                                      Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          color: AppColors.themeColor,
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        child: const Icon(
                                          Icons.favorite_border,
                                          size: 16,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            ProductQuantityIncDecButton(
                              onChange: (int value) {},
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Color',
                          style: textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        ColorPickerWidget(
                          colors: const ['Red', 'Green', 'Yellow', 'Pink'],
                          onColorSelected: (String selectedColor) {},
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Size',
                          style: textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        SizePickerWidget(
                          size: const ['S', 'M', 'L', 'XL'],
                          onSizeSelected: (String selectedSize) {},
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Description',
                          style: textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                            '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ''',style: TextStyle(color:Colors.grey ,fontWeight: FontWeight.w300),)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildPriceAndAddToCartSection(textTheme)
        ],
      ),
    );
  }

  Widget _buildPriceAndAddToCartSection(TextTheme textTheme) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withOpacity(0.2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                'Price',
                style: textTheme.titleSmall,
              ),
              const Text(
                '\$100',
                style: TextStyle(
                  color: AppColors.themeColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 140,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Add to Cart'),
            ),
          ),
        ],
      ),
    );
  }
}
