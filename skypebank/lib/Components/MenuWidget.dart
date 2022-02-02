import 'package:flutter/material.dart';

import '../Utils.dart';
import 'GradientText.dart';

class MenuWidget extends StatelessWidget{
  final String? title;
  final Widget? icon;
  final Function? onTap;
  MenuWidget({this.title,this.icon,this.onTap});

  @override
  Widget build(BuildContext context) {

    return Container(

      child: Column(
        children: [
          InkWell(
            onTap: (){
              onTap?.call();
            },
            child: Padding(
              padding: const EdgeInsets.only(top:8.0,left: 20,bottom: 8),
              child: Row(
                children: [
                  icon??Icon(
                    Icons.home_sharp,
                    size: 30,
                    color:  AppColors.mainColorDark,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  GradientText(
                    title??'',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),
                    gradient: LinearGradient(colors: [
                      AppColors.drakblue,
                      AppColors.mainColorDark,
                    ]),
                  ),

                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 5,bottom: 0
            ),
            child:  Container(
              width: 300,
              height: 1,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}