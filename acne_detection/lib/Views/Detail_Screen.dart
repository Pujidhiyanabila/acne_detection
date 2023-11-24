import 'dart:ui';

import 'package:acne_detection/Common/style.dart';
import 'package:acne_detection/Models/Category_Model.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final CategoryModel categoryModel;

  const DetailPage({super.key, required this.categoryModel});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var inputController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var dropdownValue = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset(widget.categoryModel.img),
            ),
            buttonArrow(context),
            scroll(),
          ],
        ),
      )
    );
  }

  buttonArrow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          clipBehavior: Clip.hardEdge,
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  scroll() {
    return DraggableScrollableSheet(
        initialChildSize: 0.6,
        maxChildSize: 1.0,
        minChildSize: 0.6,
        builder: (context, scrollController) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20),
                  topRight: const Radius.circular(20)),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.categoryModel.name,
                      style: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'avenir',
                          color: ColorStyles.textColor,
                          fontWeight: FontWeight.w800),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Divider(
                        height: 2,
                      ),
                    ),
                    Text(
                      'Tentang',
                      style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'avenir',
                          color: ColorStyles.textColor,
                          fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.categoryModel.about,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: ColorStyles.textColor),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Divider(
                        height: 4,
                      ),
                    ),
                    Text(
                      'Penyebab?',
                      style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'avenir',
                          color: ColorStyles.textColor,
                          fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.categoryModel.reason,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: ColorStyles.textColor),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Divider(
                        height: 4,
                      ),
                    ),
                    Text(
                      'Cara Mengatasi?',
                      style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'avenir',
                          color: ColorStyles.textColor,
                          fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.categoryModel.overcome,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: ColorStyles.textColor),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Untuk informasi lebih lanjut dapat menghubungi klinik kecantikan.',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: ColorStyles.textColor),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Divider(
                        height: 4,
                      ),
                    ),
                    Text(
                      'Sumber Informasi',
                      style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'avenir',
                          color: ColorStyles.textColor,
                          fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.categoryModel.info,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: ColorStyles.textColor),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Divider(
                        height: 4,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        );
  }
}