import 'package:line_icons/line_icons.dart';

int selectedItems_1 = 1;
int selectedItems_2 = 1;
int selectedItems_3 = 1;
bool plusIsVisible_1 = false;
bool minusIsVisible_1 = true;
bool plusIsVisible_2 = false;
bool minusIsVisible_2 = true;
bool plusIsVisible_3 = false;
bool minusIsVisible_3 = true;

List myCartJson = [
  {
    "image": "assets/images/shoes_8_.png",
    "rate": "4.0",
    "name": "Nike ISPA Link",
    "price": "242,25",
    "plusIcon": LineIcons.plusSquare,
    "minusIcon": LineIcons.minusSquare,
    "selectedItems": selectedItems_1,
    "plusIsVisible": plusIsVisible_1,
    "minusIsVisible": minusIsVisible_1,
    "colors": [
      "assets/images/shoes_8_.png",
      "assets/images/shoes_8_1_.png",
    ]
  },
  {
    "image": "assets/images/shoes_7_.png",
    "rate": "4.5",
    "name": "Air Jordan 3 Retro",
    "price": "197,21",
    "plusIcon": LineIcons.plusSquare,
    "minusIcon": LineIcons.minusSquare,
    "selectedItems": selectedItems_2,
    "plusIsVisible": plusIsVisible_2,
    "minusIsVisible": minusIsVisible_2,
    "colors": [
      "assets/images/shoes_7_.png",
      "assets/images/shoes_7_1_.png",
      "assets/images/shoes_7_2_.png",
    ]
  },
  {
    "image": "assets/images/shoes_3_1_.png",
    "rate": "5.1",
    "name": "Air Jordan 6 Retro",
    "price": "192,23",
    "plusIcon": LineIcons.plusSquare,
    "minusIcon": LineIcons.minusSquare,
    "selectedItems": selectedItems_3,
    "plusIsVisible": plusIsVisible_3,
    "minusIsVisible": minusIsVisible_3,
    "colors": ["assets/images/shoes_3_1_.png", "assets/images/shoes_3_.png"]
  },
];
