import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:skypebank/Components/ImageFromGalleryEx.dart';
import 'package:skypebank/Components/datePicker.dart';
import 'package:skypebank/Components/rounded_button.dart';
import 'package:skypebank/Components/rounded_input_field.dart';
import 'package:intl/intl.dart';
import 'package:skypebank/Components/text_field_container.dart';
import '../Utils.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as Io;

import 'package:flutter/foundation.dart';

import 'CustomerProvider.dart';

class NewCustomerPage extends StatefulWidget {
  const NewCustomerPage({Key? key}) : super(key: key);

  @override
  _NewCustomerPageState createState() => _NewCustomerPageState();
}

class _NewCustomerPageState extends State<NewCustomerPage> {

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
            'New Customer',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: Card(
                        elevation: 3,
                        color: AppColors.drakblue,
                        child:( passportImageFile==null)?
                        Container(
                            height: size.width /2.6,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            width: size.width /2.6,
                            decoration: BoxDecoration(
                              color: AppColors.mainColorLightColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child:Center(child: Text("Upload Passport Image",textAlign: TextAlign.center,),)
                        )
                            : Image.file( Io.File(  passportImageFile!.path),height: size.width /2.6,width: size.width /2.6,fit: BoxFit.fill,),
                      ),
                      onTap: (){
                        _showChoiceDialog(context,true);
                      },
                    ),
                    GestureDetector(
                      child: Card(
                        elevation: 3,
                        color: AppColors.drakblue,
                        child:( addressImageFile==null)?
                        Container(
                            height: size.width /2.6,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            width: size.width /2.6,
                            decoration: BoxDecoration(
                              color: AppColors.mainColorLightColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child:Center(child: Text("Upload address proof",textAlign: TextAlign.center,),)
                        )
                            : Image.file( Io.File(  addressImageFile!.path),height: size.width /2.6,width: size.width /2.6,fit: BoxFit.fill,),
                      ),
                      onTap: (){
                        _showChoiceDialog(context,false);
                      },
                    ),
                  ],),
                (isLoading)?LoadingButton():
                RoundedButton(
                    text: "Submit",
                    press: () async {
                      // var CustomerName=CustomerNameInputController.text;
                      // var Address1=Address1InputController.text;
                      // var Address2=Address2InputController.text;
                      // var Currency=CurrencyInputController.text;
                      // var BirthDate=startDate;
                      // var Email=EmailInputController.text;
                      // var Prefix=PrefixInputController.text;
                      // var FirstName=FirstNameInputController.text;
                      // var LastName=LastNameInputController.text;
                      // var OtherName=OtherNameInputController.text;
                      // var ShortName=ShortNameInputController.text;
                      // var Gender=_selectedGender;
                      // var AcType=acType;
                      // var IdType=IdTypeInputController.text;
                      // var IdNumber=IdNumberInputController.text;
                      // var Material=MaritalInputController.text;
                      // var Nationality=NationalityInputController.text;
                      // var PhoneNumber=PhoneNumberInputController.text;
                      // var Referral=ReferralCodeInputController.text;
                      // final passportImagebytes = Io.File(passportImageFile!.path).readAsBytesSync();
                      // String passportImage = base64Encode(passportImagebytes);
                      // final addressImagebytes = Io.File(addressImageFile!.path).readAsBytesSync();
                      // String addressImage = base64Encode(addressImagebytes);
                      var map={
                        "accountNumber": "",
                        "accoutClass": "SAOTDI",
                        "additionalAccount": false,
                        "address1": "4 Tucker Drive",
                        "address2": "Marjay Town",
                        "address3": "Goderich",
                        "address4": "Freetown",
                        "ccy": "SLL",
                        "country": "SIE",
                        "customerName": "MEMUNAT M KAMARA",
                        "dob": "1995-01-12T08:48:41.628Z",
                        "email": "maaikamara@gmail.com",
                        "fax": "",
                        "firstName": "MEMUNAT",
                        "gender": "F",
                        "idNumber": "2488448765",
                        "idType": "Passport",
                        "language": "ENG",
                        "lastName": "KAMARA",
                        "maritalStatus": "Married",
                        "nationality": "SIE",
                        "otherNames": "M",
                        "phoneNumber": "23299350166",
                        "prefix": "Mrs",
                        "referralCode": "",
                        "shortName": "MAISANK"
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

  Future<void>_showChoiceDialog(BuildContext context,bool isPassport)
  {
    return showDialog(context: context,builder: (BuildContext context){

      return AlertDialog(
        title: Center(child: Text("Select option",style: TextStyle(color: AppColors.drakblue),),),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Divider(height: 1,color: AppColors.drakblue,),
              ListTile(
                onTap: (){
                  isPassport?
                  _openGalleryPassport(context):
                  _openGalleryAddress(context);
                },
                title: Text("Gallery"),
                leading: Icon(Icons.account_box,color: AppColors.drakblue,),
              ),

              Divider(height: 1,color: AppColors.drakblue,),
              ListTile(
                onTap: (){
                  isPassport?
                  _openCameraPassport(context):
                  _openCameraAddress(context);
                },
                title: Text("Camera"),
                leading: Icon(Icons.camera,color: AppColors.drakblue,),
              ),
            ],
          ),
        ),);
    });
  }
  void _openCameraPassport(BuildContext context)  async{
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera ,
    );
    setState(() {
      passportImageFile = pickedFile!;
    });
    Navigator.pop(context);
  }
  void _openGalleryPassport(BuildContext context) async{
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery ,
    );
    setState(() {
      passportImageFile = pickedFile!;
    });

    Navigator.pop(context);
  }

  void _openCameraAddress(BuildContext context)  async{
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera ,
    );
    setState(() {
      addressImageFile = pickedFile!;
    });
    Navigator.pop(context);
  }
  void _openGalleryAddress(BuildContext context) async{
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery ,
    );
    setState(() {
      addressImageFile = pickedFile!;
    });

    Navigator.pop(context);
  }
}
