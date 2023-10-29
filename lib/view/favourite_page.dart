import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shoes_app/theme/colors.dart';
import '../dummy/favourite_json.dart';


class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
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
        "Favourite",
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
              content: const Center(child: Text('Add In Cart')),
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
            "Add To Cart",
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
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: List.generate(favouriteJson.length, (index) {
              return FadeIn(
                duration: Duration(milliseconds: 1000 * index),
                child: Column(
                  children: [
                    SizedBox(
                      width: (size.width - 50) / 2,
                      height: 220,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 20,
                            child: Container(
                              width: (size.width - 50) / 2,
                              height: 200,
                              decoration: BoxDecoration(
                                color: secondary.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  width:
                                      favouriteJson[index]['active'] ? 1.2 : 0,
                                  color: favouriteJson[index]['active']
                                      ? secondary.withOpacity(0.5)
                                      : Colors.transparent,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 15,
                                  right: 15,
                                  bottom: 10,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          LineIcons.star,
                                          size: 18,
                                          color: secondary,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 3),
                                          child: Text(
                                            favouriteJson[index]['rate'],
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Container(
                                      width: 35,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        color: white,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  secondary.withOpacity(0.15),
                                              blurRadius: 5,
                                              offset: const Offset(0, 5)),
                                        ],
                                      ),
                                      child: Center(
                                        child: Icon(
                                          favouriteJson[index]['active']
                                              ? LineIcons.heartAlt
                                              : LineIcons.heart,
                                          size: 20,
                                          color: red,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: -10,
                            child: SizedBox(
                              width: (size.width - 50) / 2,
                              height: 180,
                              child: Image.asset(
                                favouriteJson[index]['image'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: (size.width - 60) / 2,
                          child: Center(
                            child: Text(
                              favouriteJson[index]['name'],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: SizedBox(
                            width: (size.width - 60) / 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "\$",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: red,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  width: 1,
                                ),
                                Text(
                                  favouriteJson[index]['price'],
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: secondary.withOpacity(0.5),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
