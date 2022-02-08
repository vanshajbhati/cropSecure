import 'package:cropsecure/utill/color_resources.dart';
import 'package:cropsecure/utill/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RaiseAlertDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: Text("Raise Alerts",
          style: robotoBold.copyWith(color: Colors.white,
              fontSize: 19),),
        leading: InkWell(
            onTap: (){
              Get.back();
            },child: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
              elevation: 9,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [

                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        child:Image.asset("assets/image/farmer.png",
                          width: 50,
                          height: 50,),
                      ),

                      const SizedBox(width: 12,),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("APHIDS",
                              style: robotoBold.copyWith(
                                  color: ColorResources.light_purple,
                                  fontSize: 16
                              ),),

                            Text("Lorem ipsum sjh sdjk djksd eia djk djeua djs dj jsd ajkd",
                              style: robotoRegular.copyWith(
                                  color: ColorResources.light_purple,
                                  fontSize: 13
                              ),)

                          ],
                        ),
                      ),

                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: const Color(0xffebe9ea),width: 1),
                  ),),

                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(top: 20),
                      width: MediaQuery.of(context).size.width,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: const Color(0xffebe9ea),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text("Recommended advice",
                          style: robotoBold.copyWith(
                            color: Colors.black,
                            fontSize: 16
                          ),),

                          Text("Spraying of 1.7mi Dimethoate 30% EC. or 1mi methi parathion 50 Ec per litre if water",
                            style: robotoRegular.copyWith(
                                color: Colors.black,
                              fontSize: 12
                            ),),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20,),

                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      value: true, onChanged: (value){},
                      title: Text("Area is affected",
                        style: robotoMedium.copyWith(
                            fontSize: 19),),),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(15.0,10,15,0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Area is affected",
                                style: robotoMedium.copyWith(
                                    fontSize: 19),),

                              Icon(Icons.calendar_today_rounded)
                            ],
                          ),
                          const Divider(thickness: 2,),

                          const SizedBox(height: 15,),

                          const TextField(
                            decoration: InputDecoration(
                                hintText: "New Advice",
                                isDense: true,
                                filled: false
                            ),
                          )
                          // const Divider(thickness: 2,)
                        ],
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(top: 20,left: 10,right: 10),
                      width: MediaQuery.of(context).size.width,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: const Color(0xffebe9ea),
                      ),
                      child: const Icon(Icons.camera,size: 36,),
                    ),

                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(top: 20,left: 10,right: 10),
                      width: MediaQuery.of(context).size.width,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: const Color(0xffebe9ea),
                      ),
                      child: const Icon(Icons.mic,size: 36,),
                    ),

                    const SizedBox(height: 25,),

                    const Padding(
                      padding: EdgeInsets.only(left: 15.0,right: 15),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Comments",
                          isDense: true,
                          filled: false
                        ),
                      ),
                    )

                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(right: 20.0,top: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: (){}, child: Text("Cancel",
                    style: robotoBold.copyWith(
                        color: const Color(0xff262626),
                        fontSize: 17
                    ),)),

                  const SizedBox(width: 30,),

                  ElevatedButton(onPressed: (){},
                      child: Text("Submit",style: robotoBold.copyWith(
                          color: Colors.white
                      ),))

                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
