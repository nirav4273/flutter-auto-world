import 'package:auto_world/widgets/customButton.dart';
import 'package:auto_world/widgets/customInputField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
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
              CustomInputField(
                labelText: "Name",
              ),
              SizedBox(
                height: 10,
              ),
              CustomInputField(
                labelText: "Username",
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                onTap: () {},
                text: "Save",
              )
            ],
          ),
        ),
      ),
    );
  }
}
