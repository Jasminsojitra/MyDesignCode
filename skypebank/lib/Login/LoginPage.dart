import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:skypebank/Components/rounded_button.dart';
import 'package:skypebank/Components/rounded_input_field.dart';
import 'package:skypebank/Components/text_field_container.dart';
import 'package:skypebank/Home/HomePage.dart';

import '../Utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  bool isLoading=false;
  TextEditingController nameInputController= TextEditingController();
  TextEditingController pwdInputController= TextEditingController();
  String UserValidator(String value) {
    if(value==""){
      return 'Please Enter Username';
    } else {
      return "";
    }
  }
  @override
  void dispose() {
    nameInputController.clear();
    pwdInputController.clear();
    super.dispose();
  }
  String pwdValidator(String value) {
    if (value =="") {
      return 'Please Enter Password';
    } else {
      return "";
    }
  }
  void _onLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: getImageLoader(),
        );
      },
    );
  }

  bool isVisible=false;
  final GlobalKey<FormState> _LoginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    FocusNode focusNode = FocusNode();
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body:
      Container(
          width: size.width,
          margin: EdgeInsets.only(left: 25,top: 25,right: 25),
          child: Form(
          key: _LoginFormKey,
          child:NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowGlow();
          return true;
          },
          child:ListView(
            children: [
              Lottie.asset('assets/images/Login.json',height: 355 ,fit: BoxFit.cover),
              RoundedInputField(
                icon: Icons.person,
                inputController: nameInputController,
                hintText: "Username",
                validation: UserValidator,
                focusNode:focusNode,
              ),
              TextFieldContainer(
                child:
                TextFormField(
                  controller: pwdInputController,
                  obscureText: !isVisible,
                  cursorColor: AppColors.drakblue,
                  decoration: InputDecoration(
                    hintText: "Password",
                    icon: Icon(
                      Icons.lock,
                      color: AppColors.drakblue,
                    ),
                    suffixIcon: (isVisible)?
                    GestureDetector(
                      child: Icon(
                        Icons.visibility_off,
                        color: AppColors.drakblue,
                      ),
                      onTap: (){
                        setState(() {
                          isVisible=!isVisible;
                        });
                      },
                    ):
                    GestureDetector(
                      child: Icon(
                        Icons.visibility,
                        color: AppColors.drakblue,
                      ),
                      onTap: (){
                        setState(() {
                          isVisible=!isVisible;
                        });
                      },
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              (isLoading)?LoadingButton():
              RoundedButton(
                  text: "LOGIN",
                  press: () async {
                    if (nameInputController.text!=""&&pwdInputController.text!="") {
                      print(nameInputController.text);
                      print(pwdInputController.text);
                      Navigator.pushAndRemoveUntil(
                          context, MaterialPageRoute(builder: (context) =>
                          HomePage()), (route) => false);
                    }
                    else{
                      Fluttertoast.showToast(
                          msg: "Please Enter username and password",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    }
                  }
              ),
              SizedBox(height: size.height * 0.03),
            ],
          ),
        ),))
    );
  }
}
