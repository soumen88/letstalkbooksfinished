import 'package:flutter/material.dart';

import '../../core/color_constants.dart';

class CustomButtonWidget extends StatelessWidget{
  VoidCallback onButtonPress;
  String buttonText;
  CustomButtonWidget({required this.onButtonPress, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              )
          ),
          backgroundColor: MaterialStateProperty.all<Color>(ColorConstants.kPurpleColor),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        onPressed: (){
            onButtonPress();
        },
        child: Text(buttonText)
    );
  }

}