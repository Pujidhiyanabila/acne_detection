import 'package:acne_detection/Widgets/Input_Widget.dart';
import 'package:acne_detection/Widgets/Terbaik_Widget.dart';
import 'package:flutter/material.dart';
import 'package:acne_detection/Common/style.dart';

class DetectionScreen extends StatefulWidget {
  static const routeName = '/detection_screen';

  const DetectionScreen({Key? key}) : super(key: key);

  @override
  _DetectionScreenState createState() => _DetectionScreenState();
}

class _DetectionScreenState extends State<DetectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'ACNE DETECTION',
                style:
                TextStyle(
                    fontSize: 25,
                    fontFamily: 'Work Sans',
                    color: ColorStyles.textColor,
                    fontWeight: FontWeight.w800),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'INPUT IMAGE',
                style:
                TextStyle(
                    fontSize: 25,
                    fontFamily: 'Work Sans',
                    color: ColorStyles.textColor,
                    fontWeight: FontWeight.w800),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'INPUT GAMBAR ANDA',
                style:
                TextStyle(
                    fontSize: 20,
                    fontFamily: 'Work Sans',
                    color: ColorStyles.textColor,
                    fontWeight: FontWeight.w800),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Gambar yang telah di input tidak akan disimpan',
                style:
                TextStyle(
                    fontSize: 10,
                    fontFamily: 'Work Sans',
                    color: ColorStyles.textColor,
                    fontWeight: FontWeight.w800),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InputWidget(),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Untuk hasil terbaik:',
                style:
                TextStyle(
                    fontSize: 15,
                    fontFamily: 'Work Sans',
                    color: ColorStyles.textColor,
                    fontWeight: FontWeight.w800),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            HasilTerbaikWidget(),
          ],
        ),
      ),
    );
  }
}
