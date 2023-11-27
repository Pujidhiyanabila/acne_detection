import 'package:acne_detection/Detection/Camera_Page.dart';
import 'package:acne_detection/Detection/Gallery_Page.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:acne_detection/Common/style.dart';
import 'package:acne_detection/Detection/Gallery_Preview_Page.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class InputWidget extends StatefulWidget {
  const InputWidget({Key? key}) : super(key: key);

  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  File? _image;
  PickedFile? pickedFile;
  final _picker = ImagePicker();

  Future<void> _pickImage() async {
    pickedFile = await _picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() async {
        _image = File(pickedFile!.path);

        // Resize the image to the desired dimensions
        img.Image image = img.decodeImage(await _image!.readAsBytes())!;
        img.Image resizedImage = img.copyResize(image, width: 480, height: 720);

        // Save the resized image to a new file
        File resizedFile = File(_image!.parent.path + "/resized_image.jpg");
        resizedFile.writeAsBytesSync(img.encodeJpg(resizedImage));

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GalleryPreviewPage(
              pickedFile: PickedFile(resizedFile.path),
            ),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ElevatedButton.icon(
            onPressed: () async {
              await availableCameras().then((value) => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => CameraPage(cameras: value))));
            },
            icon: const Icon(
              Icons.camera_alt,
              color: ColorStyles.textColor,
            ),
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
            style: ElevatedButton.styleFrom(
              primary: ColorStyles.primaryColor, // Set the background color for the "Camera" button
            ),
          ),
          const SizedBox(width: 8),
          // const GalleryPage(),
          ElevatedButton.icon(
            onPressed: ()=> _pickImage(),
            icon: const Icon(
              Icons.image,
              color: ColorStyles.textColor,
            ),
            label: const Text(
              "Galery",
              maxLines: 2,
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'avenir',
                color: ColorStyles.textColor,
                fontWeight: FontWeight.w800,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: ColorStyles.primaryColor, // Set the background color for the "Camera" button
            ),
          ),
        ],
      ),
    );
  }
}
