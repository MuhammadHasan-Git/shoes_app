import 'package:animate_do/animate_do.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:shoes_app/controller/getx_controller.dart';
import 'package:shoes_app/theme/colors.dart';
import 'package:shoes_app/view/cart_page.dart';
import 'package:shoes_app/view/favourite_page.dart';
import 'package:shoes_app/view/home_page.dart';
import 'package:shoes_app/view/order_history.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: RootApp(),
    theme: ThemeData(
      fontFamily: 'Poppins',
    ),
  ));
}

class RootApp extends StatelessWidget {
  RootApp({super.key});
  final viewController = Get.put(ViewController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => SalomonBottomBar(
            currentIndex: viewController.pageIndex.value,
            onTap: (index) {
              viewController.pageIndex.value = index;
            },
            items: [
              SalomonBottomBarItem(
                selectedColor: secondary,
                icon: const Icon(LineIcons.home),
                title: const Text("Home"),
              ),
              SalomonBottomBarItem(
                selectedColor: secondary,
                activeIcon: const Icon(LineIcons.heart),
                icon: const Icon(LineIcons.heart),
                title: const Text("Favourite"),
              ),
              SalomonBottomBarItem(
                selectedColor: secondary,
                icon: const Icon(LineIcons.shoppingCart),
                title: const Text("My Cart"),
              ),
              SalomonBottomBarItem(
                selectedColor: secondary,
                icon: const Icon(LineIcons.history),
                title: const Text("Orders"),
              ),
              SalomonBottomBarItem(
                selectedColor: secondary,
                icon: const Icon(Icons.person_outline),
                title: const Text("Account"),
              ),
            ]),
      ),
      body: FadeIn(
        child: Obx(
          () => IndexedStack(
            index: viewController.pageIndex.value,
            children: const [
              HomePage(),
              FavouritePage(),
              CartPage(),
              OrderHistorPage(),
              Center(
                child: Text(
                  "Acount Page",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
