import 'dart:ui';

import 'package:cropsecure/screen/addfarmer/addplots.dart';
import 'package:cropsecure/screen/dashboard.dart';
import 'package:cropsecure/utill/styles.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AddFarmerSuccessfull extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        Get.offAll(()=>Dashboard());
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          centerTitle: true,
          title: Text("Register Farmer",
            style: robotoBold.copyWith(color: Colors.white,
                fontSize: 19),),
          leading: InkWell(
              onTap: (){
                Get.offAll(()=> Dashboard());
              },
              child: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Container(
              width: 350,
              height: 400,
              color: Colors.transparent,
              child: Image.asset("assets/image/Register-farmer.png", fit: BoxFit.fitHeight,),

            ),

            Padding(
              padding: const EdgeInsets.only(left: 90,right: 90),
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                          height: 47.0,
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all<Color>(const Color(0xFF6cbd47),), //button color
                            ),
                            onPressed: () async {
                              Fluttertoast.showToast(msg: "Your plot had been register successfully");
                              Get.to(() => AddPlots(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 600));

                              // Get.offAll(() => Dashboard(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 600));
                              // await Provider.of<AuthProvider>(context,listen: false).loginUserApi(userName.text, password.text, userType);
                            },
                            child: Text('Register Plot',
                                style: robotoBold.copyWith(fontSize: 19,color: Colors.white)),
                          )),
                      Positioned(
                          right: 10,
                          top: 0,
                          bottom: 0,
                          child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: const Color(0xffffffff))
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Icon(Icons.arrow_forward_ios,color: Colors.white,size: 20,),
                              )))
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Stack(
                      children: [
                        SizedBox(
                            height: 47.0,
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.all<Color>(const Color(0xFF6cbd47),), //button color
                              ),
                              onPressed: () async {
                                 Get.to(() => Dashboard(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 600));
                              },
                              child: Text('Close',
                                  style: robotoBold.copyWith(fontSize: 19,color: Colors.white)),
                            )),
                        Positioned(
                            right: 10,
                            top: 0,
                            bottom: 0,
                            child: InkWell(
                              onTap: (){
                                Get.offAll(()=>Dashboard());
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: const Color(0xffffffff))
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: Icon(Icons.clear,color: Colors.white,size: 20,),
                                  )),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}