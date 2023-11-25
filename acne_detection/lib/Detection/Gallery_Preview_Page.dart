import 'dart:convert';
import 'dart:io';
import 'package:acne_detection/Common/style.dart';
import 'package:acne_detection/Models/Prediction_Model.dart';
import 'package:acne_detection/Views/CategoryScreen.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GalleryPreviewPage extends StatefulWidget {
  const GalleryPreviewPage({super.key, this.pickedFile});

  final PickedFile? pickedFile;

  @override
  State<GalleryPreviewPage> createState() => _GalleryPreviewPageState();
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

class _GalleryPreviewPageState extends State<GalleryPreviewPage> {
  List<Prediction> predictions = [];
  Map<String, int> detectionCounts = {};
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
  }

  void calculateDetectionCounts() {
    detectionCounts.clear(); // Clear the existing counts

    for (var prediction in predictions) {
      if (prediction.confidence >= 0.3 && prediction.height >= 10) {
        // Only count instances with confidence >= 0.3 and height >= 10
        if (detectionCounts.containsKey(prediction.classification)) {
          detectionCounts[prediction.classification] =
              detectionCounts[prediction.classification]! + 1;
        } else {
          detectionCounts[prediction.classification] = 1;
        }
      }
    }
  }

  Future apiResponse() async {
    Uint8List bytes = await File(widget.pickedFile!.path).readAsBytes();
    String picBase64 = base64Encode(bytes);
    String APIkey = "TVwnSql9wk4Nwt6Dc2SN";
    String endpoint = "acne-detection-q9g59/7";
    // String URL = "https://detect.roboflow.com/" + endpoint + "?api_key=" + APIkey + "&name=YOUR_IMAGE.jpg";
    String URL = "https://detect.roboflow.com/$endpoint?api_key=$APIkey&name=YOUR_IMAGE.jpg";
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
      if (kDebugMode) {
        print(response.body);
      }
      predictions =
      List<Prediction>.from(l.map((model) => Prediction.fromJson(model)));
      // print(response.body);
      // predictions = List<Prediction>.from(l.map((model)=> Prediction.fromJson(model)));
      setState(() {
        _isLoading = false;
      });
    } else {
      if (kDebugMode) {
        print(response.statusCode);
      }
      // print(response.statusCode);
      throw Exception('Failed to create album.');
    }
  }

  Widget _buildBoxes() {
    Image image = Image.file(File(widget.pickedFile!.path));
    List<double> Ls = List.filled(0, 0, growable: true);
    List<double> Ts = List.filled(0, 0, growable: true);
    List<double> Ws = List.filled(0, 0, growable: true);
    List<double> Hs = List.filled(0, 0, growable: true);
    List<double> confs = List.filled(0, 0, growable: true);
    calculateDetectionCounts();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(children: [
          image,
          CustomPaint(
            painter: BoundingBoxPainter(
              rectangles: predictions.map((p) {
                //medium
                var hratio = 370 / 480;
                var yratio = 555 / 720;
                var W = p.width * hratio;
                var H = p.height * yratio;
                var L = (p.x * hratio - W / 2 - 2).abs();
                var T = (p.y * yratio - H / 2 + 2).abs();
                // var L = (p.x * hratio - W/2 - 10).abs();
                // var T = (p.y * yratio - H/2 + 10).abs();
                if (p.confidence < 0.3 || H < 10) {
                  L = 1000;
                  T = 1000;
                } else {
                  for (var i = 0; i < Ls.length; i++) {
                    if ((Ls[i] - L).abs() < 20 &&
                        (Ts[i] - T).abs() < 20 &&
                        (Ws[i] - W).abs() < 20 &&
                        (Ws[i] - W).abs() < 20) {
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(title: const Text('Results')),
        appBar: AppBar(
          title:
          const Text(
            "Detection Result",
            maxLines: 2,
            style:
            TextStyle(
                fontSize: 20,
                fontFamily: 'avenir',
                color: ColorStyles.primaryColor,
                fontWeight: FontWeight.w800
            ),
          ),
          centerTitle: true,
          backgroundColor: ColorStyles.secondaryColor,
        ),
        backgroundColor: ColorStyles.primaryColor,
        body: SingleChildScrollView(
          child: Center(
            child: false
                ? Image.file(File(widget.pickedFile!.path))
                : Column(
              children: [
                _buildBoxes(),
                Container(
                  height: 40,
                  width: 360,
                  padding: EdgeInsets.only(top: 5),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: ColorStyles.appbarColor,
                  ),
                  child: Text(
                    predictions.isNotEmpty ? "Terdeteksi" : "Tidak Terdeteksi",
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'avenir',
                      color: ColorStyles.textColor,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                if (detectionCounts.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: detectionCounts.entries
                        .map(
                          (entry) => GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) => CategoryScreen()));
                        },
                        child: Text(
                          "${entry.key}: ${entry.value}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'avenir',
                            color: ColorStyles.textColor,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ).toList(),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
