import 'package:cropsecure/screen/addfarmer/addplots.dart';
import 'package:cropsecure/screen/addfarmer/viewplots.dart';
import 'package:cropsecure/utill/app_constants.dart';
import 'package:cropsecure/utill/sharedprefrence.dart';
import 'package:cropsecure/utill/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FarmerDetails extends StatefulWidget {

  final String id;
  FarmerDetails({this.id});

  @override
  State<FarmerDetails> createState() => _FarmerDetailsState();
}

class _FarmerDetailsState extends State<FarmerDetails> {

  String name="",address="",gender="",age="",dob="",image="", aadharNumber="";

  void getData()async{
    var names = await SharedPrefManager.getPrefrenceString(AppConstants.farmerName);
    var addresses = await SharedPrefManager.getPrefrenceString(AppConstants.addressFarmer);
    var genders = await SharedPrefManager.getPrefrenceString(AppConstants.genderFarmer);
    var ages = await SharedPrefManager.getPrefrenceString(AppConstants.age);
    var dobs = await SharedPrefManager.getPrefrenceString(AppConstants.dobFarmer);
    var images = await SharedPrefManager.getPrefrenceString(AppConstants.farmerImage);
    var aadharNo = await SharedPrefManager.getPrefrenceString(AppConstants.farmerImage);
    setState(() {
      name = names;
      address = addresses;
      gender = genders;
      age = ages;
      dob = dobs;
      image = images;
      aadharNumber=aadharNo;
    });

  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: Text("Farmer Details",
          style: robotoBold.copyWith(color: Colors.white,
              fontSize: 19),),
        leading: InkWell(
            onTap: (){
              Get.back();
            },
            child: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.network(AppConstants.Image+image,height: 230,),
            ),

            Text(name==""?"":name,
              style: robotoBold.copyWith(
                  color: const Color(0xff262626),
                  fontSize: 16
              ),),

            Text(aadharNumber,
              style: robotoRegular.copyWith(
                  color: const Color(0xffb8b8b8),
                  fontSize: 10
              ),),

            Padding(
              padding: const EdgeInsets.all(10),
              child: Text("Info",
                style: robotoBold.copyWith(
                    color: const Color(0xff262626),
                    fontSize: 16
                ),),
            ),

            Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: const Color(0xffb7b7b7))),
              child: Column(
                children: [
                  Row(
                    children: [

                      const Icon(Icons.add_location),

                      Text("Address",
                      style: robotoRegular.copyWith(
                        color: const Color(0xff262626)
                      ),),


                    ],
                  ),

                  Text(address,
                    textAlign: TextAlign.start,
                    style: robotoRegular.copyWith(
                        color: const Color(0xff262626),
                        fontSize: 12
                    ),),

                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      children: [

                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Text("Gender",
                              style: robotoRegular.copyWith(
                                  color: const Color(0xff262626)
                              ),),
                          ),
                        ),

                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Text("Date of Birth",
                              style: robotoRegular.copyWith(
                                  color: const Color(0xff262626)
                              ),),
                          ),
                        ),

                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Text("Age",
                              style: robotoRegular.copyWith(
                                  color: const Color(0xff262626)
                              ),),
                          ),
                        ),

                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      children: [

                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Text(gender,
                              style: robotoRegular.copyWith(
                                  color: const Color(0xff262626),
                              ),),
                          ),
                        ),

                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Text(dob,
                              style: robotoRegular.copyWith(
                                  color: const Color(0xff262626)
                              ),),
                          ),
                        ),

                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Text(age,
                              style: robotoRegular.copyWith(
                                  color: const Color(0xff262626)
                              ),),
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                children: [

                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Text("Plots",
                        style: robotoBold.copyWith(
                          color: const Color(0xffc4c4c4),
                          fontSize: 17
                        ),),
                    ),
                  ),

                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: (){
                        Get.to(() => AddPlots(id:widget.id),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 600));
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: const Color(0xffc4c4c4))
                            ),
                              child: const Padding(
                                padding: EdgeInsets.all(1.0),
                                child: Icon(Icons.add),
                              )),

                          const SizedBox(width: 5,),

                          Text("Add Plots",
                            style: robotoBold.copyWith(
                                color: const Color(0xff262626),
                                fontSize: 15
                            ),),

                        ],
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: (){
                        Get.to(() => ViewPlots(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 600));
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: const Color(0xffc4c4c4))
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(1.0),
                                child: Icon(Icons.add),
                              )),

                          const SizedBox(width: 5,),

                          Text("View Plots",
                            style: robotoBold.copyWith(
                                color: const Color(0xff262626),
                                fontSize: 15
                            ),),

                        ],
                      ),
                    ),
                  )

                ],
              ),
            ),

            Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: const Color(0xffb7b7b7))),
              child: Column(
                children: [
                  Row(
                    children: [

                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Text("1",
                              style: robotoBold.copyWith(
                                  color: const Color(0xff262626),
                                  fontSize: 22
                              ),),

                            const SizedBox(width: 5,),

                            Text("Plots",
                              style: robotoBold.copyWith(
                                  color: const Color(0xff262626),
                                  fontSize: 13
                              ),),
                          ],
                        )
                      ),

                      Container(
                        height: 90,
                        width: 2,
                        color: const Color(0xffb7b7b7),
                      ),

                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("0.442",
                              style: robotoBold.copyWith(
                                  color: const Color(0xff262626),
                                  fontSize: 22
                              ),),

                            const SizedBox(width: 5,),

                            Text("Acre",
                              style: robotoBold.copyWith(
                                  color: const Color(0xff262626),
                                  fontSize: 13
                              ),),

                          ],
                        ),
                      )

                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Text("Farmers Surveys",
                        style: robotoBold.copyWith(
                            color: const Color(0xffc4c4c4),
                            fontSize: 16
                        ),),
                    ),
                  ),

                  Expanded(
                    flex: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: const Color(0xffc4c4c4))
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(1.0),
                              child: Icon(Icons.add),
                            )),

                        const SizedBox(width: 5,),

                        Text("View Plots",
                          style: robotoBold.copyWith(
                              color: const Color(0xff262626),
                              fontSize: 15
                          ),),

                      ],
                    ),
                  )

                ],
              ),
            ),

            Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: const Color(0xffb7b7b7))),
              child: Column(
                children: [
                  Row(
                    children: [

                      Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Text("0",
                                style: robotoBold.copyWith(
                                    color: const Color(0xff262626),
                                    fontSize: 22
                                ),),

                              const SizedBox(width: 5,),

                              Text("Unfilled",
                                style: robotoBold.copyWith(
                                    color: const Color(0xff262626),
                                    fontSize: 13
                                ),),
                            ],
                          )
                      ),

                      Container(
                        height: 90,
                        width: 2,
                        color: const Color(0xffb7b7b7),
                      ),

                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("0",
                              style: robotoBold.copyWith(
                                  color: const Color(0xff262626),
                                  fontSize: 22
                              ),),

                            const SizedBox(width: 5,),

                            Text("Filed",
                              style: robotoBold.copyWith(
                                  color: const Color(0xff262626),
                                  fontSize: 13
                              ),),

                          ],
                        ),
                      )

                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
