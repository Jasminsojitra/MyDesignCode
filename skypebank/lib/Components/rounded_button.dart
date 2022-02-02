import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../Utils.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback? press;
  final Color? color, textColor;
  const RoundedButton({
    required this.text,
    this.press,
    this.color ,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient:LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [
              AppColors.drakblue,
              AppColors.mainColor,
            ]),
      ),
      height: 53,
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child:TextButton(
        style: ButtonStyle(
          backgroundColor:MaterialStateProperty.all<Color>(Colors.transparent),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                )
            )
        ),
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
    );
  }
}

class RoundedButtonWithIcon extends StatelessWidget {
  final String text;
  final GestureTapCallback? press;
  final String image;
  const RoundedButtonWithIcon({
    required this.text,
    this.press,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Padding(
        child: Container(
          height: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [
                    AppColors.drakblue,
                    AppColors.mainColor,
                  ])),
          child: Column(
            children: [
              Image.asset(
                image,
                height: 55,
              ),
              SizedBox(height: 10,),
              Text(text,style: TextStyle(color: Colors.white),textAlign: TextAlign.center,)
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ),
        padding: EdgeInsets.all(10),
      ),
    );
  }
}

class LoadingButton extends StatelessWidget {
  final String? text;
  final VoidCallback? press;
  final Color? color, textColor;
  const LoadingButton({
    this.text,
    this.press,
    this.color ,
    this.textColor = Colors.white,
  }) ;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient:LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [
              AppColors.drakblue,
              AppColors.mainColor,
            ]),
      ),
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child:SpinKitWave(
        itemBuilder: (BuildContext context, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: index.isEven ? Colors.white : Colors.white70,
            ),
          );
        },
        size: 20.0,
      ),
    );
  }
}
