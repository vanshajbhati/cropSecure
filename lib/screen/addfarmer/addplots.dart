import 'dart:io';

import 'package:cropsecure/provider/authprovider.dart';
import 'package:cropsecure/screen/addfarmer/addPlotSuccessfull.dart';
import 'package:cropsecure/utill/color_resources.dart';
import 'package:cropsecure/utill/styles.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';
import 'package:provider/provider.dart';

class AddPlots extends StatefulWidget {

  final String id;
  AddPlots({this.id});

  @override
  State<AddPlots> createState() => _AddPlotsState();
}

class _AddPlotsState extends State<AddPlots> {
  List<String> gender = ["Male","Female"];
  List<String> selectUnit = ["Beegha","Hectare","Square"];
  String area="",category="",soiltype="",irrigation="",water="",district="",
  taluka ="",gramPan = "",village = "";
  bool isLoad = false;
  TextEditingController surveyController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  File filename;
  File newFile;
  PlatformFile file;
  File newFilePan,newFileRashan,newFileFarmer;

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

  void showSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message),
        backgroundColor: Colors.red);

    // Find the Scaffold in the Widget tree and use it to show a SnackBar!
    ScaffoldMessenger.of(context).showSnackBar(snackBar);}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: Text("Register Plot",
          style: robotoBold.copyWith(color: Colors.white,
              fontSize: 19),),
        leading: InkWell(
            onTap: (){
              Get.back();
            },
            child: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: SizedBox(
                  height: 48.0,
                  child: TextFormField(
                    controller: surveyController,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    decoration: InputDecoration(
                        hintText: "Survey No",
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

              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: SizedBox(
                  height: 48,
                  child: DropdownSearch(
                    popupShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    mode: Mode.MENU,
                    popupElevation: 5,
                    dropdownSearchDecoration: const InputDecoration(
                      hintText: "Area (Select from unit)",
                      hintStyle: TextStyle(
                          color: ColorResources.light_purple
                      ),
                      contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                      border: OutlineInputBorder(),
                    ),
                    // showSearchBox:true,
                    onFind: (String filter) async{
                      return selectUnit;},
                    onChanged: (String data) async{
                      area = data;
                    },
                    itemAsString: (String da) => da,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: SizedBox(
                  height: 48.0,
                  child: TextFormField(
                    controller: areaController,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    decoration: InputDecoration(
                        hintText: "Area",
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

              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: SizedBox(
                  height: 48,
                  child: DropdownSearch(
                    popupShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    mode: Mode.MENU,
                    popupElevation: 5,
                    dropdownSearchDecoration: const InputDecoration(
                      hintText: "Category",
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
                      category = data;
                    },
                    itemAsString: (String da) => da,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: SizedBox(
                  height: 48,
                  child: DropdownSearch(
                    popupShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    mode: Mode.MENU,
                    popupElevation: 5,
                    dropdownSearchDecoration: const InputDecoration(
                      hintText: "Soil type",
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
                      soiltype = data;
                    },
                    itemAsString: (String da) => da,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: SizedBox(
                  height: 48,
                  child: DropdownSearch(
                    popupShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    mode: Mode.MENU,
                    popupElevation: 5,
                    dropdownSearchDecoration: const InputDecoration(
                      hintText: "Source of irrigation",
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
                      irrigation = data;
                    },
                    itemAsString: (String da) => da,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: SizedBox(
                  height: 48,
                  child: DropdownSearch(
                    popupShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    mode: Mode.MENU,
                    popupElevation: 5,
                    dropdownSearchDecoration: const InputDecoration(
                      hintText: "Source of water",
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
                      water = data;
                    },
                    itemAsString: (String da) => da,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: SizedBox(
                  height: 48,
                  child: DropdownSearch(
                    popupShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    mode: Mode.MENU,
                    popupElevation: 5,
                    dropdownSearchDecoration: const InputDecoration(
                      hintText: "District",
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
                      district = data;
                    },
                    itemAsString: (String da) => da,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: SizedBox(
                  height: 48,
                  child: DropdownSearch(
                    popupShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    mode: Mode.MENU,
                    popupElevation: 5,
                    dropdownSearchDecoration: const InputDecoration(
                      hintText: "Taluka",
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
                      taluka = data;
                    },
                    itemAsString: (String da) => da,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: SizedBox(
                  height: 48,
                  child: DropdownSearch(
                    popupShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    mode: Mode.MENU,
                    popupElevation: 5,
                    dropdownSearchDecoration: const InputDecoration(
                      hintText: "Gram Panchayath",
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
                      gramPan = data;
                    },
                    itemAsString: (String da) => da,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: SizedBox(
                  height: 48,
                  child: DropdownSearch(
                    popupShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    mode: Mode.MENU,
                    popupElevation: 5,
                    dropdownSearchDecoration: const InputDecoration(
                      hintText: "Village",
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
                      village = data;
                    },
                    itemAsString: (String da) => da,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: SizedBox(
                  height: 48.0,
                  child: TextFormField(
                    controller: pincodeController,
                    maxLines: 1,
                    keyboardType: TextInputType.number,
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

              Container(
                padding: const EdgeInsets.only(left: 0,right: 0),
                margin: const EdgeInsets.only(top: 30),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Farmer Plot",
                          style: robotoMedium.copyWith(
                              color: const Color(0xff262626)
                          ),),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Phani Plot",
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
                                      child: Text("Farmer Plot",
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
                                      child: Text("Phani Plot",
                                        style: robotoMedium.copyWith(
                                            color: const Color(0xff262626)
                                        ),),
                                    ),
                                  ),
                                ),

                                InkWell(
                                  onTap: ()=> getImage(ImgSource.Both),
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

              if(isLoad)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 25.0),
                    child: SizedBox(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator()),
                  ),
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
                          if(surveyController.text.isEmpty){
                            showSnackBar("Enter survey number");
                          }else if(area == ""){
                            showSnackBar("Select area");
                          }else if(areaController.text.isEmpty){
                            showSnackBar("Enter area");
                          }else if(category == ""){
                            showSnackBar("Select category");
                          }else if(soiltype == ""){
                            showSnackBar("Select soiltype");
                          }else if(irrigation == ""){
                            showSnackBar("Select source of irrigation");
                          }else if(water == ""){
                            showSnackBar("Select source of water");
                          }else if(district == ""){
                            showSnackBar("Select district");
                          }else if(taluka == ""){
                            showSnackBar("Select taluka");
                          }else if(gramPan == ""){
                            showSnackBar("Select gram panchayath");
                          }else if(village == ""){
                            showSnackBar("Select village");
                          }else if(pincodeController.text.isEmpty){
                            showSnackBar("Enter pincode");
                          }else if(pincodeController.text.length>6){
                            showSnackBar("Enter valid pincode");
                          }else if(newFile == null){
                            showSnackBar("Upload farmer plot");
                          }else if(newFilePan == null){
                            showSnackBar("Upload phani plot");
                          }else{
                            setState(() {
                              isLoad = true;
                            });
                             Get.to(() => AddPlotSuccessfull(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 600));
                            await Provider.of<AuthProvider>(context,listen: false).addPlotsApi(widget.id, surveyController.text, area, category,
                                soiltype, irrigation, water, district, taluka,
                                gramPan, village, pincodeController.text, newFile, newFilePan, "28.6210", "77.3812");

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

  var _image;

  Future getImage(ImgSource source) async {
    var image = await ImagePickerGC.pickImage(
        enableCloseButton: true,
        closeIcon: Icon(
          Icons.close,
          color: Colors.red,
          size: 12,
        ),
        context: context,
        source: source,
        barrierDismissible: true,
        cameraIcon: Icon(
          Icons.camera_alt,
          color: Colors.red,
        ), //cameraIcon and galleryIcon can change. If no icon provided default icon will be present
        cameraText: Text(
          "From Camera",
          style: TextStyle(color: Colors.red),
        ),
        galleryText: Text(
          "From Gallery",
          style: TextStyle(color: Colors.blue),
        ));
    setState(() {
      _image = image;
    });
  }


}

