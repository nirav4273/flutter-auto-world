import 'package:auto_world/config/theme.dart';
import 'package:auto_world/widgets/customButton.dart';
import 'package:auto_world/widgets/customInputField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }
}

class LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool autoValid = false;

  TextEditingController emailCtrl;
  TextEditingController passCtrl;

  FocusNode email;
  FocusNode password;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailCtrl = TextEditingController();
    passCtrl = TextEditingController();
    email = FocusNode();
    password = FocusNode();
  }

  unFocus(){
    password?.unfocus();
    email?.unfocus();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailCtrl?.dispose();
    passCtrl?.dispose();
    email?.dispose();
    password?.dispose();
  }

  onSubmit(){
    unFocus();
    setState(() {
      autoValid = true;
    });
    if(_formKey.currentState.validate()){
      print("VALIDATE>>>>>>>>>>");
      Navigator.pushNamedAndRemoveUntil(context, "/home",  (Route<dynamic> route) => false);

//      Navigator.pushAndRemoveUntil(context,
//          MaterialPageRoute(builder: (BuildContext context) => Login()),
//          ModalRoute.withName('/'));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;

    // TODO: implement build
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                autovalidate: autoValid,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 50,),
                    Container(
                      height: 70,
                      child: Image.asset(logoUrl)
                    ),
                    SizedBox(height: 20,),
                    Container(
                      child: Text("Login", style: TextStyle(color: primary, fontSize: 30),)
                    ),
                    SizedBox(height: 30,),
                    Container(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CustomInputField(
                            textInputType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            controller: emailCtrl,
                            focusNode: email,
                            labelText: "Email",
                            validator: (value){
                              print("value $value");
                              if(value == null || value == ''){
                                return "Email is required";
                              }
                              return null;
                            },
                            onFieldSubmit: (value){
                              password.requestFocus();
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomInputField(
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.text,
                            focusNode: password,
                            controller: passCtrl,
                            labelText: "Password",
                            isPassword: true,
                            validator: (value){
                              if(value == null || value == ''){
                                return "Password is required";
                              }
                              return null;
                            },
                            onFieldSubmit: (value){
                              onSubmit();
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomButton(
                            text: "Login",
                            onTap: (){
                              onSubmit();
                            },
                          )
                        ],
                      ),
                    ),
                    Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Forgot password ?", style: TextStyle(color: primary),),
                            GestureDetector(
                                onTap: (){
                                  Navigator.pushNamedAndRemoveUntil(context, "/register",  (Route<dynamic> route) => true);
                                },
                                child: Text("Create new Account", style: TextStyle(color: primary),),
                            ),

                          ],
                        )
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
