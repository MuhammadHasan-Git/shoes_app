import 'package:animate_do/animate_do.dart';

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shoes_app/theme/colors.dart';

class ProductDetailPage extends StatefulWidget {
  final String name;
  final String img;
  final String price;
  final String rate;
  final List colors;
  const ProductDetailPage(
      {super.key,
      required this.name,
      required this.img,
      required this.price,
      required this.rate,
      required this.colors});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int selectedItems = 1;
  bool isInWishList = false;
  bool isVisible = false;
  bool isvisible_1 = true;
  List sizes = [
    7,
    7.5,
    8,
    8.5,
    9,
    9.5,
    10,
    10.5,
    11,
    11.5,
    12,
    12.5,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60), child: getAppBar()),
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
        elevation: 0,
        backgroundColor: primary,
        centerTitle: true,
        title: const Text(
          "Product Details",
          style: TextStyle(
            fontSize: 18,
            color: secondary,
            fontWeight: FontWeight.w600,
          ),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          splashRadius: 17,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: secondary.withOpacity(0.2)),
            ),
            child: const Center(
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 18,
                color: secondary,
              ),
            ),
          ),
        ));
  }

  Widget getFooter() {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: secondary,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "More",
              style: TextStyle(
                fontSize: 18,
                color: white,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: [
                Container(
                  width: 120,
                  height: 35,
                  decoration: BoxDecoration(
                    color: primary.withOpacity(0.3),
                    borderRadius: BorderRadiusDirectional.circular(8),
                    border: Border.all(color: white),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        isVisible
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedItems--;
                                    isvisible_1 = true;
                                    if (selectedItems <= 1) {
                                      isVisible = false;
                                    } else {
                                      isVisible = true;
                                    }
                                  });
                                },
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.remove,
                                      color: isVisible
                                          ? secondary
                                          : secondary.withOpacity(0.4),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.remove,
                                    color: isVisible
                                        ? secondary
                                        : secondary.withOpacity(0.4),
                                  ),
                                ),
                              ),
                        Text(
                          selectedItems.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            color: white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        isvisible_1
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedItems++;
                                    isVisible = true;
                                    if (selectedItems >= 6) {
                                      isvisible_1 = false;
                                    } else {
                                      isvisible_1 = true;
                                    }
                                  });
                                },
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Center(
                                    child: Icon(Icons.add,
                                        color: isvisible_1
                                            ? secondary
                                            : secondary.withOpacity(0.4)),
                                  ),
                                ),
                              )
                            : Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Center(
                                  child: Icon(Icons.add,
                                      color: isvisible_1
                                          ? secondary
                                          : secondary.withOpacity(0.3)),
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                      color: white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: secondary.withOpacity(0.15),
                          blurRadius: 5,
                          offset: const Offset(0, 5),
                        ),
                      ]),
                  child: const Center(child: Icon(LineIcons.shoppingBag)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.name,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              const Icon(
                LineIcons.star,
                size: 20,
              ),
              const SizedBox(
                width: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Text(
                  "${widget.rate} Reviews",
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 3),
                    child: Text(
                      "\$",
                      style: TextStyle(
                        fontSize: 16,
                        color: red,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Text(
                    widget.price,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isInWishList = !isInWishList;
                  });
                },
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                      color: white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: secondary.withOpacity(0.15),
                          blurRadius: 5,
                          offset: const Offset(0, 5),
                        ),
                      ]),
                  child: Center(
                      child: Icon(
                    isInWishList ? LineIcons.heartAlt : LineIcons.heart,
                    color: red,
                  )),
                ),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeIn(
                child: SizedBox(
                  width: size.width * 0.25,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: List.generate(widget.colors.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: SizedBox(
                            width: 70,
                            height: 70,
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 10,
                                  child: Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                        color: white,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: secondary.withOpacity(0.1))),
                                  ),
                                ),
                                SizedBox(
                                  width: 60,
                                  height: 60,
                                  child: Image.asset(
                                    widget.colors[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: FadeIn(
                  child: SizedBox(
                    height: 350,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Container(
                            height: 300,
                            decoration: BoxDecoration(
                                color: secondary.withOpacity(0.12),
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(40),
                                  bottomRight: Radius.circular(120),
                                  topLeft: Radius.circular(120),
                                  topRight: Radius.circular(40),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 270,
                          child: Image.asset(
                            widget.img,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: size.width * 0.15,
                child: const Text(
                  "Sizes",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Flexible(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: List.generate(sizes.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadiusDirectional.circular(12),
                              border: Border.all(
                                color: secondary.withOpacity(0.2),
                              )),
                          child: Center(
                              child: Text(
                            sizes[index].toString(),
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          )),
                        ),
                      );
                    }),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
