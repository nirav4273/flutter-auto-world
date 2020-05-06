import 'package:auto_world/models/videoModel.dart';
import 'package:auto_world/screens/video/videoItem.dart';
import 'package:flutter/material.dart';

class Video extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemBuilder: (context, index) {
        return VideoItem(
          videoModel: videos[index],
          isLastItem: index == (videos.length - 1),
        );
      },
      itemCount: videos.length,
    );
  }
}