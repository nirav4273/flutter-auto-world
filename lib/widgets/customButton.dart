import 'package:auto_world/config/theme.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget{

  String text;
  GestureTapCallback onTap;

  CustomButton({@required this.text, this.onTap}): assert(text != null);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5)
        ),
        disabledColor: primary.withOpacity(.8),
        color: primary,
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 45,
          child: Text(text, style: TextStyle(fontSize: 18, color: secondary),),
        ),
        onPressed: onTap ?? null,
      ),
    );
  }
}


class SmallCustomButton extends StatelessWidget{

  String text;
  GestureTapCallback onTap;

  SmallCustomButton({@required this.text, this.onTap}): assert(text != null);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5)
        ),
        disabledColor: primary.withOpacity(.8),
        color: primary,
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 20,
          child: Text(text, style: TextStyle(fontSize: 14, color: secondary),),
        ),
        onPressed: onTap ?? null,
      );
  }
}