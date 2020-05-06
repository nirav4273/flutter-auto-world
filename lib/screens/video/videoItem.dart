import 'package:auto_world/config/theme.dart';
import 'package:auto_world/models/videoModel.dart';
import 'package:auto_world/screens/video/videoDetails.dart';
import 'package:auto_world/widgets/customCard.dart';
import 'package:flutter/material.dart';

class VideoItem extends StatelessWidget {
  VideoModel videoModel;
  bool isLastItem;
  bool isRelated = false;
  bool isClickable = true;

  VideoItem({
    this.videoModel,
    this.isLastItem = false,
    this.isRelated = false,
    this.isClickable = true,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: isLastItem ? EdgeInsets.only(bottom: 30) : EdgeInsets.all(0),
      child: CustomCard(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: isClickable ? ()  {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => VideoDetailsPage(
                    videoModel: videoModel,
                  ),
                ),
              );
            } : null,
            child: Column(
              children: <Widget>[
                Hero(
                  tag: "${videoModel.id}_Tag",
                  child: Container(
                    height: isRelated ? 100 : 170,
                    width: double.infinity,
                    child: Image.network(
                      videoModel.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Hero(
                          tag: "hero_text_${videoModel.id}",
                          child: Material(
                            color: Colors.transparent,
                            child: Text(
                              videoModel.name,
                              maxLines: 2,
                              overflow: TextOverflow.clip,
                              style: TextStyle(color: primary, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
