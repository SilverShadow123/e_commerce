import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/app/app_colors.dart';
import 'package:e_commerce/features/home/data/models/banner_model.dart';
import 'package:flutter/material.dart';

class carousel_home_slider extends StatefulWidget {
  const carousel_home_slider({
    super.key,
    required this.bannerList,
  });

  final List<CategoryModel> bannerList;

  @override
  State<carousel_home_slider> createState() => _carousel_home_sliderState();
}

class _carousel_home_sliderState extends State<carousel_home_slider> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 200.0,
              viewportFraction: 0.95,
              onPageChanged: (currentIndex, reason) {
                _selectedIndex.value = currentIndex;
              }),
          items: widget.bannerList.map((banner) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      image: DecorationImage(
                        image: NetworkImage(banner.image ?? ''),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            banner.title ?? '',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,

                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            width: 120,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text('Buy Now'),
                            ),
                          ),
                        ],
                      ),
                    ));
              },
            );
          }).toList(),
        ),
        const SizedBox(
          height: 4,
        ),
        ValueListenableBuilder(
          valueListenable: _selectedIndex,
          builder: (context, value, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < widget.bannerList.length; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Container(
                      height: 16,
                      width: 16,
                      decoration: BoxDecoration(
                        color: value == i
                            ? AppColors.themeColor
                            : Colors.transparent,
                        border: Border.all(
                          color: Colors.grey.shade300,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
              ],
            );
          },
        )
      ],
    );
  }
}
