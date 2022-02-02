import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skypebank/Components/text_field_container.dart';

import '../Utils.dart';

class RoundedInputField extends StatelessWidget {
  String hintText;
  IconData? icon;
  Function? validation;
  ValueChanged<String>? onChanged;
  TextEditingController? inputController;
  FocusNode? focusNode;

  RoundedInputField({
    this.hintText="",
    this.icon,
    this.validation,
    this.onChanged,
    this.inputController,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: inputController,
        onChanged: onChanged,
        validator: (value) {
          if (value == null) {
            return "Please Fill";
          }
          return null;
        },
        cursorColor: AppColors.drakblue,
        onFieldSubmitted: (value){
          focusNode!.nextFocus();
        },
        textInputAction:TextInputAction.next,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: AppColors.drakblue,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}


class RoundedInputFieldWithoutIcon extends StatelessWidget {
  String hintText;
  Function? validation;
  ValueChanged<String>? onChanged;
  TextEditingController? inputController;
  FocusNode? focusNode;

  RoundedInputFieldWithoutIcon({
    this.hintText="",
    this.validation,
    this.onChanged,
    this.inputController,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        cursorColor: Colors.black,
        controller: inputController,
        onChanged: onChanged,
        validator: (value) {
          if (value == null) {
            return "Please Fill";
          }
          return null;
        },
        onFieldSubmitted: (value){
          focusNode!.nextFocus();
        },
        textInputAction:TextInputAction.next,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
