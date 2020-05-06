import 'package:auto_world/config/theme.dart';
import 'package:auto_world/models/videoModel.dart';
import 'package:auto_world/screens/video/comments.dart';
import 'package:auto_world/screens/video/relatedVideos.dart';
import 'package:auto_world/widgets/customButton.dart';
import 'package:auto_world/widgets/customDivider.dart';
import 'package:auto_world/widgets/customInputField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class VideoDetailsPage extends StatefulWidget {
  VideoModel videoModel;

  VideoDetailsPage({this.videoModel});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return VideoDetailsPageState();
  }
}

class VideoDetailsPageState extends State<VideoDetailsPage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: primary, //change your color here
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Hero(
                tag: "${widget.videoModel.id}_Tag",
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(widget.videoModel.image),
                          fit: BoxFit.cover)),
                  height: MediaQuery.of(context).size.height / 4.5,
                  width: double.infinity,
                ),
              ),
            ),
            Expanded(
              child: DetailsView(
                videoModel: widget.videoModel,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DetailsView extends StatefulWidget {
  VideoModel videoModel;

  DetailsView({this.videoModel}) : assert(videoModel != null);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DetailsViewState();
  }
}

class DetailsViewState extends State<DetailsView>
    with SingleTickerProviderStateMixin {
  Animation<Offset> offset;
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    offset = Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset.zero)
        .animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Hero(
                            tag: "hero_text_${widget.videoModel.id}",
                            child: Material(
                              color: Colors.transparent,
                              child: Container(
                                child: Text(
                                  widget.videoModel.name,
                                  style:
                                      TextStyle(color: primary, fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.thumb_up,
                                  color: primary,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.thumb_down,
                                  color: primary,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.redo,
                                  color: primary,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      child: Text(
                        "${widget.videoModel.name} ${widget.videoModel.name} ${widget.videoModel.name} ${widget.videoModel.name}",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: primary.withOpacity(.7), fontSize: 14),
                        maxLines: 3,
                      ),
                    )
                  ],
                ),
              ),
              CustomDivider(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            CircleAvatar(
                              child: FlutterLogo(),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "PowerDrift",
                              style: TextStyle(color: primary),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      child: SmallCustomButton(
                        text: "Follow",
                        onTap: () {},
                      ),
                    )
                  ],
                ),
              ),
              CustomDivider(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: GestureDetector(
                  onTap: () {
                    controller.forward();
                  },
                  child: Material(
                    color: Colors.transparent,
                    child: Hero(
                      tag: "hero_comment_id",
                      child: Container(
                          alignment: Alignment.bottomLeft,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "COMMENTS ( 190 )",
                                style: TextStyle(color: primary),
                              ),
                              InkResponse(
                                onTap: () {
                                  controller.forward();
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(right: 5),
                                  child: Icon(
                                    Icons.add,
                                    color: primary,
                                    size: 20,
                                  ),
                                ),
                              )
                            ],
                          )),
                    ),
                  ),
                ),
              ),
              CustomDivider(),
              Expanded(
                child: RelatedVideos(),
              )
            ],
          ),
        ),
        SlideTransition(
          position: offset,
          child: VideoComments(
            controller: controller,
          ),
        )
      ],
    );
  }
}
