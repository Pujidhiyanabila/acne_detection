import 'package:acne_detection/Models/Category_Model.dart';
import 'package:flutter/material.dart';

enum CategoryViewState {
  none,
  loading,
  loaded,
  error,
}

class CategoryViewModel with ChangeNotifier {
  CategoryViewState _state = CategoryViewState.none;

  CategoryViewState get state => _state;

  List<CategoryModel> categoryModelData = [
    CategoryModel(
      id: 1,
      name: 'Blackheads',
      img: 'Assets/Images/Blackheads.jpg',
      about: 'Blackhead adalah pori-pori tersumbat kecil, non-inflamasi , berwarna hitam atau coklat yang paling sering muncul di wajah.',
      reason: 'Penyakit ini berkembang ketika pori-pori tersumbat sebagian dan mulai terisi minyak kulit. Karena pori-pori yang tersumbat hanya sebagian, oksigen dari udara merembes masuk dan bereaksi dengan melanin pada pori-pori yang tersumbat, inilah yang menyebabkan warna hitam atau coklat yang kita lihat pada komedo.',
      overcome: 'Mengatasi Blackhead adalah dengan menggunakan senyawa asam salisilat karena bahan tersebut membantu menghilangkan lapisan atas kulit yang rusak, melakukan eksfoliasi secara rutin sebanyak dua sampai tiga kali dalam satu minggu untuk membantu mengangkat sel kulit mati dari permukaan kulit wajah, menggunakan masker wajah, melakukan chemical peeling, menjaga kulit tetap lembap dan terhidrasi, melakukan Perawatan ke Profesional.',
      info: 'acne.org & halodoc',
    ),
    CategoryModel(
      id: 2,
      name: 'Whiteheads',
      img: 'Assets/Images/Whiteheads.jpg',
      about: 'Whitehead adalah pori-pori tersumbat (komedo) berukuran kecil, non-inflamasi, berwarna putih atau berwarna kulit yang paling sering muncul di wajah, terutama di hidung dan sekitar mulut. Penyakit ini paling sering terjadi pada usia remaja, namun dapat terjadi pada semua usia.',
      reason: 'Whitehead berkembang ketika pori-pori tersumbat oleh sel-sel kulit, dan pori-pori yang tersumbat ini mulai terisi sebum (minyak kulit). Whiteheads biasanya hanya menempel di kulit selama beberapa hari, sebelum sembuh dengan sendirinya, atau berkembang menjadi lesi inflamasi, seperti papula, pustula, nodul.',
      overcome: 'Mengatasi whitehead adalah dengan menggunakan senyawa asam salisilat karena bahan tersebut membantu menghilangkan lapisan atas kulit yang rusak, menggunakan asam azelaic karena dapat membersihkan pori-pori dari bakteri yang mungkin menyebabkan iritasi atau berjerawat lalu dapat mendorong regenerasi sel sehingga kulit sembuh lebih cepat sehingga risiko bekas komedo dapat berkurang, mengatasi whitehead dengan pengelupasan kimiawi (chemical peeling) dengan melibatkan larutan kimia ringan untuk menghilangkan lapisan kulit dan mengurangi whitehead, memaparkan kulit wajah ke uap hangat dapat mendorong pori-pori tersumbat jadi terbuka, mengatasi whitehead oatmeal scrub, penggunaan obat resep dokter spesialis kulit, melakukan prosedur medis.',
      info: 'acne.org & halodoc',
    ),
    CategoryModel(
      id: 3,
      name: 'Papules',
      img: 'Assets/Images/Papules.jpg',
      about: 'Papules adalah lesi jerawat yang relatif kecil (kurang dari 5 mm), berwarna merah, dan sedikit meninggi yang biasanya muncul di wajah, leher, dada, punggung, bahu, dan lengan atas. Setelah beberapa hari, papules biasanya berisi nanah dan membentuk bagian tengah berwarna putih atau kuning, yang kemudian disebut pustules, yang dapat pecah.',
      reason: 'Papules terjadi ketika pori-pori tersumbat, dan minyak kulit yang biasanya mengalir ke permukaan terperangkap di dalamnya. Bakteri jerawat kemudian tumbuh di dalam minyak kulit yang terperangkap, dan lesi menjadi merah, nyeri, dan menonjol yang disebut papules.',
      overcome: 'Jangan pernah mencoba meletuskan papules, tunggu hingga papula berisi nanah dan bagian tengahnya berwarna putih atau kuning sebelum mencoba meletuskannya, konsultasi dengan dokter spesialis kulit, carilah kandungan skincare yang ada zat sulfur, benzoil peroksida dan asam salisilat.',
      info: 'acne.org & halodoc',
    ),
    CategoryModel(
      id: 4,
      name: 'Pustules',
      img: 'Assets/Images/Pustules.jpg',
      about: 'Pustules adalah apa yang biasa disebut orang sebagai “jerawat”. Bentuknya relatif kecil (kurang dari 5 mm), meradang (merah), lesi jerawat menonjol dengan bagian tengah berwarna putih atau kuning yang terletak terutama di wajah, leher, punggung, bahu, dan lengan atas.',
      reason: 'Penyakit ini berkembang ketika pori-pori tersumbat, dan minyak kulit yang biasanya mengalir ke permukaan menjadi terperangkap. Bakteri kemudian tumbuh di dalam minyak kulit yang terperangkap, dan lesi menjadi lesi merah, nyeri, dan menonjol yang disebut papules. Bila papula berisi nanah dan menjadi kepala berwarna putih atau kuning, maka disebut pustules. Jika tidak disentuh, pustules akan tetap berada di kulit selama beberapa hari, setelah itu kepala pustula akan pecah dan mengeluarkan nanah ke permukaan kulit atau tubuh menyerap nanah tersebut.',
      overcome: 'Jerawat pustules biasanya bisa sembuh dengan sendirinya jika dibiarkan, namun jika menggangu maka lakukan perawatan topikal, terapi fotodinamik, konsultasi dengan dokter spesialis kulit.',
      info: 'acne.org & halodoc',
    ),
    CategoryModel(
      id: 5,
      name: 'Nodules',
      img: 'Assets/Images/Nodules.jpg',
      about: 'Nodules adalah jerawat berukuran besar (diameter lebih dari 5 mm), berwarna merah, benjolan nyeri yang terbentuk setelah pori kulit pecah dan mengeluarkan isinya jauh ke dalam kulit. Jerawat ini merupakan lesi fibrosa yang tidak mengandung nanah dan merupakan bagian dari jenis jerawat parah yang disebut jerawat “nodulokistik”, sering kali hanya disebut sebagai “ jerawat kistik ”.',
      reason: 'Nodules terbentuk ketika dinding pori hancur total. Penghancuran total dinding pori-pori menyebabkan pelepasan isi pori-pori ke area kulit yang lebih dalam. Karena parahnya pecahnya, tubuh merespons dengan peradangan dalam jumlah besar, yang menyebabkan terbentuknya bintil besar.',
      overcome: 'Jangan mencoba meletus! memunculkan nodul tidak ada gunanya karena padat. Mencoba memecahkan bintil dapat merusak kulit, menyebabkan lebih banyak peradangan dan jaringan parut. Pilihan pengobatan: Benzoil peroksida, Isotretinoin, Antibiotik oral, Suntikan kortison, Krioterapi, Terapi fotodinamik, dan Perawatan hormonal.',
      info: 'acne.org & halodoc',
    ),
    CategoryModel(
      id: 5,
      name: 'Dark Spot',
      img: 'Assets/Images/BukanJerawat.jpg',
      about: 'Dart Spot adalah bekas jerawat, luka atau dll, dark spot bukan merupakan jerawat.',
      reason: 'Bekas jerawat biasanya terjadi ketika ada jaringan kulit yang hilang saat jerawat pecah, bekas jerawat pada akhirnya akan membaik. Perubahan warna dan bekas luka bopeng dapat diperbaiki seiring waktu dengan teknik perawatan kulit yang tepat.',
      overcome: 'Menghilangkan bekas jerawat dengan berbagai bahan alami penghilang bekas jerawat, seperti lemon, lidah buaya, hingga kentang.',
      info: 'halodoc',
    ),
  ];

  List<CategoryModel> get list => categoryModelData;

  changeState(CategoryViewState s) {
    _state = s;
    notifyListeners();
  }
}
