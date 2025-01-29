import 'package:e_commerce/features/Catagory/UI/Screens/catagory_list_screen.dart';
import 'package:e_commerce/features/cart/ui/screens/cart_list_screen.dart';
import 'package:e_commerce/features/home/ui/screens/home_screen.dart';
import 'package:e_commerce/features/wishlist/ui/screens/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/main_bottom_nav_controller.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  static const String name = '/bottom-nav-screen';

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  final MainBottomNavController bottomNavController =
      Get.find<MainBottomNavController>();
  final List<Widget> _screens = const [
    HomeScreen(),
    CatagoryListScreen(),
   CartListScreen(),
    WishListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(builder: (bottomNavController) {
      return Scaffold(
        body: _screens[bottomNavController.selectedIndex],
        bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            NavigationDestination(
                icon: Icon(Icons.category_outlined), label: 'Catagory'),
            NavigationDestination(
                icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
            NavigationDestination(
                icon: Icon(Icons.favorite_border_outlined), label: 'Wishlist'),
          ],
          onDestinationSelected: bottomNavController.changeIndex,
          selectedIndex: bottomNavController.selectedIndex,
        ),
      );
    });
  }
}
