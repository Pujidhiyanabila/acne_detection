import 'package:acne_detection/Widgets/Home_AppBar_Widget.dart';
import 'package:acne_detection/Widgets/Home_Category_Widget.dart';
import 'package:acne_detection/Widgets/Input_Widget.dart';
import 'package:flutter/material.dart';
import 'package:acne_detection/Common/style.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeAppBarWidget(),
              Container(
                height: 670,
                padding: EdgeInsets.only(top: 15),
                decoration: const BoxDecoration(
                  color: ColorStyles.appbarColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 40,
                      decoration: BoxDecoration(
                        color: ColorStyles.primaryColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 2),
                            height: 40,
                            width: 289,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search here...",
                              ),
                            ),
                          ),
                          // Spacer(),
                          const Icon(
                            Icons.search,
                            size: 27,
                            color: ColorStyles.textColor,
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      child: const Text(
                        "Detection",
                        maxLines: 2,
                        style:
                        TextStyle(
                          fontSize: 20,
                          fontFamily: 'avenir',
                          color: ColorStyles.textColor,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const InputWidget(),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      child: const Text(
                        "Acne Category",
                        maxLines: 2,
                        style:
                        TextStyle(
                          fontSize: 20,
                          fontFamily: 'avenir',
                          color: ColorStyles.textColor,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const HomeCategoryWidget(),
                  ],
                ),
              ),
            ],
          ),
      ),
    );
  }
}
