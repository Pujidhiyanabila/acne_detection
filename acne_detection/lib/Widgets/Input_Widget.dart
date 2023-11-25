import 'package:acne_detection/Detection/Camera_Page.dart';
import 'package:acne_detection/Detection/Gallery_Page.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:acne_detection/Common/style.dart';

class InputWidget extends StatefulWidget {
  const InputWidget({Key? key}) : super(key: key);

  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          ElevatedButton.icon(
            onPressed: () async {
              await availableCameras().then((value) => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => CameraPage(cameras: value))));
            },
            icon: const Icon(Icons.camera_alt),
            label: const Text(
              "Camera",
              maxLines: 2,
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'avenir',
                color: ColorStyles.textColor,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          // const SizedBox(width: 2),
          GalleryPage(),
        ],
      ),
    );
  }
}
