import 'package:auto_world/config/theme.dart';
import 'package:auto_world/models/videoModel.dart';
import 'package:auto_world/screens/video/videoItem.dart';
import 'package:auto_world/widgets/customCard.dart';
import 'package:auto_world/widgets/customDivider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RelatedVideos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Container(
              height: double.infinity,
              child: ListView(
                children: <Widget>[
                  RelatedItems(videoModel: videos[1]),
                  RelatedItems(videoModel: videos[2]),
                  RelatedItems(videoModel: videos[0]),
                  RelatedItems(videoModel: videos[1]),
                  RelatedItems(videoModel: videos[2]),
                  RelatedItems(videoModel: videos[0]),
                  RelatedItems(videoModel: videos[1]),
                  RelatedItems(videoModel: videos[2]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RelatedItems extends StatelessWidget {
  VideoModel videoModel;

  RelatedItems({this.videoModel});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomCard(
      child: Container(
        height: 80,
        child: Row(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 4,
              child: Image.network(
                videoModel.image,
                fit: BoxFit.cover,
                matchTextDirection: true,
              ),
              color: Colors.white,
              height: double.infinity,
            ),
            Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          videoModel.name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: primary, fontSize: 16),
                          maxLines: 1,
                        ),

                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Text(
                          "${videoModel.name} ${videoModel.name} ${videoModel.name} ${videoModel.name}",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: primary.withOpacity(.7), fontSize: 13),
                          maxLines: 2,
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
