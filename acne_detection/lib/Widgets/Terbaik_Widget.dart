import 'package:flutter/material.dart';
import 'package:acne_detection/Common/style.dart';

class HasilTerbaikWidget extends StatefulWidget {
  const HasilTerbaikWidget({Key? key}) : super(key: key);

  @override
  _HasilTerbaikWidgetState createState() => _HasilTerbaikWidgetState();
}

class _HasilTerbaikWidgetState extends State<HasilTerbaikWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Card(
            elevation: 0,
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(5),
                  child: Image.asset(
                      'Assets/Images/potrait.png',
                      height: 15,
                      width: 15,
                      fit: BoxFit.cover),
                ),
                SizedBox(height: 4),
                Text(
                  'Ambil gambar secara potrait',
                  maxLines: 2,
                  style:
                  TextStyle(
                      fontSize: 10,
                      fontFamily: 'avenir',
                      color: ColorStyles.textColor,
                      fontWeight: FontWeight.w800),
                  // overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Card(
            elevation: 0,
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(5),
                  child: Image.asset(
                      'Assets/Images/ukurangambar.png',
                      height: 15,
                      width: 15,
                      fit: BoxFit.cover),
                ),
                SizedBox(height: 4),
                Text(
                  'Ambil gambar dengan tinggi 720 cm dan lebar 480 cm',
                  maxLines: 2,
                  style:
                  TextStyle(
                      fontSize: 10,
                      fontFamily: 'avenir',
                      color: ColorStyles.textColor,
                      fontWeight: FontWeight.w800),
                  // overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Card(
            elevation: 0,
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(5),
                  child: Image.asset(
                      'Assets/Images/no-cosmetics.png',
                      height: 15,
                      width: 15,
                      fit: BoxFit.cover),
                ),
                SizedBox(height: 4),
                Text(
                  'Hapus makeup',
                  maxLines: 2,
                  style:
                  TextStyle(
                      fontSize: 10,
                      fontFamily: 'avenir',
                      color: ColorStyles.textColor,
                      fontWeight: FontWeight.w800),
                  // overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Card(
            elevation: 0,
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(5),
                  child: Image.asset(
                      'Assets/Images/no-glasses.png',
                      height: 15,
                      width: 15,
                      fit: BoxFit.cover),
                ),
                SizedBox(height: 4),
                Text(
                  'Lepaskan kacamata',
                  maxLines: 2,
                  style:
                  TextStyle(
                      fontSize: 10,
                      fontFamily: 'avenir',
                      color: ColorStyles.textColor,
                      fontWeight: FontWeight.w800),
                  // overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Card(
            elevation: 0,
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(5),
                  child: Image.asset(
                      'Assets/Images/face.png',
                      height: 15,
                      width: 15,
                      fit: BoxFit.cover),
                ),
                SizedBox(height: 4),
                Text(
                  'Pastikan tidak menghalangi wajah',
                  maxLines: 2,
                  style:
                  TextStyle(
                      fontSize: 10,
                      fontFamily: 'avenir',
                      color: ColorStyles.textColor,
                      fontWeight: FontWeight.w800),
                  // overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Card(
            elevation: 0,
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(5),
                  child: Image.asset(
                      'Assets/Images/lightbulb.png',
                      height: 15,
                      width: 15,
                      fit: BoxFit.cover),
                ),
                SizedBox(height: 4),
                Text(
                  'Pastikan pencahayaan cukup',
                  maxLines: 2,
                  style:
                  TextStyle(
                      fontSize: 10,
                      fontFamily: 'avenir',
                      color: ColorStyles.textColor,
                      fontWeight: FontWeight.w800),
                  // overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}
