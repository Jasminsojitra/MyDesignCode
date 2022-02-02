import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:skypebank/Components/Background.dart';
import 'package:skypebank/Components/DrawerWidget.dart';
import 'package:skypebank/Components/MenuWidget.dart';
import 'package:skypebank/Components/rounded_button.dart';
import 'package:skypebank/Customer/ExistingCustomerPage.dart';
import 'package:skypebank/Customer/NewCustomerPage.dart';

import '../Utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient:  LinearGradient(
                  end: Alignment.topLeft,
                  begin: Alignment.topRight,
                  colors: [
                    AppColors.drakblue,
                    AppColors.mainColor,
                  ])
            ),
          ),
          centerTitle: true,
          title:  Text(
            'Home',)
      ),
      drawer: Drawer(
        child: DrawerWidget(),
      ),
      body: 
      Background(child: Container(
          width: size.width,
          margin: EdgeInsets.only(top: 20),
          child:
          NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (OverscrollIndicatorNotification overscroll) {
                  overscroll.disallowGlow();
                  return true;
                },
                child: ListView(
                  children: [
              Lottie.asset('assets/images/welcome.json',height: 280 ,fit: BoxFit.cover),
              SizedBox(height: 20,),
              Padding(padding: EdgeInsets.only(left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child:
                      RoundedButtonWithIcon(text: "New Customer",
                        image: "assets/images/NewUser.png",
                        press: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return NewCustomerPage();
                              },
                            ),
                          );
                        },
                      )
                  ),
                  Expanded(
                      child:
                      RoundedButtonWithIcon(text: "Existing Customer",
                        image: "assets/images/ExistingUser.png",
                        press: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ExistingCustomerPage();
                              },
                            ),
                          );
                        },
                      )
                  ),
                ],
              ),)
            ],
          )
      ),),)
    );
  }
}
