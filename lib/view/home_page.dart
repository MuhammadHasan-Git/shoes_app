import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shoes_app/dummy/ads_json.dart';
import 'package:shoes_app/dummy/home_json.dart';
import 'package:shoes_app/theme/colors.dart';
import 'package:shoes_app/view/product_detail_page.dart';
import 'package:shoes_app/widgets/custom_slider.dart';
import '../controller/getx_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final viewController = Get.put(ViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60), child: getAppBar()),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: AppBar(
        title: getSearchBox(),
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: primary,
        actions: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: secondary.withOpacity(0.5),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                width: 45,
                height: 45,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("assets/images/profile.jpg"),
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Hello Muhammd Hasan,",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Text(
            "Let's get something,",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          getSlider(),
          const SizedBox(
            height: 20,
          ),
          getCategorySection(),
          const SizedBox(
            height: 10,
          ),
          getTabBar(),
          getItemList(),
        ],
      ),
    );
  }

  Widget getSearchBox() {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: TextFormField(
        maxLines: 1,
        cursorColor: secondary,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 0),
          filled: true,
          fillColor: secondary.withOpacity(0.1),
          prefixIcon: const Icon(
            Icons.search,
            color: black,
            size: 25,
          ),
          hintText: "Search...",
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(color: secondary),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(color: secondary.withOpacity(0.1)),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
      ),
    );
  }

  Widget getSlider() {
    return const CustomSlider(items: adsJson);
  }

  Widget getCategorySection() {
    // TabController _tabController = TabController(length: 5, vsync: this);
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Category",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget getItemList() {
    var size = MediaQuery.of(context).size;
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      spacing: 20,
      runSpacing: 20,
      children: List.generate(homeJson.length, (index) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ProductDetailPage(
                            name: homeJson[index]['name'],
                            img: homeJson[index]['image'],
                            price: homeJson[index]['price'],
                            rate: homeJson[index]['rate'],
                            colors: homeJson[index]['colors'])));
              },
              child: FadeIn(
                duration: Duration(
                  milliseconds: 1000 * index,
                ),
                child: SizedBox(
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
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 15,
                              right: 15,
                              bottom: 10,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      padding: const EdgeInsets.only(top: 3),
                                      child: Text(
                                        homeJson[index]['rate'],
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
                                          color: secondary.withOpacity(0.15),
                                          blurRadius: 5,
                                          offset: const Offset(0, 5)),
                                    ],
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      LineIcons.shoppingBag,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 5,
                        child: SizedBox(
                          width: (size.width - 50) / 2,
                          height: 180,
                          child: Image.asset(homeJson[index]['image']),
                        ),
                      ),
                    ],
                  ),
                ),
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
                      homeJson[index]['name'],
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
                          homeJson[index]['price'],
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
        );
      }),
    );
  }

  Widget getTabBar() {
    TabController tabController = TabController(length: 5, vsync: this);

    return TabBar(
        isScrollable: true,
        physics: const BouncingScrollPhysics(),
        indicatorColor: secondary,
        labelPadding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        controller: tabController,
        labelColor: secondary,
        unselectedLabelColor: secondary.withOpacity(0.5),
        tabs: const [
          Tab(
            text: "Shoes",
          ),
          Tab(
            text: "Clothing",
          ),
          Tab(
            text: "Laptops",
          ),
          Tab(
            text: "Mobile",
          ),
          Tab(
            text: "Watch",
          ),
        ]);
  }
}
