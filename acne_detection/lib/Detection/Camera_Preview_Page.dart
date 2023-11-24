import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:acne_detection/Common/style.dart';
import 'package:acne_detection/Models/Prediction_Model.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CameraPreviewPage extends StatefulWidget {
  const CameraPreviewPage({super.key, required this.picture});

  final XFile picture;

  @override
  State<CameraPreviewPage> createState() => _CameraPreviewPageState();
}

class BoundingBoxPainter extends CustomPainter {
  final List<Rect> rectangles;
  final List<String> labels;

  BoundingBoxPainter({required this.rectangles, required this.labels});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 2
      ..color = Colors.red
      ..style = PaintingStyle.stroke;

    for (var i = 0; i < rectangles.length; i++) {
      canvas.drawRect(rectangles[i], paint);

      final textPainter = TextPainter(
        textDirection: TextDirection.ltr,
        text: TextSpan(
          text: labels[i],
          style: TextStyle(
            color: Colors.black,
            backgroundColor: Colors.white.withOpacity(0.5),
            fontSize: 12.0,
          ),
        ),
      );

      textPainter.layout();
      textPainter.paint(
          canvas, Offset(rectangles[i].left, rectangles[i].top - 15));
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}

class _CameraPreviewPageState extends State<CameraPreviewPage> {
  List<Prediction> predictions = [];
  Image? labeled;
  num height = 720;
  num width = 480;
  var _isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      apiResponse();
    });
    //rebuildAllChildren(context);
  }

  Future apiResponse() async {
    Uint8List bytes = await File(widget.picture!.path).readAsBytes();
    String picBase64 = base64Encode(bytes);
    String APIkey = "TVwnSql9wk4Nwt6Dc2SN";
    String endpoint = "acne-detection-q9g59/7";
    String URL = "https://detect.roboflow.com/" + endpoint + "?api_key=" + APIkey + "&name=YOUR_IMAGE.jpg";
    http.Response response = await http.post(
      Uri.parse(URL),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
        'Content-Length': utf8.encode(picBase64).length.toString(),
        'Content-Language': 'en-US',
      },
      body: picBase64,
    );
    if (response.statusCode == 200) {
      Iterable l = jsonDecode(response.body)["predictions"];
      // height = int.parse(jsonDecode(response.body)["image"]["height"]);
      // width = int.parse(jsonDecode(response.body)["image"]["width"]);
      print(response.body);
      predictions = List<Prediction>.from(l.map((model)=> Prediction.fromJson(model)));
      setState(() {
        _isLoading = false;
      });
    } else {
      print(response.statusCode);
      throw Exception('Failed to create album.');
    }
  }

  Widget _buildBoxes() {
    // double topleftX = 1080 / 2 - width / 2;
    // // num height = 720;
    // // num width = 480;
    // double topLeftY = (2340 - 76) / 2 - height / 2;
    Image image = Image.file(File(widget.picture!.path));
    List<double> Ls = List.filled(0, 0, growable: true);
    List<double> Ts = List.filled(0, 0, growable: true);
    List<double> Ws = List.filled(0, 0, growable: true);
    List<double> Hs = List.filled(0, 0, growable: true);
    List<double> confs = List.filled(0, 0, growable: true);
    return
      Column(mainAxisSize: MainAxisSize.min, children: [
        Stack(
            children: [
              image,
              CustomPaint(
                painter: BoundingBoxPainter(
                  rectangles: predictions.map((p) {
                    //medium
                    var hratio = 370/480;
                    var yratio = 555/720;
                    var W = p.width * hratio;
                    var H = p.height * yratio;
                    var L = (p.x * hratio - W/2 - 2).abs();
                    var T = (p.y * yratio - H/2 + 2).abs();
                    // var L = (p.x * hratio - W/2 - 10).abs();
                    // var T = (p.y * yratio - H/2 + 10).abs();

                    if (p.confidence < 0.2 || H < 10) {
                      L = 1000;
                      T = 1000;
                    } else {
                      for (var i = 0; i < Ls.length; i++) {
                        if ((Ls[i] - L).abs() < 20 && (Ts[i] - T).abs() < 20 && (Ws[i] - W).abs() < 20 && (Ws[i] - W).abs() < 20) {
                          if (p.confidence < confs[i]) {
                            L = 1000;
                            T = 1000;
                          } else {
                            predictions[i].classification = p.classification;
                            L = 1000;
                            T = 1000;
                          }
                        }
                      }
                    }
                    Ls.add(L);
                    Ts.add(T);
                    Ws.add(W);
                    Hs.add(H);
                    confs.add(p.confidence);
                    return Rect.fromLTWH(L, T, W, H);
                  }).toList(),
                  labels: predictions.map((p) {
                    // return p.classification;
                    return "${p.classification} (${(p.confidence * 100).toStringAsFixed(2)}%)";
                  }).toList(),
                ),)]
        )],
      );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //         title: const Text('Results')),
  //     body: Center(
  //         child: false ? Image.file(File(widget.picture.path)) : _buildBoxes()
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: const Text('Results')),
        body: Center(
          child: false
              ? Column(
                children: [
                  Image.file(File(widget.picture.path)),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.symmetric(
                      vertical: 2,
                      horizontal: 10,
                    ),
                    child: const Text(
                      "Tidak Terdetection",
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
                  )
                ],
              )
              : Column(
                children: [
                  _buildBoxes(),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.symmetric(
                      vertical: 2,
                      horizontal: 10,
                    ),
                    child: const Text(
                      "Terdetection",
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
                ],
              ),
        ),
      ),
    );
  }
}

