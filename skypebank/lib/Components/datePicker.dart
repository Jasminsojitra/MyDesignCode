import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utils.dart';

class IsmPickerButton extends StatelessWidget {
  const IsmPickerButton({
    Key? key,
    required this.buttonTap,
    this.btnIcon,
    required this.btnTitle,
    this.borderRaduis,
    this.height,
  }) : super(key: key);
  final Function buttonTap;
  final IconData? btnIcon;
  final String btnTitle;
  final double? borderRaduis;
  final double? height;

  @override
  Widget build(BuildContext context) {

    return Container(
        height: 55,
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            color: AppColors.mainColorLightColor,
            borderRadius: BorderRadius.circular(15),
          ),
        child: GestureDetector(
          onTap: () => buttonTap(),
          child: Row(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    " $btnTitle",
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).textTheme.bodyText1!.color,
                      fontStyle: FontStyle.normal,),
                  ),
                ),
              ),
              if (btnIcon != null)
                Icon(
                  btnIcon,
                  color: AppColors.drakblue,
                ),
            ],
          ),
        ),
    );
  }
}