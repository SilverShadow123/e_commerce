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
        body: GridView.builder(
            itemCount: 20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 4,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              return const FittedBox(
                child: CatagoryItemWidget(),
              );
            }),
      ),
    );
  }

  void _onPop() {
    Get.find<MainBottomNavController>().backToHome();
  }
}
