import 'package:acne_detection/ViewModel/Category_View_Model.dart';
import 'package:acne_detection/Views/CategoryScreen.dart';
import 'package:acne_detection/Views/DetectionScreen.dart';
import 'package:acne_detection/Views/HomeScreen.dart';
import 'package:acne_detection/Views/SplashScreen.dart';
import 'package:acne_detection/Widgets/BottomNavigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CategoryViewModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Acne Detection',
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        onGenerateRoute: (RouteSettings settings){
          switch (settings.name){
            case SplashScreen.routeName:
              return MaterialPageRoute(builder: (_) => const SplashScreen());
            case BottomNavigation.routeName:
              return MaterialPageRoute(builder: (_) => const BottomNavigation());
            case HomeScreen.routeName:
              return MaterialPageRoute(builder: (_) => const HomeScreen());
            case DetectionScreen.routeName:
              return MaterialPageRoute(builder: (_) => const DetectionScreen());
            case CategoryScreen.routeName:
              return MaterialPageRoute(builder: (_) => const CategoryScreen());
            default:
              return MaterialPageRoute(
                builder: (_) {
                  return const Scaffold(
                    body: Center(
                      child: Text('Page not found :('),
                    ),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
