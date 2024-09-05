import 'package:flutter/material.dart';
import 'package:letstalkbooksfinished/core/managers/book_manager.dart';
import 'package:letstalkbooksfinished/ui/screens/splash_screen.dart';

void main() async{
  await init();
  runApp(MyApp());
}

Future<void> init() async{
  WidgetsFlutterBinding.ensureInitialized();
  await BookManager().initDatabase();
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }

}