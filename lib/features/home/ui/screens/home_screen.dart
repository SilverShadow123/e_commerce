import 'package:e_commerce/app/assets_path.dart';
import 'package:e_commerce/features/common/ui/controllers/category_list_controller.dart';
import 'package:e_commerce/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:e_commerce/features/common/ui/widgets/center_circular_progress_indicator.dart';
import 'package:e_commerce/features/home/ui/controllers/home_banner_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../common/data/models/category_model.dart';
import '../widgets/app_bar_icon_button.dart';
import '../../../common/ui/widgets/catagory_item_widget.dart';
import '../widgets/home_carousel_slider.dart';
import '../widgets/home_section_header.dart';
import '../../../common/ui/widgets/product_item_widget.dart';
import '../widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String name = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchBarController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              product_search_bar(
                controller: _searchBarController,
              ),
              const SizedBox(
                height: 16,
              ),
              GetBuilder<HomeBannerListController>(builder: (controller) {
                if (controller.inProgress) {
                  return SizedBox(
                    height: 180,
                    child: CenterCircularProgressIndicator(),
                  );
                }

                return carousel_home_slider(
                  bannerList: controller.bannerList,
                );
              }),
              const SizedBox(
                height: 16,
              ),
              HomeSectionHeader(
                tittle: 'Catagory',
                onTap: () {
                  Get.find<MainBottomNavController>().moveToCatagory();
                },
              ),
              const SizedBox(
                height: 8,
              ),
              GetBuilder<CategoryListController>(builder: (controller) {
                if (controller.inProgress) {
                  return SizedBox(
                    height: 180,
                    child: CenterCircularProgressIndicator(),
                  );
                }

                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _getCatagoryList(controller.categoryList),
                  ),
                );
              }),
              const SizedBox(
                height: 8,
              ),
              HomeSectionHeader(
                tittle: 'Popular',
                onTap: () {},
              ),
              const SizedBox(
                height: 8,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _getProductList(),
                ),
              ),
              HomeSectionHeader(
                tittle: 'Special',
                onTap: () {},
              ),
              const SizedBox(
                height: 8,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _getProductList(),
                ),
              ),
              HomeSectionHeader(
                tittle: 'New',
                onTap: () {},
              ),
              const SizedBox(
                height: 8,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _getProductList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _getCatagoryList(List<CategoryModel> categoryModels) {
    List<Widget> catagoryList = [];
    for (int i = 0; i < categoryModels.length; i++) {
      catagoryList.add(
        Padding(
          padding: EdgeInsets.only(right: 8),
          child: CategoryItemWidget(
            categoryModel: categoryModels[i],
          ),
        ),
      );
    }
    return catagoryList;
  }

  List<Widget> _getProductList() {
    List<Widget> productList = [];
    for (int i = 0; i < 10; i++) {
      productList.add(
        const Padding(
          padding: EdgeInsets.only(right: 8),
          child: ProductItemWidget(),
        ),
      );
    }
    return productList;
  }

  AppBar _buildAppbar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.navappLogoSvg),
      actions: [
        AppBarIconButton(
          icon: Icons.person,
          onTap: () {},
        ),
        const SizedBox(
          width: 6,
        ),
        AppBarIconButton(
          icon: Icons.call,
          onTap: () {},
        ),
        const SizedBox(
          width: 6,
        ),
        AppBarIconButton(
          icon: Icons.notifications_active_outlined,
          onTap: () {},
        ),
      ],
    );
  }
}
