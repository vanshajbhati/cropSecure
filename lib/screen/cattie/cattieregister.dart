import 'dart:io';

import 'package:cropsecure/provider/authprovider.dart';
import 'package:cropsecure/screen/addfarmer/addfarmersuccessfull.dart';
import 'package:cropsecure/screen/bankdetail/addbankdetail.dart';
import 'package:cropsecure/utill/color_resources.dart';
import 'package:cropsecure/utill/dimensions.dart';
import 'package:cropsecure/utill/styles.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class CattieRegister extends StatefulWidget {

  @override
  State<CattieRegister> createState() => _CattieRegisterState();
}


class _CattieRegisterState extends State<CattieRegister> {

  int tagRadio = 1;
  String userType = "New Cattle";
  bool isLoad = false;
  String cattleType = "",liftStage = "",age = "",breed = "";
  List<String> gender = ["Male","Female"];
  List<String> handicapped = ["Yes","No"];
  List<String> minority = ["Yes","No"];
  List<String> caste = ["Gen","OBC","SC","ST"];
  List<String> state = ["Uttar Pradesh","Uttrakhand","Jharkhand"];
  TextEditingController cattleNameController = TextEditingController();
  TextEditingController bodyWeightController = TextEditingController();
  TextEditingController heatDateController = TextEditingController();
  TextEditingController remarksController = TextEditingController();
  File filename;
  File newFile;
  PlatformFile file;

  void onFileOpenPhoto() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg','png'],);
    if(result != null) {
      file = result.files.first;
      filename = File(file.path);
      setState(() {
        newFile = filename;
      });
    }
  }

  void showSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message),
        backgroundColor: Colors.red);

    // Find the Scaffold in the Widget tree and use it to show a SnackBar!
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(27),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(
                child: Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Transform.scale(
                          scale: 1.0,
                          child: Radio(
                            activeColor: ColorResources.light_purple,
                            value: 1,
                            groupValue: tagRadio,
                            onChanged: (val) {
                              setState(() {
                                tagRadio = 1;
                                userType = "New Cattle";
                              });
                            },
                          ),
                        ),
                        const Text(
                            "New Cattle",
                            style: TextStyle(
                                color: ColorResources.black,
                                fontWeight: FontWeight.normal,
                                fontSize: Dimensions.text_13,
                                fontFamily: "Roboto")),

                        Transform.scale(
                            scale: 1.0,
                            child: Radio(
                              activeColor: ColorResources.light_purple,
                              value: 2,
                              groupValue: tagRadio,
                              onChanged: (val) {
                                setState(() {
                                  tagRadio = 2;
                                  userType = "Old Cattle";
                                });
                              },
                            )),

                        const Text(
                          "Old Cattle",
                          style: TextStyle(
                              color: ColorResources.black,
                              fontWeight: FontWeight.normal,
                              fontSize: Dimensions.text_13,
                              fontFamily: "Roboto"),
                        ),
                      ],
                    )),
              ),

              const SizedBox(
                height: 15,
              ),

              Text("Cattle Name",
                style: robotoBold.copyWith(
                    color: const Color(0xff262626),
                    fontSize: 17
                ),),

              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: SizedBox(
                  height: 48.0,
                  child: TextFormField(
                    controller: cattleNameController,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    decoration: InputDecoration(
                        hintText: "Cattle Name",
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintStyle: TextStyle(
                            fontSize: 14*MediaQuery.of(context).textScaleFactor,
                            color: const Color(0xffb7b7b7)
                        )
                    ),
                  ),
                ),
              ),


              const SizedBox(
                height: 15,
              ),

              Text("Cattle Type",
                style: robotoBold.copyWith(
                    color: const Color(0xff262626),
                    fontSize: 17
                ),),

              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: SizedBox(
                  height: 48,
                  child: DropdownSearch(
                    popupShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    mode: Mode.MENU,
                    popupElevation: 5,
                    dropdownSearchDecoration: const InputDecoration(
                      hintText: "Select",
                      hintStyle: TextStyle(
                          color: ColorResources.light_purple
                      ),
                      contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                      border: OutlineInputBorder(),
                    ),
                    // showSearchBox:true,
                    onFind: (String filter) async{
                      return caste;},
                    onChanged: (String data) async{
                      cattleType = data;
                    },
                    itemAsString: (String da) => da,
                  ),
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              Text("Life Stage",
                style: robotoBold.copyWith(
                    color: const Color(0xff262626),
                    fontSize: 17
                ),),

              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: SizedBox(
                  height: 48,
                  child: DropdownSearch(
                    popupShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    mode: Mode.MENU,
                    popupElevation: 5,
                    dropdownSearchDecoration: const InputDecoration(
                      hintText: "Select state",
                      hintStyle: TextStyle(
                          color: ColorResources.light_purple
                      ),
                      contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                      border: OutlineInputBorder(),
                    ),
                    // showSearchBox:true,
                    onFind: (String filter) async{
                      return state;},
                    onChanged: (String data) async{
                      liftStage = data;
                    },
                    itemAsString: (String da) => da,
                  ),
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              Text("Age",
                style: robotoBold.copyWith(
                    color: const Color(0xff262626),
                    fontSize: 17
                ),),

              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: SizedBox(
                  height: 48,
                  child: DropdownSearch(
                    popupShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    mode: Mode.MENU,
                    popupElevation: 5,
                    dropdownSearchDecoration: const InputDecoration(
                      hintText: "Select state",
                      hintStyle: TextStyle(
                          color: ColorResources.light_purple
                      ),
                      contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                      border: OutlineInputBorder(),
                    ),
                    // showSearchBox:true,
                    onFind: (String filter) async{
                      return state;},
                    onChanged: (String data) async{
                      age = data;
                    },
                    itemAsString: (String da) => da,
                  ),
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              Text("Breed",
                style: robotoBold.copyWith(
                    color: const Color(0xff262626),
                    fontSize: 17
                ),),

              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: SizedBox(
                  height: 48,
                  child: DropdownSearch(
                    popupShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    mode: Mode.MENU,
                    popupElevation: 5,
                    dropdownSearchDecoration: const InputDecoration(
                      hintText: "Select state",
                      hintStyle: TextStyle(
                          color: ColorResources.light_purple
                      ),
                      contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                      border: OutlineInputBorder(),
                    ),
                    // showSearchBox:true,
                    onFind: (String filter) async{
                      return state;},
                    onChanged: (String data) async{
                      breed = data;
                    },
                    itemAsString: (String da) => da,
                  ),
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              Text("Body Weight",
                style: robotoBold.copyWith(
                    color: const Color(0xff262626),
                    fontSize: 17
                ),),

              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: SizedBox(
                  height: 48.0,
                  child: TextFormField(
                    maxLines: 1,
                    controller: bodyWeightController,
                    keyboardType: TextInputType.number,
                    autofocus: false,
                    decoration: InputDecoration(
                        hintText: "",
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintStyle: TextStyle(
                            fontSize: 14*MediaQuery.of(context).textScaleFactor,
                            color: const Color(0xffb7b7b7)
                        )
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              Text("Heat Date",
                style: robotoBold.copyWith(
                    color: const Color(0xff262626),
                    fontSize: 17
                ),),

              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: SizedBox(
                  height: 48.0,
                  child: TextFormField(
                    controller: heatDateController,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    decoration: InputDecoration(
                        hintText: "",
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintStyle: TextStyle(
                            fontSize: 14*MediaQuery.of(context).textScaleFactor,
                            color: const Color(0xffb7b7b7)
                        )
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              Text("Remarks",
                style: robotoBold.copyWith(
                    color: const Color(0xff262626),
                    fontSize: 17
                ),),

              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: SizedBox(
                  height: 48.0,
                  child: TextFormField(
                    controller: remarksController,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    decoration: InputDecoration(
                        hintText: "",
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintStyle: TextStyle(
                            fontSize: 14*MediaQuery.of(context).textScaleFactor,
                            color: const Color(0xffb7b7b7)
                        )
                    ),
                  ),
                ),
              ),


              Container(
                padding: const EdgeInsets.only(left: 0,right: 0),
                margin: const EdgeInsets.only(top: 30),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Photo",
                          style: robotoMedium.copyWith(
                              color: const Color(0xff262626)
                          ),),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("",
                          style: robotoMedium.copyWith(
                              color: const Color(0xff262626)
                          ),),
                      ),
                    )
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.only(left: 0,right: 0),
                margin: const EdgeInsets.only(top: 8),
                height: 140,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: const Color(0xffb7b7b7))
                        ),
                        child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(2),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: const Color(0xffe1ddde)

                                  ),
                                  height: 40,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 12.0),
                                      child: Text("Photo",
                                        style: robotoMedium.copyWith(
                                            color: const Color(0xff262626)
                                        ),),
                                    ),
                                  ),
                                ),

                                InkWell(
                                  onTap: ()=> onFileOpenPhoto(),
                                  child: Container(
                                      margin: const EdgeInsets.only(right: 4,bottom: 3),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(13),
                                          color: const Color(0xffb7b7b7)
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Icon(Icons.image_outlined,size: 25,),
                                      )),
                                ),
                              ],
                            ),
                            newFile == null ? const Text(""):Positioned(
                                top: 0, bottom: 0,right: 0,left: 0,
                                child: Container(
                                  height: 60,
                                  padding: const EdgeInsets.fromLTRB(20,45,25,30),
                                  child: Image.file(newFile,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(width: 20,),

                    const Expanded(
                      flex: 1,
                      child: Text(""),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: isLoad == true ?
                const Center(
                  child: SizedBox(width: 22,height: 22,
                      child: CircularProgressIndicator()),) :
                SizedBox(
                    height: 47.0,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(const Color(0xFF6cbd47),), //button color
                      ),
                      onPressed: () async {

                        if(cattleNameController.text.isEmpty){
                          showSnackBar("Enter cattle name");
                        }else if(cattleType == ""){
                          showSnackBar("Select cattle type");
                        }else if(liftStage == ""){
                          showSnackBar("Select lift stage");
                        }else if(age == ""){
                          showSnackBar("Select age");
                        }else if(breed == ""){
                          showSnackBar("Select breed");
                        }else if(bodyWeightController.text.isEmpty){
                          showSnackBar("Enter body weight");
                        }else if(heatDateController.text.isEmpty){
                          showSnackBar("Enter heat date");
                        }else if(remarksController.text.isEmpty){
                          showSnackBar("Enter remarks");
                        }else if(newFile == null){
                          showSnackBar("Select photo");
                        }else{

                          setState(() {
                            isLoad = true;
                          });

                          await Provider.of<AuthProvider>(context,listen: false).newCattleApi(userType, cattleNameController.text, cattleType, liftStage, age, breed, bodyWeightController.text, heatDateController.text, remarksController.text, newFile);

                          setState(() {
                            isLoad = false;
                          });
                        }
                      },
                      child: Text('Save',
                          style: robotoBold.copyWith(fontSize: 19,color: Colors.white)),
                    )),
              ),

              Row(children: const[
                   Expanded(child: ElevatedButton(
                    child: Text("Add"),
                  )),

                  SizedBox(width: 15,),

                   Expanded(child: ElevatedButton(
                    child: Text("Edit"),
                  )),

                   SizedBox(width: 15,),

                   Expanded(child: ElevatedButton(
                    child: Text("Details"),
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
