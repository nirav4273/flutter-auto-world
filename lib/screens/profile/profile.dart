import 'package:auto_world/config/theme.dart';
import 'package:auto_world/screens/profile/editProfile.dart';
import 'package:auto_world/widgets/customDivider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProfileState();
  }
}

class ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: false,
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: ProfileTop(),
        ),
        SliverAppBar(
          pinned: true,
          title: TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                icon: Icon(Icons.video_library, color: primary,),
              ),
              Tab(
                icon: Icon(Icons.image, color: primary,),
              ),
            ],
          ),
        ),
        SliverGrid.count(
          crossAxisCount: 3,
          children: List.generate(
              30,
              (index) => Card(
                    child: Text("$index"),
                  )),
        )
      ],
    );
  }
}

class ProfileTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTo0T_MO3fGY501pC6gjpz6DFA9NzzltTxpClqpjqM1gCC-I12c&usqp=CAU")),
            boxShadow: [
              BoxShadow(
                color: Color(0xff000000).withOpacity(.2),
                spreadRadius: 0,
                blurRadius: 10,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
            child: Column(
          children: <Widget>[
            Text(
              "Nikks Auto",
              style: TextStyle(color: primary, fontSize: 25),
            ),
          ],
        )),
        SizedBox(
          height: 20,
        ),
        Container(
          width: MediaQuery.of(context).size.width / 1.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              KeyValue(key: "Posts", value: "100"),
              KeyValue(key: "Followers", value: "10"),
              KeyValue(key: "Following", value: "11")
            ],
          ),
        )
      ],
    );
  }

  Widget KeyValue({String key, String value}) {
    return InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(5),
          child: Column(
            children: <Widget>[
              Text(
                value,
                style: TextStyle(
                    color: primary, fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Text(
                key,
                style: TextStyle(
                  color: primary,
                  fontSize: 17,
                ),
              )
            ],
          ),
        ));
  }
}

class CustomSliverPersistentHeader extends SliverPersistentHeaderDelegate {
  final Widget child;

  CustomSliverPersistentHeader({this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return this.child;
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 200;

  @override
  // TODO: implement minExtent
  double get minExtent => 200;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return true;
  }
}
/*
*
*  return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTo0T_MO3fGY501pC6gjpz6DFA9NzzltTxpClqpjqM1gCC-I12c&usqp=CAU")
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff000000).withOpacity(.2),
                    spreadRadius: 0,
                    blurRadius: 10,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              child: Column(
                children: <Widget>[
                  Text("Nikks Auto", style: TextStyle(color: primary, fontSize: 25),),
                ],
              )
            ),
            SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width/1.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  KeyValue(key: "Posts",value: "100"),
                  KeyValue(key: "Followers", value: "10"),
                  KeyValue(key: "Following", value: "11")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


  Widget KeyValue({String key, String value}){
    return Column(
      children: <Widget>[
        Text(value, style: TextStyle(color: primary, fontSize: 18, fontWeight: FontWeight.w600),),
        Text(key,style: TextStyle(color: primary, fontSize: 17,),)
      ],
    );
  }
* */
