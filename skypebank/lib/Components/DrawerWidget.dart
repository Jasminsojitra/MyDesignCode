import 'package:flutter/material.dart';
import 'package:skypebank/Customer/ExistingCustomerPage.dart';
import 'package:skypebank/Customer/NewCustomerPage.dart';

import '../Utils.dart';
import 'MenuWidget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 50,)
          ,              Image.asset(
            "assets/images/SBSL.png",
            height: 60,
          ),
          SizedBox(height: 30,),
          Container(height: 1,color: AppColors.mainColorDark,),
          const SizedBox(
            height: 15,
          ),
          MenuWidget(
            title: 'New Customer',
            icon: Icon(Icons.person_add_alt_outlined,size: 28,
              color: AppColors.mainColorDark,),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return NewCustomerPage();
                  },
                ),
              );

            },
          ),
          MenuWidget(
            icon: Icon(Icons.person_outline_outlined,size: 28,
              color: AppColors.mainColorDark,),
            title: 'Existing Customer',
            onTap: (){
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ExistingCustomerPage();
                  },
                ),
              );
            },
          ),

          MenuWidget(
            title: 'FAQ',
            icon: Icon(Icons.question_answer_outlined,size: 28,
              color: AppColors.mainColorDark,),
            onTap: (){

            },
          ),

          MenuWidget(
            icon: Icon(Icons.featured_play_list_outlined,size: 28,
              color: AppColors.mainColorDark,),
            title: 'Account Opening documents',
            onTap: (){

            },
          ),

        ],
      ),
    );
  }
}
