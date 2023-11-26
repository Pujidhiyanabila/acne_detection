// import 'package:acne_detection/Common/style.dart';
// import 'package:acne_detection/Detection/Gallery_Preview_Page.dart';
// import 'package:flutter/material.dart';
// import 'package:image/image.dart' as img;
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
//
// class GalleryPage extends StatefulWidget {
//   const GalleryPage({super.key});
//
//   @override
//   State<GalleryPage> createState() => _GalleryPageState();
// }
//
// class _GalleryPageState extends State<GalleryPage> {
//   File? _image;
//   PickedFile? pickedFile;
//   final _picker = ImagePicker();
//
//   Future<void> _pickImage() async {
//     pickedFile = await _picker.getImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() async {
//         _image = File(pickedFile!.path);
//
//         // Resize the image to the desired dimensions
//         img.Image image = img.decodeImage(await _image!.readAsBytes())!;
//         img.Image resizedImage = img.copyResize(image, width: 480, height: 720);
//
//         // Save the resized image to a new file
//         File resizedFile = File(_image!.parent.path + "/resized_image.jpg");
//         resizedFile.writeAsBytesSync(img.encodeJpg(resizedImage));
//
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => GalleryPreviewPage(
//               pickedFile: PickedFile(resizedFile.path),
//             ),
//           ),
//         );
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: ElevatedButton.icon(
//               onPressed: ()=> _pickImage(),
//               icon: const Icon(Icons.image),
//               label: const Text(
//                 "Galery",
//                 maxLines: 2,
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontFamily: 'avenir',
//                   color: ColorStyles.textColor,
//                   fontWeight: FontWeight.w800,
//                 ),
//               ),
//             ),
//       );
//   }
// }
