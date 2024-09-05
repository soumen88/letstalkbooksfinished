import 'package:flutter/material.dart';

import '../../core/app_constants.dart';

class DisplayLogoWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/logo.png",
          width: 200,
          height: 200,
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          AppConstants.kAppName,
          style: TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.w600
          ),
        )
      ],
    );
  }

}