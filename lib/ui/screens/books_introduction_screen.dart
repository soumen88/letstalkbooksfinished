import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:letstalkbooksfinished/core/app_constants.dart';
import 'package:letstalkbooksfinished/ui/screens/display_books_list_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class BooksIntroductionScreen extends StatefulWidget {
  const BooksIntroductionScreen({super.key});

  @override
  _BooksIntroductionScreenState createState() => _BooksIntroductionScreenState();
}

class _BooksIntroductionScreenState extends State<BooksIntroductionScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  Future<void> _onIntroEnd(context) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(AppConstants.kIsIntroDisplayed, true);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => DisplayBooksListScreen()),
    );
  }

  Widget _buildFullscreenImage() {
    return Image.asset(
      'assets/fullscreen.jpg',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/images/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(
        fontSize: 19.0,
        color: Colors.white
    );

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.w700,
          color: Colors.white
      ),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.black,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      autoScrollDuration: 3000,
      infiniteAutoScroll: true,
      globalFooter: SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
          child: const Text(
            'Let\'s go right away!',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          onPressed: () => _onIntroEnd(context),
        ),
      ),
      pages: [
        PageViewModel(
          title: AppConstants.kIntroTitle1,
          body: AppConstants.kIntroBody1,
          image: _buildImage('intro_1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: AppConstants.kIntroTitle2,
          body: AppConstants.kIntroBody2,
          image: _buildImage('intro_2.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: AppConstants.kIntroTitle3,
          body: AppConstants.kIntroBody3,
          image: _buildImage('intro_3.png'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
