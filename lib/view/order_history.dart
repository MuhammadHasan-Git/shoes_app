import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../dummy/order_json.dart';
import '../theme/colors.dart';

class OrderHistorPage extends StatefulWidget {
  const OrderHistorPage({super.key});

  @override
  State<OrderHistorPage> createState() => _OrderHistorPageState();
}

class _OrderHistorPageState extends State<OrderHistorPage> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      bottomNavigationBar: getFooter(),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60), child: getAppBar()),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: primary,
      centerTitle: true,
      title: const Text(
        "Order History",
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
                Icons.delete,
                size: 20,
                color: secondary,
              ),
            ),
          ),
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
              content: const Center(child: Text('successfully Reorder')),
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
            "Reorder",
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

  Widget getBody() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          getTabs(),
          const SizedBox(
            height: 30,
          ),
          pageIndex == 0 ? getCurrentOrderItemList() : getPastOrderItemList(),
        ],
      ),
    );
  }

  Widget getTabs() {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: secondary.withOpacity(0.05),
      ),
      child: Row(
        children: [
          pageIndex == 0
              ? Flexible(
                  child: ElasticIn(
                  child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: SizedBox(
                        width: (size.width - 45) / 2,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            pageIndex = 0;
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                const MaterialStatePropertyAll(white),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "Current Orders",
                              style: TextStyle(
                                color: black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      )),
                ))
              : GestureDetector(
                  onTap: () {
                    setState(() {
                      pageIndex = 0;
                    });
                  },
                  child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: SizedBox(
                        width: (size.width - 45) / 2,
                        height: 50,
                        child: Center(
                          child: Text(
                            "Current Orders",
                            style: TextStyle(
                              color: secondary.withOpacity(0.5),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )),
                ),
          pageIndex == 1
              ? Flexible(
                  child: ElasticIn(
                  child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: SizedBox(
                        width: (size.width - 45) / 2,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            pageIndex = 1;
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                const MaterialStatePropertyAll(white),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "Past Orders",
                              style: TextStyle(
                                color: black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      )),
                ))
              : GestureDetector(
                  onTap: () {
                    setState(() {
                      pageIndex = 1;
                    });
                  },
                  child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: SizedBox(
                        width: (size.width - 45) / 2,
                        height: 50,
                        child: Center(
                          child: Text(
                            "Past Orders",
                            style: TextStyle(
                              color: secondary.withOpacity(0.5),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )),
                ),
        ],
      ),
    );
  }

  Widget getCurrentOrderItemList() {
    var size = MediaQuery.of(context).size;
    return Column(
      children: List.generate(currentOrderList.length, (index) {
        return FadeIn(
          duration: Duration(milliseconds: 1000 * index),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              width: size.width,
              decoration: BoxDecoration(
                color: secondary.withOpacity(0.05),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          currentOrderList[index]["date"],
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Text(
                          "Delivery Processing",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: size.width * 0.6,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 90,
                                height: 90,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 10,
                                      child: Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                            color: white,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                              color: secondary.withOpacity(0.1),
                                            )),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 80,
                                      height: 80,
                                      child: Image.asset(
                                          currentOrderList[index]["image"]),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Flexible(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      currentOrderList[index]["name"],
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                      maxLines: 2,
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          "\$",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: red,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          currentOrderList[index]["price"],
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          maxLines: 2,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Flexible(
                            child: Row(
                          children: [
                            Container(
                              width: 1,
                              height: 60,
                              decoration: BoxDecoration(
                                color: secondary.withOpacity(0.15),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Total Items: 1",
                                    style: TextStyle(
                                      fontSize: 13,
                                    ),
                                    maxLines: 2,
                                  ),
                                  Text(
                                    currentOrderList[index]["time"],
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: secondary.withOpacity(0.5),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget getPastOrderItemList() {
    var size = MediaQuery.of(context).size;
    return Column(
      children: List.generate(pastOrderList.length, (index) {
        return FadeIn(
          duration: Duration(milliseconds: 1000 * index),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              width: size.width,
              decoration: BoxDecoration(
                color: secondary.withOpacity(0.05),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          pastOrderList[index]["date"],
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Row(
                          children: [
                            Icon(
                              LineIcons.checkCircle,
                              size: 20,
                              color: Colors.green,
                            ),
                            SizedBox(
                              width: 1,
                            ),
                            Text(
                              "Delivered",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: size.width * 0.6,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 90,
                                height: 90,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 10,
                                      child: Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                            color: white,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                              color: secondary.withOpacity(0.1),
                                            )),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 80,
                                      height: 80,
                                      child: Image.asset(
                                          pastOrderList[index]["image"]),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Flexible(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      pastOrderList[index]["name"],
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                      maxLines: 2,
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          "\$",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: red,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          pastOrderList[index]["price"],
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          maxLines: 2,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Flexible(
                            child: Row(
                          children: [
                            Container(
                              width: 1,
                              height: 60,
                              decoration: BoxDecoration(
                                color: secondary.withOpacity(0.15),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Total Items: 1",
                                    style: TextStyle(
                                      fontSize: 13,
                                    ),
                                    maxLines: 2,
                                  ),
                                  Text(
                                    pastOrderList[index]["time"],
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: secondary.withOpacity(0.5),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
