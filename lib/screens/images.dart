import 'package:auto_world/config/theme.dart';
import 'package:auto_world/widgets/customCard.dart';
import 'package:flutter/material.dart';

class ImagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemBuilder: (context, index) {
        return Container(
          height: 200,
          child: ImageItemWidget(
            index: index,
          ),
        );
      },
      itemCount: 100,
    );
  }
}

class ImageItemWidget extends StatelessWidget {
  int index;

  ImageItemWidget({this.index});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Stack(
        children: <Widget>[
          CustomCard(
            child: Hero(
              tag: "hero_tag_$index",
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => ImageItemView(
                            index: index,
                          )));
                },
                child: Container(
                  width: double.infinity,
                  child: Image.network(
                    "https://image.freepik.com/free-photo/fast-car-street-blurry-background-automotive_33790-62.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Hero(
              tag: "fav_btn_$index",
              child: Material(
              clipBehavior: Clip.hardEdge,
              color: Colors.transparent,
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite,
                      color: primary,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

/*
*
* */

class ImageItemView extends StatelessWidget {
  int index;

  ImageItemView({this.index});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Hero(
                  tag: "hero_tag_$index",
                  child: Image.network(
                    "https://image.freepik.com/free-photo/fast-car-street-blurry-background-automotive_33790-62.jpg",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      elevation: 0,
                      color: Colors.transparent,
                      onPressed: () {},
                      shape: CircleBorder(),
                      child: Icon(
                        Icons.file_download,
                        color: primary,
                      ),
                    ),
                    Hero(
                      tag: "fav_btn_$index",
                      child: RaisedButton(
                        elevation: 0,
                        color: Colors.transparent,
                        onPressed: () {},
                        shape: CircleBorder(),
                        child: Icon(
                          Icons.favorite,
                          color: primary,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
