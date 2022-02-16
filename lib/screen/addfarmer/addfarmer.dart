import 'dart:io';

import 'package:cropsecure/provider/authprovider.dart';
import 'package:cropsecure/screen/addfarmer/addfarmersuccessfull.dart';
import 'package:cropsecure/screen/bankdetail/addbankdetail.dart';
import 'package:cropsecure/utill/color_resources.dart';
import 'package:cropsecure/utill/styles.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';




class AddFarmer extends StatefulWidget {

  final String register;
  AddFarmer({this.register});

  @override
  State<AddFarmer> createState() => _AddFarmerState();
}

class _AddFarmerState extends State<AddFarmer> {

  List<String> gender = ["Male","Female"];
  bool isLoad = false;
  List<String> handicapped = ["Yes","No"];
  List<String> minority = ["Yes","No"];
  List<String> caste = ["Gen","OBC","SC","ST"];
  List<String> state = ["Uttar Pradesh","Uttrakhand","Jharkhand"];
  List<String> taluka = ["taluka1", "taluka2", "taluka3"];
  List<String> hobali = ["hobali1", "hobali2", "hobali3"];
  List<String> village = ["village1", "village2", "village3"];
  DateTime selectedDate = DateTime.now();
  var formatDate;
  String genderSelect="",handicappedSelect="",
      minoritySelect="",casteSelect="",stateSelect="",districtSelect="",gramaSelect="", talukaSelect="", hobaliSelect="", villageSelect="";

  TextEditingController farmerName = TextEditingController();
  TextEditingController fatherHusbandName = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  TextEditingController talukaController = TextEditingController();
  TextEditingController hobaliController = TextEditingController();
  TextEditingController villageController = TextEditingController();

  TextEditingController rashan_noController = TextEditingController();
  TextEditingController pan_noController = TextEditingController();
  TextEditingController aadhaar_noController = TextEditingController();


  File filename;
  File newFile = null;
  PlatformFile file;

  File newFilePan =null ,newFileRashan=null,newFileFarmer=null;

  void onFileOpenAdhaar() async {
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

  void onFileOpenPan() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg','png'],);
    if(result != null) {
      file = result.files.first;
      filename = File(file.path);
      setState(() {
        newFilePan = filename;
      });
    }
  }

  void onFileOpenRaashan() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg','png'],);
    if(result != null) {
      file = result.files.first;
      filename = File(file.path);
      setState(() {
        newFileRashan = filename;
      });
    }
  }


  void onFileOpenFarmer() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg','png'],);
    if(result != null) {
      file = result.files.first;
      filename = File(file.path);
      setState(() {
        newFileFarmer = filename;
      });
    }
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(1940),
      lastDate: DateTime(2035),);

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        formatDate = selectedDate.year.toString() + "/"+selectedDate.month.toString() + "/" +selectedDate.day.toString();
      }
      );
      print(selectedDate.year);
      calculateAge(selectedDate.year, selectedDate.month, selectedDate.day);
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
      appBar: widget.register == "kk" ? null:AppBar(
        elevation: 1,
        centerTitle: true,
        title: Text("Register Farmer",
          style: robotoBold.copyWith(color: Colors.white,
              fontSize: 19),),
        leading: InkWell(
            onTap: (){
              Get.back();},
            child: const Icon(Icons.arrow_back_ios,color: Colors.white,))),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(27),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text("Farmer Name",
                style: robotoBold.copyWith(
                    color: const Color(0xff262626),
                    fontSize: 17
                ),),

              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: SizedBox(
                  height: 48.0,
                  child: TextFormField(
                    controller: farmerName,
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

              Text("Father Name/Husband Name",
                style: robotoBold.copyWith(
                    color: const Color(0xff262626),
                    fontSize: 17
                ),),

              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: SizedBox(
                  height: 48.0,
                  child: TextFormField(
                    controller: fatherHusbandName,
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

              Text("Gender",
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
                      hintText: "Select Gender",
                      hintStyle: TextStyle(
                          color: ColorResources.light_purple
                      ),
                      contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                      border: OutlineInputBorder(),
                    ),
                    // showSearchBox:true,
                    onFind: (String filter) async{
                      return gender;},
                    onChanged: (String data) async{
                      genderSelect = data;
                    },
                    itemAsString: (String da) => da,
                  ),
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              Text("Date of Birth",
                style: robotoBold.copyWith(
                    color: const Color(0xff262626),
                    fontSize: 17
                ),),

              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: InkWell(
                  onTap: ()=> _selectDate(context),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(color: const Color(0xffb7b7b7))
                    ),
                    height: 48,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text(formatDate ?? "DOB",
                        style: robotoMedium.copyWith(
                          color: const Color(0xff262626)
                        ),),
                      ),
                    ),
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
                  height: 48.0,
                  child: TextFormField(
                    controller: ageController,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    decoration: InputDecoration(
                        hintText: age.toString(),
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

              Text("Handicapped",
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
                      return handicapped;},
                    onChanged: (String data) async{
                      handicappedSelect = data;
                    },
                    itemAsString: (String da) => da,
                  ),
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              Text("Minority",
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
                      return minority;},
                    onChanged: (String data) async{
                      minoritySelect = data;
                    },
                    itemAsString: (String da) => da,
                  ),
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              Text("Caste",
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
                      casteSelect = data;
                    },
                    itemAsString: (String da) => da,
                  ),
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              Text("Mobile Number",
                style: robotoBold.copyWith(
                    color: const Color(0xff262626),
                    fontSize: 17
                ),),

              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: SizedBox(
                  height: 48.0,
                  child: TextFormField(
                    controller: mobileController,
                    maxLines: 1,
                    keyboardType: TextInputType.phone,
                    autofocus: false,
                    decoration: InputDecoration(
                        hintText: "Mobile Number",
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

              Text("Pincode",
                style: robotoBold.copyWith(
                    color: const Color(0xff262626),
                    fontSize: 17
                ),),

              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: SizedBox(
                  height: 48.0,
                  child: TextFormField(
                    controller: pinController,
                    maxLines: 1,
                    keyboardType: TextInputType.phone,
                    autofocus: false,
                    decoration: InputDecoration(
                        hintText: "Pincode",
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

              Text("State",
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
                      stateSelect = data;
                    },
                    itemAsString: (String da) => da,
                  ),
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              Text("District Name",
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
                      hintText: "Select district",
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
                      districtSelect = data;
                    },
                    itemAsString: (String da) => da,
                  ),
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              Text("Taluka",
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
                      hintText: "Select Taluka",
                      hintStyle: TextStyle(
                          color: ColorResources.light_purple
                      ),
                      contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                      border: OutlineInputBorder(),
                    ),
                    // showSearchBox:true,
                    onFind: (String filter) async{
                      return taluka;},
                    onChanged: (String data) async{
                      talukaSelect = data;
                    },
                    itemAsString: (String da) => da,
                  ),
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              Text("Hobali",
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
                      hintText: "Select Hobali",
                      hintStyle: TextStyle(
                          color: ColorResources.light_purple
                      ),
                      contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                      border: OutlineInputBorder(),
                    ),
                    // showSearchBox:true,
                    onFind: (String filter) async{
                      return hobali;},
                    onChanged: (String data) async{
                      hobaliSelect = data;
                    },
                    itemAsString: (String da) => da,
                  ),
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              Text("Grama Panchayath",
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
                    showSearchBox: true,
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
                      return state;},
                    onChanged: (String data) async{
                      gramaSelect = data;
                    },
                    itemAsString: (String da) => da,
                  ),
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              Text("Village Name",
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
                      hintText: "Select Village",
                      hintStyle: TextStyle(
                          color: ColorResources.light_purple
                      ),
                      contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                      border: OutlineInputBorder(),
                    ),
                    // showSearchBox:true,
                    onFind: (String filter) async{
                      return village;},
                    onChanged: (String data) async{
                      villageSelect = data;
                    },
                    itemAsString: (String da) => da,
                  ),
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              Text("Rashan Number",
                style: robotoBold.copyWith(
                    color: const Color(0xff262626),
                    fontSize: 17
                ),),

              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: SizedBox(
                  height: 48.0,
                  child: TextFormField(
                    controller: rashan_noController,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    decoration: InputDecoration(
                        hintText: "Rashan Number",
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

              Text("Pan Number",
                style: robotoBold.copyWith(
                    color: const Color(0xff262626),
                    fontSize: 17
                ),),

              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: SizedBox(
                  height: 48.0,
                  child: TextFormField(
                    controller: pan_noController,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    decoration: InputDecoration(
                        hintText: "Pan Number",
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

              Text("Aadhaar Number",
                style: robotoBold.copyWith(
                    color: const Color(0xff262626),
                    fontSize: 17
                ),),

              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: SizedBox(
                  height: 48.0,
                  child: TextFormField(
                    controller: aadhaar_noController,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    decoration: InputDecoration(
                        hintText: "Aadhaar Number",
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
                        child: Text("Upload Aadhar",
                          style: robotoMedium.copyWith(
                              color: const Color(0xff262626)
                          ),),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("upload Pan Card",
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
                                      child: Text("Aadhar Card",
                                        style: robotoMedium.copyWith(
                                            color: const Color(0xff262626)
                                        ),),
                                    ),
                                  ),
                                ),



                                InkWell(
                                  onTap: ()=> onFileOpenAdhaar(),
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
                                      child: Text("Pan Card",
                                        style: robotoMedium.copyWith(
                                            color: const Color(0xff262626)
                                        ),),
                                    ),
                                  ),
                                ),

                                InkWell(
                                  onTap: ()=> onFileOpenPan(),
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
                            newFilePan == null ? const Text(""):Positioned(
                                top: 0, bottom: 0,right: 0,left: 0,
                                child: Container(
                                  height: 60,
                                  padding: const EdgeInsets.fromLTRB(20,45,25,30),
                                  child: Image.file(newFilePan,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ],
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
                        child: Text("Upload Rashan Card",
                          style: robotoMedium.copyWith(
                              color: const Color(0xff262626)
                          ),),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Farmer Photo",
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
                                      child: Text("Rashan Card",
                                        style: robotoMedium.copyWith(
                                            color: const Color(0xff262626)
                                        ),),
                                    ),
                                  ),
                                ),

                                InkWell(
                                  onTap: ()=> onFileOpenRaashan(),
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

                            newFileRashan == null ? const Text(""):Positioned(
                                top: 0, bottom: 0,right: 0,left: 0,
                                child: Container(
                                  height: 60,
                                  padding: const EdgeInsets.fromLTRB(20,45,25,30),
                                  child: Image.file(newFileRashan,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(width: 20,),

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
                                      child: Text("Farmer Photo",
                                        style: robotoMedium.copyWith(
                                            color: const Color(0xff262626)
                                        ),),
                                    ),
                                  ),
                                ),

                                InkWell(
                                  onTap: ()=> onFileOpenFarmer(),
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

                            newFileFarmer == null ? const Text(""):Positioned(
                                top: 0, bottom: 0,right: 0,left: 0,
                                child: Container(
                                  height: 60,
                                  padding: const EdgeInsets.fromLTRB(20,45,25,30),
                                  child: Image.file(newFileFarmer,
                                  ),
                                ))

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              if(isLoad)
                const Center(
                  child: SizedBox(
                    width: 30,
                      height: 30,
                      child: CircularProgressIndicator()),
                )
              else
                Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: SizedBox(
                    height: 47.0,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(const Color(0xFF6cbd47),), //button color
                      ),
                      onPressed: () async {
                        if(farmerName.text.isEmpty){
                          showSnackBar("Enter farmer name");
                        }else if(fatherHusbandName.text.isEmpty){
                          showSnackBar("Enter father/husband name");
                        }else if(genderSelect == ""){
                          showSnackBar("Select gender");
                        }else if(formatDate == null){
                          showSnackBar("Select dob");
                        }else if(ageController.text.isEmpty){
                          showSnackBar("Enter age");
                        }else if(handicappedSelect == ""){
                          showSnackBar("Select handicapped");
                        }else if(minoritySelect == ""){
                          showSnackBar("Select minority");
                        }else if(casteSelect == ""){
                          showSnackBar("Select caste");
                        }else if(mobileController.text.isEmpty){
                          showSnackBar("Enter mobile number");
                        }else if(pinController.text.isEmpty){
                          showSnackBar("Enter pincode");
                        }else if(stateSelect==""){
                          showSnackBar("Select state");
                        }else if(districtSelect==""){
                          showSnackBar("Select district");
                        }else if(talukaSelect==""){
                          showSnackBar("Select taluka");
                        }else if(hobaliSelect==""){
                          showSnackBar("Select hobali");
                        }else if(gramaSelect == ""){
                          showSnackBar("Select grama");
                        }else if(villageSelect==""){
                          showSnackBar("Select village");
                        }else if(mobileController.text.length!=10 & mobileController.text.length!=12 ){
                          showSnackBar("Enter a valid number");
                        }else if(pinController.text.length>6){
                          showSnackBar("Enter a valid pincode");
                        }else{
                          setState(() {
                            isLoad = true;
                          });
                          // Get.to(() => AddBankDetail(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 600));
                          await Provider.of<AuthProvider>(context,listen: false).registerFarmerApi(farmerName.text, fatherHusbandName.text,
                              mobileController.text,
                              villageSelect, gramaSelect, hobaliSelect, talukaSelect,
                              districtSelect,districtSelect, genderSelect, formatDate, ageController.text, handicappedSelect,
                              minoritySelect, casteSelect, newFile, newFileRashan, newFilePan, newFileFarmer, rashan_noController.text, pan_noController.text, aadhaar_noController.text);

                          setState(() {
                            isLoad = false;
                          });
                        }
                      },
                      child: Text('Submit',
                          style: robotoBold.copyWith(fontSize: 19,color: Colors.white)),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int age=0;

  void calculateAge(int year, int month, int date){

int thisYear = 0;


if(month<DateTime.now().month){
  thisYear = 1;
}else if(month==DateTime.now().month&& date<=DateTime.now().day){
  thisYear=1;
}

age= DateTime.now().year - year -1 +thisYear;

ageController.text=age.toString();




  }
}
