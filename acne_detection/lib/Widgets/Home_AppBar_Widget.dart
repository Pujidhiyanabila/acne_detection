import 'package:flutter/material.dart';
import 'package:acne_detection/Common/style.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorStyles.primaryColor,
      padding: const EdgeInsets.all(25),
      child: const Row(
        children: [
          Icon(
            Icons.center_focus_weak,
            size: 30,
            color: ColorStyles.blackColor,
          ),
          Padding(
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
          Spacer(),
        ],
      ),
    );
  }
}
