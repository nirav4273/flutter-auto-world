import 'package:auto_world/config/theme.dart';
import 'package:auto_world/screens/images.dart';
import 'package:auto_world/screens/profile/profile.dart';
import 'package:auto_world/screens/video/video.dart';
import 'package:circle_bottom_navigation/circle_bottom_navigation.dart';
import 'package:circle_bottom_navigation/widgets/tab_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}

class HomeState extends State<Home>{

  int activeIndex = 0;
  PageController pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(initialPage: activeIndex, keepPage: true);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 35,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(logoUrl),
            ],
          )
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: InkResponse(
              onTap: (){},
              child: Icon(Icons.notifications, color: primary,),
            )
          )
        ],
      ),
      body: Container(
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          children: <Widget>[
            Container(
              key: PageStorageKey("video"),
              child: Video(),
            ),
            Container(
              key: PageStorageKey("images"),
              child: ImagesPage(),
            ),
//            Center(child: Text("EVENT"),),
            Profile()
          ],
        ),
      ),
      bottomNavigationBar: CircleBottomNavigation(
        circleSize: 45,
        barHeight: 55,
        circleOutline: 0,
        initialSelection: activeIndex,
        barBackgroundColor: secondary,
        activeIconColor: secondary,
        textColor: primary,
        tabs: [
          TabData(icon: Icons.video_library,title: "Videos",iconSize: 20),
          TabData(icon: Icons.image,title: "Images", iconSize: 20),
//          TabData(icon: Icons.event,title: "Events", iconSize: 20),
          TabData(icon: Icons.account_circle,title: "Profile", iconSize: 20),
        ],
        onTabChangedListener: (index) {
          setState(() => activeIndex = index);
          pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
        },
      )
    );
  }
}

