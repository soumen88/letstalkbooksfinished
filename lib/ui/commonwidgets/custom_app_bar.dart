import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  String titleText;

  CustomAppBar({required this.titleText});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
          color: Colors.white
      ),
      title: Text(
        titleText,
        style: TextStyle(
            color: Colors.white
        ),
      ),
      backgroundColor: Colors.orange,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}