import 'package:auto_world/config/theme.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Divider(
      height: 1,
      color: primary.withOpacity(.4),
      indent: 10,
      endIndent: 10,
    );
  }
}