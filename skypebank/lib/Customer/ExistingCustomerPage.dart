import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:skypebank/Components/ImageFromGalleryEx.dart';
import 'package:skypebank/Components/datePicker.dart';
import 'package:skypebank/Components/rounded_button.dart';
import 'package:skypebank/Components/rounded_input_field.dart';
import 'package:intl/intl.dart';
import 'package:skypebank/Components/text_field_container.dart';
import 'package:skypebank/Customer/CustomerProvider.dart';
import '../Utils.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:io';

import 'package:flutter/foundation.dart';

class ExistingCustomerPage extends StatefulWidget {
  const ExistingCustomerPage({Key? key}) : super(key: key);

  @override
  _ExistingCustomerPage createState() => _ExistingCustomerPage();
}

class _ExistingCustomerPage extends State<ExistingCustomerPage> {

  TextEditingController AccountNumberInputController= TextEditingController();
  TextEditingController CustomerNameInputController= TextEditingController();
  TextEditingController Address1InputController= TextEditingController();
  TextEditingController Address2InputController= TextEditingController();
  TextEditingController CurrencyInputController= TextEditingController();
  TextEditingController EmailInputController= TextEditingController();
  TextEditingController PrefixInputController= TextEditingController();
  TextEditingController FirstNameInputController= TextEditingController();
  TextEditingController LastNameInputController= TextEditingController();
  TextEditingController OtherNameInputController= TextEditingController();
  TextEditingController ShortNameInputController= TextEditingController();
  TextEditingController GenderInputController= TextEditingController();
  TextEditingController IdTypeInputController= TextEditingController();
  TextEditingController IdNumberInputController= TextEditingController();
  TextEditingController MaritalInputController= TextEditingController();
  TextEditingController NationalityInputController= TextEditingController();
  TextEditingController PhoneNumberInputController= TextEditingController();
  TextEditingController ReferralCodeInputController= TextEditingController();
  String? _selectedGender = 'male';
  String? acType="";
  var startDate = DateTime.now();
  bool isLoading=false;
  XFile? addressImageFile;
  XFile? passportImageFile;

  @override
  Widget build(BuildContext context) {
    FocusNode focusNode = FocusNode();
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    end: Alignment.topLeft,
                    begin: Alignment.topRight,
                    colors: [
                      AppColors.drakblue,
                      AppColors.mainColor,
                    ])),
          ),
          centerTitle: true,
          title: Text(
            'Existing Customer',
          )),
      body: Container(
        margin: EdgeInsets.only(left: 20,right: 20),
        child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification overscroll) {
              overscroll.disallowGlow();
              return true;
            },
            child: ListView(
              children: [
                SizedBox(height: 20,),
                RoundedInputFieldWithoutIcon(
                  inputController: CustomerNameInputController,
                  hintText: "Account Number",
                  focusNode:focusNode,
                ),
                TextFieldContainer(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: acType,
                      isDense: true,
                      isExpanded: true,
                      items: [
                        DropdownMenuItem(child: Text("Select account type"), value: ""),
                        DropdownMenuItem(child: Text("Individual"), value: "Individual"),
                        DropdownMenuItem(child: Text("Corporate"), value: "Corporate"),
                      ],
                      onChanged: (newValue) {
                        setState(() {
                          acType=newValue;
                        });
                      },
                    ),),
                ),
                RoundedInputFieldWithoutIcon(
                  inputController: CustomerNameInputController,
                  hintText: "CustomerName",
                  focusNode:focusNode,
                ),
                RoundedInputFieldWithoutIcon(
                  inputController: Address1InputController,
                  hintText: "Address1",
                  focusNode:focusNode,
                ),
                RoundedInputFieldWithoutIcon(
                  inputController: Address2InputController,
                  hintText: "Address2",
                  focusNode:focusNode,
                ),
                RoundedInputFieldWithoutIcon(
                  inputController: CurrencyInputController,
                  hintText: "Currency",
                  focusNode:focusNode,
                ),
                IsmPickerButton(
                  btnTitle:DateFormat("dd/MM/yyyy").format(startDate),
                  btnIcon: Icons.date_range_outlined,
                  buttonTap: () async{
                    final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: startDate,
                        // Refer step 1
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                        cancelText: "Cancle",
                        //locale: Locale.parse('fr-FR'),
                        confirmText: "Birth",
                        helpText: "Select Birth date");
                    if (picked != null && picked != DateTime.now()) {
                      setState(() {
                        startDate = picked;
                      });
                    }
                  },
                ),
                RoundedInputFieldWithoutIcon(
                  inputController: EmailInputController,
                  hintText: "Email",
                  focusNode:focusNode,
                ),
                RoundedInputFieldWithoutIcon(
                  inputController: PrefixInputController,
                  hintText: "Prefix",
                  focusNode:focusNode,
                ),
                RoundedInputFieldWithoutIcon(
                  inputController: FirstNameInputController,
                  hintText: "FirstName",
                  focusNode:focusNode,
                ),
                RoundedInputFieldWithoutIcon(
                  inputController: LastNameInputController,
                  hintText: "LastName",
                  focusNode:focusNode,
                ),
                RoundedInputFieldWithoutIcon(
                  inputController: OtherNameInputController,
                  hintText: "OtherNames",
                  focusNode:focusNode,
                ),
                RoundedInputFieldWithoutIcon(
                  inputController: ShortNameInputController,
                  hintText: "ShortName",
                  focusNode:focusNode,
                ),
                Row(children: [
                  Expanded(child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Radio(
                      fillColor: MaterialStateColor.resolveWith((states) => AppColors.drakblue),
                      value: 'male',
                      groupValue: _selectedGender,
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value.toString();
                        });
                      },
                    ),
                    title: Text('Male'),
                  ),),
                  Expanded(child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Radio(
                      fillColor: MaterialStateColor.resolveWith((states) => AppColors.drakblue),
                      value: 'female',
                      groupValue: _selectedGender,
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value.toString();
                        });
                      },
                    ),
                    title: Text('Female'),
                  ),)
                ],),

                RoundedInputFieldWithoutIcon(
                  inputController: IdTypeInputController,
                  hintText: "IdType",
                  focusNode:focusNode,
                ),
                RoundedInputFieldWithoutIcon(
                  inputController: IdNumberInputController,
                  hintText: "IdNumber",
                  focusNode:focusNode,
                ),
                RoundedInputFieldWithoutIcon(
                  inputController: MaritalInputController,
                  hintText: "MaritalStatus",
                  focusNode:focusNode,
                ),
                RoundedInputFieldWithoutIcon(
                  inputController: NationalityInputController,
                  hintText: "Nationality",
                  focusNode:focusNode,
                ),
                RoundedInputFieldWithoutIcon(
                  inputController: PhoneNumberInputController,
                  hintText: "PhoneNumber",
                  focusNode:focusNode,
                ),
                RoundedInputFieldWithoutIcon(
                  inputController: ReferralCodeInputController,
                  hintText: "ReferralCode",
                  focusNode:focusNode,
                ),
                (isLoading)?LoadingButton():
                RoundedButton(
                    text: "Submit",
                    press: () async {
                      var accountNumber=AccountNumberInputController.text;
                      var AcType=acType;
                      var CustomerName=CustomerNameInputController.text;
                      var Address1=Address1InputController.text;
                      var Address2=Address2InputController.text;
                      var Currency=CurrencyInputController.text;
                      var BirthDate=startDate;
                      var Email=EmailInputController.text;
                      var Prefix=PrefixInputController.text;
                      var FirstName=FirstNameInputController.text;
                      var LastName=LastNameInputController.text;
                      var OtherName=OtherNameInputController.text;
                      var ShortName=ShortNameInputController.text;
                      var Gender=_selectedGender;
                      var IdType=IdTypeInputController.text;
                      var IdNumber=IdNumberInputController.text;
                      var Material=MaritalInputController.text;
                      var Nationality=NationalityInputController.text;
                      var PhoneNumber=PhoneNumberInputController.text;
                      var Referral=ReferralCodeInputController.text;

                      Map<String, dynamic> map={
                        "accountNumber": accountNumber,
                      "accoutClass": AcType,
                      "additionalAccount": true,
                      "address1": Address1,
                      "address2": Address2,
                      "address3": "",
                      "address4": "",
                      "ccy": Currency,
                      "country": "SIE",
                      "customerName": CustomerName,
                      "dob": BirthDate.toString(),
                      "email": Email,
                      "fax": "",
                      "firstName": FirstName,
                      "gender": Gender,
                      "idNumber":IdNumber,
                      "idType": IdType,
                      "language": "ENG",
                      "lastName": LastName,
                      "maritalStatus": Material,
                      "nationality": Nationality,
                      "otherNames": OtherName,
                      "phoneNumber": PhoneNumber,
                      "prefix": Prefix,
                      "referralCode": Referral,
                      "shortName": ShortName
                      };
                      Provider.of<CustomerProvider>(context,listen: false).existingCustomer(context,map);
                      //model.validation(context,map);
                    }
                ),
                SizedBox(height: size.height * 0.03),
              ],
            )
        ),
      ),
    );
  }
}
