import 'package:acne_detection/Widgets/Home_AppBar_Widget.dart';
import 'package:acne_detection/Widgets/Home_Category_Widget.dart';
import 'package:acne_detection/Widgets/Input_Widget.dart';
import 'package:acne_detection/Widgets/Search_Widget.dart';
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
                height: 660,
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
                    // SizedBox(
                    //   width: 330,
                    //   child: ElevatedButton(
                    //     style: ElevatedButton.styleFrom(
                    //         backgroundColor: ColorStyles.primaryColor,
                    //         foregroundColor: ColorStyles.textColor),
                    //     onPressed: () {
                    //       Navigator.of(context)
                    //           .push(MaterialPageRoute(builder: (context) => SearchWidget()));
                    //     },
                    //     child: const Text(
                    //       'Search',
                    //       style: TextStyle(
                    //         fontSize: 14,
                    //         fontFamily: 'avenir',
                    //         color: ColorStyles.textColor,
                    //         fontWeight: FontWeight.w800,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      width: 330,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) => SearchWidget()));
                        },
                        icon: const Icon(Icons.search),
                        label: const Text(
                          "Search",
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'avenir',
                            color: ColorStyles.textColor,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
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
