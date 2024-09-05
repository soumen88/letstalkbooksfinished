import 'package:flutter/material.dart';
import 'package:letstalkbooksfinished/core/app_constants.dart';
import 'package:letstalkbooksfinished/ui/screens/add_book_screen.dart';
import 'package:letstalkbooksfinished/ui/screens/books_introduction_screen.dart';
import 'package:letstalkbooksfinished/ui/screens/display_books_list_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    startNextScreen();
    super.initState();
  }

  Future<void> startNextScreen() async{
    await Future.delayed(Duration(seconds: AppConstants.kSplashTimer), () async{
        //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BooksIntroductionScreen()));
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool? isIntroDisplayed =  await prefs.getBool(AppConstants.kIsIntroDisplayed);
      if(isIntroDisplayed == null || isIntroDisplayed == false){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BooksIntroductionScreen()));
      }
      else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DisplayBooksListScreen()));
      }

        //Navigator.push(context, MaterialPageRoute(builder: (context) => BooksIntroductionScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
              width: 200,
              height: 200,
            ),
            Text(
              AppConstants.kAppName,
              style: TextStyle(
                fontSize: 30,
                color: Colors.white
              ),
            )
          ],
        ),
      ),
    );
  }
}