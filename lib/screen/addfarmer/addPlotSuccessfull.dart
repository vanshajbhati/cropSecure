import 'package:camera/camera.dart';
import 'package:cropsecure/screen/addfarmer/addfarmer.dart';
import 'package:cropsecure/screen/addfarmer/addplots.dart';
import 'package:cropsecure/screen/dashboard.dart';
import 'package:cropsecure/utill/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPlotSuccessfull extends StatefulWidget  {




  const AddPlotSuccessfull({Key key}) : super(key: key);



  @override
  _AddPlotSuccessfullState createState() => _AddPlotSuccessfullState();
}

class _AddPlotSuccessfullState extends State<AddPlotSuccessfull> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        backgroundColor:Color(0xFF6cbd47),
        title: Text("Register Plot",
          style: robotoBold.copyWith(color: Colors.white,
              fontSize: 19),),
        leading: InkWell(
            onTap: (){
              Get.offAll(()=> Dashboard());
            },
            child: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Container(
            width: 250,
            height: 200,
            color: Colors.transparent,
            child: Image.asset("assets/image/plotS.png", fit: BoxFit.fitHeight,),

          ),
          
          Text("Plot Registration Successful", style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),),

          Padding(
            padding: const EdgeInsets.only(top: 20),),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 36,
                    backgroundColor: Colors.grey,
                    child: Image.asset("assets/image/plotS1.png", fit: BoxFit.fitWidth,),
                  ),
                  Text("Add Geo Tag", style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold
                  ),),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),),


              InkWell(
                onTap: (){
                  Get.to(() => AddPlots(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 600));
                },
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 36,
                      backgroundColor: Colors.grey,
                      child: Image.asset("assets/image/plotS2.png", fit: BoxFit.fitWidth,),
                    ),
                    Text("Add New Plot", style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold
                    ),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),),
              InkWell(
                onTap: (){
                  Get.to(() => AddFarmer(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 600));
                },
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 36,
                      backgroundColor: Colors.grey,
                      child: Image.asset("assets/image/plotS3.png", fit: BoxFit.fitWidth,),
                    ),
                    Text("Add New Farmer", style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold
                    ),),
                  ],
                ),
              )

            ],
          ),

          Padding(
            padding: const EdgeInsets.only(left: 90,right: 90),
            child: Column(
              children: [
                Stack(
                  children: [

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
                              Get.offAll(()=> Dashboard());
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
            ),]
          )

          ),


          Padding(
            padding: const EdgeInsets.only(top: 60),),




        ],



      ),
    );
  }

}
