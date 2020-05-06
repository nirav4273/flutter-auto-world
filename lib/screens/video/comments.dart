import 'package:auto_world/config/theme.dart';
import 'package:auto_world/widgets/customButton.dart';
import 'package:auto_world/widgets/customCard.dart';
import 'package:auto_world/widgets/customDivider.dart';
import 'package:auto_world/widgets/customInputField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class VideoComments extends StatelessWidget {
  AnimationController controller;

  VideoComments({@required this.controller}) : assert(controller != null);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: secondary,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            color: secondary,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Text(
                    "Comments",
                    style: TextStyle(color: primary, fontSize: 17),
                  ),
                ),
                Material(
                    color: Colors.transparent,
                    child: InkResponse(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        controller.reverse();
                      },
                      child: Container(
                          height: 30,
                          width: 30,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Icon(
                            Icons.close,
                            color: primary,
                          )),
                    ))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: CustomInputField(
              labelText: "Add Comment",
              textInputType: TextInputType.multiline,
              maxLines: 4,
            ),
          ),
          SizedBox(height: 5,),
          Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              width: 70,
              child: SmallCustomButton(
                text: "Add",
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
              ),
            ),
          ),
          SizedBox(height: 5,),
          CustomDivider(),

          Expanded(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: ListView(
                children: <Widget>[
                  CommentItem(),
                  CommentItem(),
                  CommentItem(),
                  CommentItem(),
                  CommentItem(),
                  CommentItem(),
                  CommentItem(),
                  CommentItem(),
                  CommentItem(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CommentItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomCard(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 5),
              child: CircleAvatar(
                child: FlutterLogo(),
              ),
            ),
            Expanded(
                child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      "Nikks 2 hour ago",
                      style: TextStyle(
                          color: primary, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Text(
                      "Detaching from a FlutterEngine: io.flutter.embedding.engine.FlutterEngine@ea16ddc. Reloaded 7 of 523 libraries in 653ms. Reloaded 7 of 523 libraries in 653ms. Reloaded 7 of 523 libraries in 653ms.",
                      style: TextStyle(color: primary, fontSize: 13),
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
