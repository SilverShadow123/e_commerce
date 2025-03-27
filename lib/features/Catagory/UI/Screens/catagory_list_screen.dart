import 'package:e_commerce/features/common/ui/controllers/category_list_controller.dart';
import 'package:e_commerce/features/common/ui/controllers/main_bottom_nav_controller.dart';
import 'package:e_commerce/features/common/ui/widgets/catagory_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatagoryListScreen extends StatelessWidget {
  const CatagoryListScreen({super.key});

  static const String name = 'catagory-list-screen';

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        _onPop();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Catagory List'),
          leading: IconButton(
            onPressed: _onPop,
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            Get.find<CategoryListController>().getCategoryList();
          },
          child: GetBuilder<CategoryListController>(builder: (controller) {
            if (controller.inProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return GridView.builder(
                itemCount: controller.categoryList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  return FittedBox(
                    child: CategoryItemWidget(
                      categoryModel: controller.categoryList[index],
                    ),
                  );
                });
          }),
        ),
      ),
    );
  }

  void _onPop() {
    Get.find<MainBottomNavController>().backToHome();
  }
}
