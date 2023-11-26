import 'package:acne_detection/Common/style.dart';
import 'package:acne_detection/Widgets/Category_Widget.dart';
import 'package:flutter/material.dart';


class CategoryScreen extends StatefulWidget {
  static const routeName = '/category_Screen';

  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        const Text(
          "Acne Category",
          maxLines: 2,
          style:
          TextStyle(
              fontSize: 20,
              fontFamily: 'avenir',
              color: ColorStyles.primaryColor,
              fontWeight: FontWeight.w800
          ),
          // overflow: TextOverflow.ellipsis,
        ),
        centerTitle: true,
        backgroundColor: ColorStyles.secondaryColor,
      ),
      backgroundColor: ColorStyles.primaryColor,
      body: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CategoryWidget()
          ]
      ),
    );
  }
}
