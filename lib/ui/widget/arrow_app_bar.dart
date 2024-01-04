import 'package:flutter/material.dart';

class ArrowAppBar extends StatelessWidget implements PreferredSizeWidget {
  final IconData leading;
  final String title;

  ArrowAppBar({required this.leading, required this.title, super.key});

  Size get preferredSize => Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(leading:
      InkWell(onTap: () {
        Navigator.pop(context);
      },
        // child: Image.asset("assets/icons/arrow_back.png"))
        child: Icon(leading)
      )
      , title: Container(child: Text(title, style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)), alignment: Alignment(-0.25, 0.0),)
      // , actions: [],
    );
  }
}
