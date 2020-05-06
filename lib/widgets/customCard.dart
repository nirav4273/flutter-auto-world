import 'package:auto_world/config/theme.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  Widget child;

  CustomCard({@required this.child}) : assert(child != null);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: secondary,
        boxShadow: [
          BoxShadow(
            color: Color(0xff000000).withOpacity(.2),
            spreadRadius: 0,
            blurRadius: 10,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: child,
      ),
    );
  }
}
