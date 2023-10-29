
import 'package:line_icons/line_icons.dart';
import 'package:shoes_app/view/cart_page.dart';
import 'package:shoes_app/view/favourite_page.dart';

import '../view/home_page.dart';
import '../view/order_history.dart';

bool tabSelected_1 = true;
bool tabSelected_2 = false;
bool tabSelected_3 = false;
bool tabSelected_4 = false;

List sideMenuItems = [
  {
    "label": "Home",
    "selected": tabSelected_1,
    "icon": LineIcons.home,
    "page": const HomePage()
  },
  {
    "label": "My Cart",
    "selected": tabSelected_2,
    "icon": LineIcons.shoppingCart,
    "page": const CartPage()
  },
  {
    "label": "Favourite",
    "selected": tabSelected_3,
    "icon": LineIcons.heart,
    "page": const FavouritePage(),
  },
  {
    "label": "Orders",
    "selected": tabSelected_4,
    "icon": LineIcons.history,
    "page": const OrderHistorPage(),
  },
];
