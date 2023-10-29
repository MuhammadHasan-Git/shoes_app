

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shoes_app/dummy/my_cart_json.dart';
import 'package:shoes_app/theme/colors.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60), child: getAppBar()),
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: primary,
      centerTitle: true,
      title: const Text(
        "Cart",
        style: TextStyle(
          fontSize: 18,
          color: secondary,
          fontWeight: FontWeight.w600,
        ),
      ),
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          splashRadius: 17,
          onPressed: () {},
          icon: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: secondary.withOpacity(0.15),
                  blurRadius: 5,
                  offset: const Offset(0, 5),
                ),
              ],
              shape: BoxShape.circle,
              color: white,
            ),
            child: const Center(
              child: Icon(
                Icons.shopping_bag_outlined,
                size: 20,
                color: secondary,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getCartList(),
          const SizedBox(
            height: 20,
          ),
          getPromotionCode(),
          const SizedBox(
            height: 30,
          ),
          getSummary(),
        ],
      ),
    );
  }

  Widget getCartList() {
    var size = MediaQuery.of(context).size;
    return Column(
      children: List.generate(myCartJson.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: FadeIn(
            child: Row(
              children: [
                SizedBox(
                  width: (size.width - 30) * 0.7,
                  height: 80,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 70,
                        height: 70,
                        child: Stack(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage(myCartJson[index]['image']),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Positioned(
                              top: 10,
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(5),
                                  border: Border.all(
                                    color: secondary.withOpacity(0.2),
                                  ),
                                  color: secondary.withOpacity(0.1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              myCartJson[index]['name'],
                              maxLines: 2,
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            Row(
                              children: [
                                const Text(
                                  "\$",
                                  style: TextStyle(
                                    color: red,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  myCartJson[index]['price'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Flexible(
                  child: SizedBox(
                    height: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Align(
                          alignment: Alignment.topRight,
                          child: Icon(
                            Icons.close_outlined,
                            size: 20,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            myCartJson[index]["plusIsVisible"]
                                ? GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        myCartJson[index]["selectedItems"]--;
                                        myCartJson[index]["minusIsVisible"] =
                                            true;
                                        if (myCartJson[index]
                                                ["selectedItems"] <=
                                            1) {
                                          myCartJson[index]["plusIsVisible"] =
                                              false;
                                        } else {
                                          myCartJson[index]["plusIsVisible"] =
                                              true;
                                        }
                                      });
                                    },
                                    child: const Icon(
                                      LineIcons.minusSquare,
                                      size: 30,
                                    ),
                                  )
                                : Icon(myCartJson[index]["minusIcon"],
                                    size: 30,
                                    color: myCartJson[index]["plusIsVisible"]
                                        ? secondary
                                        : secondary.withOpacity(0.3)),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              myCartJson[index]["selectedItems"].toString(),
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            myCartJson[index]["minusIsVisible"]
                                ? GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        myCartJson[index]["selectedItems"]++;
                                        myCartJson[index]["plusIsVisible"] =
                                            true;
                                        if (myCartJson[index]
                                                ["selectedItems"] >=
                                            6) {
                                          myCartJson[index]["minusIsVisible"] =
                                              false;
                                        } else {
                                          myCartJson[index]["minusIsVisible"] =
                                              true;
                                        }
                                      });
                                    },
                                    child: const Icon(
                                      LineIcons.plusSquare,
                                      size: 30,
                                    ),
                                  )
                                : Icon(LineIcons.plusSquare,
                                    size: 30,
                                    color: myCartJson[index]["minusIsVisible"]
                                        ? secondary
                                        : secondary.withOpacity(0.3)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget getPromotionCode() {
    var size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        color: secondary.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: secondary.withOpacity(0.3),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: (size.width - 30) * 0.7,
            height: 55,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                cursorColor: secondary,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Promo Code",
                    floatingLabelBehavior: FloatingLabelBehavior.never),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: SizedBox(
                height: 55,
                width: 100,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll(secondary),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  child: const Center(child: Text("Apply")),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              "Subtotal",
              style: TextStyle(
                fontSize: 14,
                color: secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 2,
            ),
            Text(
              "(${myCartJson.length} items)",
              style: const TextStyle(
                color: secondary,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Dash(
              length: 155,
              direction: Axis.horizontal,
              dashLength: 10,
              dashColor: secondary.withOpacity(0.5),
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              "\$600",
              style: TextStyle(
                color: secondary,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          children: [
            const Text(
              "Delivery Charges",
              style: TextStyle(
                fontSize: 14,
                color: secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Dash(
              length: 160,
              direction: Axis.horizontal,
              dashLength: 10,
              dashColor: secondary.withOpacity(0.5),
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              "Free",
              style: TextStyle(
                color: secondary,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          children: [
            const Text(
              "Total",
              style: TextStyle(
                fontSize: 14,
                color: secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Dash(
              length: 250,
              direction: Axis.horizontal,
              dashLength: 10,
              dashColor: secondary.withOpacity(0.5),
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              "\$600",
              style: TextStyle(
                color: red,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget getFooter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: ElevatedButton(
          onPressed: () {
            var snackBar = SnackBar(
              content:
                  const Center(child: Text('Buying is not supported yet.')),
              backgroundColor: secondary.withOpacity(0.5),
              width: 300,
              padding: const EdgeInsets.all(20),
              shape: const StadiumBorder(),
              behavior: SnackBarBehavior.floating,
              duration: const Duration(seconds: 1),
              elevation: 0,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(secondary),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(12),
              ),
            ),
          ),
          child: const Text(
            "Proceed to checkout",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: white,
            ),
          ),
        ),
      ),
    );
  }
}
