import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:skypebank/Services/MainService.dart';
import 'package:skypebank/Utils.dart';

class CustomerProvider extends ChangeNotifier {
  Services services = Services();
  bool isLoading = true;

  CustomerProvider(){
  services.setAppConfig();
  }

  existingCustomer(BuildContext context, Map<String, dynamic> map) async {
    showDialog(context: context, builder:(_)=>Loader());

    try{
      print(map);
      String response =await services.addExistingUser(map);
      print(response);
      if(response!=null){
        Map js=json.decode(response);
        if(js.containsKey('status')){
          AppColors.errorToast(js['title']);
        }else{
          AppColors.successToast('Account create successfully');
        }
      }
      Navigator.pop(context);
    }catch(_){
      print(_);
      Navigator.pop(context);
    }
  }
}