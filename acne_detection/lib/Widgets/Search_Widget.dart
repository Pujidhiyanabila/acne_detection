import 'dart:core';

import 'package:acne_detection/Common/style.dart';
import 'package:acne_detection/Models/Category_Model.dart';
import 'package:acne_detection/Views/Detail_Screen.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {

  static List<CategoryModel> category = [
    CategoryModel(
      id: 1,
      name: 'Blackheads',
      img: 'Assets/Images/Blackheads.jpg',
      about: 'Blackheads adalah pori-pori tersumbat kecil, tidak inflamasi , berwarna hitam atau coklat yang paling sering muncul di wajah.',
      reason: 'Penyakit ini berkembang ketika pori-pori tersumbat sebagian dan mulai terisi minyak kulit. Karena pori-pori yang tersumbat hanya sebagian, oksigen dari udara merembes masuk dan bereaksi dengan melanin pada pori-pori yang tersumbat, inilah yang menyebabkan warna hitam atau coklat yang kita lihat pada komedo.',
      overcome: 'Cara terbaik menangani komedo adalah dengan mencegahnya terlebih dahulu dengan cara yang tepat . Setelah Anda memilikinya, komedo akan sulit dihilangkan, dan metode manual apa pun yang Anda gunakan untuk menghilangkannya, seperti strip Biore atau ekstraksi komedo manual di kantor ahli kecantikan.',
      info: 'acne.org',
    ),
    CategoryModel(
      id: 2,
      name: 'Whiteheads',
      img: 'Assets/Images/Whiteheads.jpg',
      about: 'Whiteheads adalah lesi kecil, non-inflamasi, berwarna putih atau berwarna kulit yang paling sering muncul di wajah, terutama di hidung dan sekitar mulut. Penyakit ini paling sering terjadi pada usia remaja, namun dapat terjadi pada semua usia.',
      reason: '60',
      overcome: '',
      info: 'acne.org',
    ),
    CategoryModel(
      id: 3,
      name: 'Papules',
      img: 'Assets/Images/Papules.jpg',
      about: 'Papules adalah lesi jerawat yang relatif kecil (kurang dari 5 mm), berwarna merah, dan sedikit meninggi yang biasanya muncul di wajah, leher, dada, punggung, bahu, dan lengan atas. Setelah beberapa hari, papules biasanya berisi nanah dan membentuk bagian tengah berwarna putih atau kuning, yang kemudian disebut pustules, yang dapat pecah.',
      reason: 'Papules terjadi ketika pori-pori tersumbat, dan minyak kulit yang biasanya mengalir ke permukaan terperangkap di dalamnya. Bakteri jerawat kemudian tumbuh di dalam minyak kulit yang terperangkap, dan lesi menjadi merah, nyeri, dan menonjol yang disebut papules.',
      overcome: 'Jangan Pernah Mencoba Meletuskan Papules: Tunggu hingga papula berisi nanah dan bagian tengahnya berwarna putih atau kuning sebelum mencoba meletuskannya.',
      info: 'acne.org',
    ),
    CategoryModel(
      id: 4,
      name: 'Pustules',
      img: 'Assets/Images/Pustules.jpg',
      about: 'Pustules adalah apa yang biasa disebut orang sebagai “jerawat”. Bentuknya relatif kecil (kurang dari 5 mm), meradang (merah), lesi jerawat menonjol dengan bagian tengah berwarna putih atau kuning yang terletak terutama di wajah, leher, punggung, bahu, dan lengan atas.',
      reason: 'Penyakit ini berkembang ketika pori-pori tersumbat, dan minyak kulit yang biasanya mengalir ke permukaan menjadi terperangkap. Bakteri kemudian tumbuh di dalam minyak kulit yang terperangkap, dan lesi menjadi lesi merah, nyeri, dan menonjol yang disebut papules. Bila papula berisi nanah dan menjadi kepala berwarna putih atau kuning, maka disebut pustules. Jika tidak disentuh, pustules akan tetap berada di kulit selama beberapa hari, setelah itu kepala pustula akan pecah dan mengeluarkan nanah ke permukaan kulit atau tubuh menyerap nanah tersebut.',
      overcome: '',
      info: 'acne.org',
    ),
    CategoryModel(
      id: 5,
      name: 'Nodules',
      img: 'Assets/Images/Nodules.jpg',
      about: 'Nodules adalah jerawat berukuran besar (diameter lebih dari 5 mm), berwarna merah, benjolan nyeri yang terbentuk setelah pori kulit pecah dan mengeluarkan isinya jauh ke dalam kulit. Jerawat ini merupakan lesi fibrosa yang tidak mengandung nanah dan merupakan bagian dari jenis jerawat parah yang disebut jerawat “nodulokistik”, sering kali hanya disebut sebagai “ jerawat kistik ”.',
      reason: '',
      overcome: 'Jangan Mencoba Meletus! Memunculkan nodul tidak ada gunanya karena padat. Mencoba memecahkan bintil dapat merusak kulit, menyebabkan lebih banyak peradangan dan jaringan parut. Jangan pernah mencoba memecahkan bintil.',
      info: 'acne.org',
    ),
    CategoryModel(
      id: 5,
      name: 'Dark Spot',
      img: 'Assets/Images/BukanJerawat.jpg',
      about: 'Dart Spot adalah bekas jerawat, luka atau dll. Dark Spot bukan merupakan jerawat',
      reason: '',
      overcome: '',
      info: '',
    ),
  ];

  List<CategoryModel> displayList = List.from(category);

  void updateList(String value){
    setState(() {
      displayList = category.where((element) => element.name!.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorStyles.secondaryColor,
        title: TextField(
          onChanged: (value) => updateList(value),
          style: const TextStyle(
            color: ColorStyles.textColor,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: ColorStyles.primaryColor,
            contentPadding: EdgeInsets.symmetric(vertical: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              // borderSide: BorderSide.none,
            ),
            hintText: "Search here...",
            prefixIcon: const Icon(Icons.search),
            prefixIconColor: ColorStyles.textColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: displayList.length == 0
                ? const Center(
                    child: Text(
                      'Now result found',
                      style: TextStyle(
                        color: ColorStyles.textColor,
                        fontWeight: FontWeight.bold),
                      ),
                    )
                : ListView.builder(
                    itemCount: displayList.length,
                    itemBuilder: (context, index) {
                      final categoryModel = displayList[index];
                      return Card(
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => DetailScreen(
                                categoryModel: categoryModel,
                              )));
                          },
                          title: Text(
                            displayList[index].name,
                            style: const TextStyle(
                              color: ColorStyles.textColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: const Text(
                            'Selengkapnya...',
                            style: TextStyle(
                              color: ColorStyles.textColor,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          leading: Image.asset(displayList[index].img),
                        ),
                      );
                    }
                ),
            ),
          ],
        ),
      ),
    );
  }
}
