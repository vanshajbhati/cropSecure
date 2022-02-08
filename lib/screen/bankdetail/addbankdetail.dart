import 'dart:io';

import 'package:cropsecure/provider/authprovider.dart';
import 'package:cropsecure/screen/addfarmer/addfarmersuccessfull.dart';
import 'package:cropsecure/utill/color_resources.dart';
import 'package:cropsecure/utill/styles.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class AddBankDetail extends StatefulWidget {

  final String id;
  AddBankDetail({this.id});

  @override
  State<AddBankDetail> createState() => _AddBankDetailState();
}

class _AddBankDetailState extends State<AddBankDetail> {

  TextEditingController accountNameController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController ifscCodeController = TextEditingController();
  TextEditingController branchController = TextEditingController();
  bool isLoad = false;

  List<String> accountType = ["ac1", "ac2", "ac3"];
  List<String> bankName = ["bank1", "bank2", "bank3"];
  String accountTypeSelect="";
  String bankNameSelect="";

  PlatformFile file;
  File filename;
  File newFilePassbook =null;


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
        title: Text("Bank Details",
          style: robotoBold.copyWith(color: Colors.white,
              fontSize: 19),),
        leading: InkWell(
            onTap: (){
              Get.back();},
            child: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(27),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text("Account Type",
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
                      hintText: "Select Account Type",
                      hintStyle: TextStyle(
                          color: ColorResources.light_purple
                      ),
                      contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                      border: OutlineInputBorder(),
                    ),
                    // showSearchBox:true,
                    onFind: (String filter) async{
                      return accountType;},
                    onChanged: (String data) async{
                      accountTypeSelect = data;
                    },
                    itemAsString: (String da) => da,
                  ),
                ),
              ),


              const SizedBox(
                height: 15,
              ),

              Text("Account Name",
                style: robotoBold.copyWith(
                    color: const Color(0xff262626),
                    fontSize: 17
                ),),

              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: SizedBox(
                  height: 48.0,
                  child: TextFormField(
                    controller: accountNameController,
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

              Text("Account Number",
                style: robotoBold.copyWith(
                    color: const Color(0xff262626),
                    fontSize: 17
                ),),

              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: SizedBox(
                  height: 48.0,
                  child: TextFormField(
                    controller: accountNumberController,
                    maxLines: 1,
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

              Text("IFSC CODE",
                style: robotoBold.copyWith(
                    color: const Color(0xff262626),
                    fontSize: 17
                ),),

              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: SizedBox(
                  height: 48.0,
                  child: TextFormField(
                    controller: ifscCodeController,
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

              Text("Bank Name",
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
                      hintText: "Select Bank Name",
                      hintStyle: TextStyle(
                          color: ColorResources.light_purple
                      ),
                      contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                      border: OutlineInputBorder(),
                    ),
                    // showSearchBox:true,
                    onFind: (String filter) async{
                      return bankName;},
                    onChanged: (String data) async{
                    bankNameSelect = data;
                    },
                    itemAsString: (String da) => da,
                  ),
                ),
              ),


              const SizedBox(
                height: 15,
              ),

              Text("Branch",
                style: robotoBold.copyWith(
                    color: const Color(0xff262626),
                    fontSize: 17
                ),),

              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: SizedBox(
                  height: 48.0,
                  child: TextFormField(
                    controller: branchController,
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

              const SizedBox(height: 20,),

              Text("Upload Passbook",
                style: robotoMedium.copyWith(
                    color: const Color(0xff262626),
                    fontSize: 17
                ),),

              const SizedBox(height: 10,),

              Center(
                child:  Container(
                  padding: const EdgeInsets.only(left: 0,right: 0),
                  margin: const EdgeInsets.only(top: 8),
                  height: 140,
                  width: 180,
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
                                  child: Text("Upload Passbook",
                                    style: robotoMedium.copyWith(
                                        color: const Color(0xff262626)
                                    ),),
                                ),
                              ),
                            ),

                            InkWell(
                              onTap: ()=> onFileOpenPassbook(),
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

                        newFilePassbook == null ? const Text(""):Positioned(
                            top: 0, bottom: 0,right: 0,left: 0,
                            child: Container(
                              height: 60,
                              padding: const EdgeInsets.fromLTRB(20,45,25,30),
                              child: Image.file(newFilePassbook,
                              ),
                            ))

                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: isLoad == true ? const Center(
                  child: SizedBox(
                    width: 22,
                      height: 22,
                      child: CircularProgressIndicator()),
                ):
                SizedBox(
                    height: 47.0,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(const Color(0xFF6cbd47),), //button color
                      ),
                      onPressed: () async {
                        if(accountNameController.text.isEmpty){
                          showSnackBar("Enter account holder name");
                        }else if(accountTypeSelect==""){
                          showSnackBar("Select Account Type");
                        }else if(accountNumberController.text.isEmpty){
                          showSnackBar("Enter account number");
                        }else if(ifscCodeController.text.isEmpty){
                          showSnackBar("Enter ifsc code");
                        }else if(bankNameSelect==""){
                          showSnackBar("Select Bank Name");
                        }else if(branchController.text.isEmpty){
                          showSnackBar("Enter branch name");
                        }else if(newFilePassbook==null) {
                          showSnackBar("upload passbook");
                        }else{
                          setState(() {
                            isLoad = true;
                          });
                          // Get.to(() => AddFarmerSuccessfull(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 600));
                          await Provider.of<AuthProvider>(context,listen: false).addBankDetailsApi(bankNameSelect,ifscCodeController.text,
                              accountNumberController.text,accountNameController.text,branchController.text,widget.id , newFilePassbook, accountTypeSelect);

                          setState(() {
                            isLoad = false;
                          });
                        }

                        },
                      child: Text('Save',
                          style: robotoBold.copyWith(fontSize: 19,color: Colors.white)),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }



  void onFileOpenPassbook() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg','png'],);
    if(result != null) {
      file = result.files.first;
      filename = File(file.path);
      setState(() {
        newFilePassbook = filename;
      });
    }
  }
}
