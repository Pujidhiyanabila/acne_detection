import 'package:flutter/material.dart';
import 'package:acne_detection/Common/style.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorStyles.primaryColor,
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          Image.asset(
            'Assets/Images/logoapp.png', // Provide the correct path to your image
            width: 20,
            height: 20,
            color: ColorStyles.blackColor,
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 20,
            ),
            child: Text(
              "Acne Detection",
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
          const Spacer(),
        ],
      ),
    );
  }
}
