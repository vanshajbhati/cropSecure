import 'package:cropsecure/provider/authprovider.dart';
import 'package:cropsecure/utill/color_resources.dart';
import 'package:cropsecure/utill/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    Provider.of<AuthProvider>(context, listen: false).fetchProfileApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black,
                      width: 1)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Image.asset("assets/image/farmer.png",width: 30,height: 40,),

                      const SizedBox(width: 7,),

                      Text("114 farmer",
                      style: robotoBold.copyWith(
                        color: Colors.grey)),

                    ],
                  ),

                  const SizedBox(height: 10,),

                  Text("114 Plots",
                    style: robotoMedium.copyWith(
                        color: Colors.grey
                    ),),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 5,
                    color: ColorResources.light_purple,
                  ),

                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(height: 5,),
                        Text("110 Plots audited",
                          style: robotoRegular.copyWith(
                              color: Colors.green,
                              fontSize: 13),),

                        Text("113 Plots Ceo tagged",
                          style: robotoRegular.copyWith(
                              color: Colors.grey,
                              fontSize: 13
                          ),),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  Text("6135 Acre Declared,0",
                    style: robotoRegular.copyWith(
                        color: Colors.grey,
                      fontSize: 13
                    ),),

                  const SizedBox(height: 1),

                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: 5,
                      color: Colors.grey
                  ),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("74. Acre Adult",
                      style: robotoRegular.copyWith(
                          color: Colors.green,
                          fontSize: 13
                      ),),
                  ),

                  const SizedBox(height: 25),

                  Text("6135 Alerts",
                    style: robotoRegular.copyWith(
                        color: Colors.yellow,
                        fontSize: 13
                    ),),

                  const SizedBox(height: 1),

                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: 5,
                      color: Colors.grey
                  ),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("0 Alerts",
                      style: robotoRegular.copyWith(
                          color: Colors.green,
                          fontSize: 13
                      ),),
                  ),

                  const SizedBox(height: 25),

                  Text("123 Forms",
                    style: robotoRegular.copyWith(
                        color: Colors.yellow,
                        fontSize: 13
                    ),),

                  const SizedBox(height: 1),

                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: 5,
                      color: Colors.grey
                  ),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("0 Forms Filed",
                      style: robotoRegular.copyWith(
                          color: Colors.green,
                          fontSize: 13
                      ),),
                  ),

                ],
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black,
                      width: 1)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Nearby Plots",
                      style: robotoBold.copyWith(
                          color: Colors.grey)),

                  const SizedBox(height: 1,),

                  Text("1 Plots within 2km rating",
                    style: robotoRegular.copyWith(
                        color: Colors.grey
                    ),),

                  Image.asset("assets/image/location.png",width: 65,height: 65,),

                ],
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black,
                      width: 1)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Harvest",
                      style: robotoBold.copyWith(
                          color: Colors.grey)),

                  const SizedBox(height: 1,),

                  Text("Top 5 varieties",
                    style: robotoRegular.copyWith(
                        color: Colors.green
                    ),),

                  SizedBox(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [

                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Center(
                                  child: Text("0 Tonne",
                                    style: robotoBold.copyWith(
                                        color: const Color(0xffbfbfbf),
                                        fontSize: 17
                                    ),),
                                ),
                              ),

                              Container(
                                height: 2,
                                width: 80,
                                color: const Color(0xffd4d4d4),
                              ),

                              Expanded(
                                flex: 1,
                                child: Center(
                                  child: Text("98 Tonne",
                                    style: robotoBold.copyWith(
                                        color: const Color(0xffbfbfbf),
                                        fontSize: 17
                                    ),),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          width: 2,
                          height: 80,
                          color: const Color(0xffc4c4c4),
                        ),

                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Center(
                                  child: Text("0 Tonne",
                                    style: robotoBold.copyWith(
                                        color: const Color(0xffbfbfbf),
                                        fontSize: 17
                                    ),),
                                ),
                              ),

                              Container(
                                height: 2,
                                width: 80,
                                color: const Color(0xffd4d4d4),
                              ),

                              Expanded(
                                flex: 1,
                                child: Center(
                                  child: Text("98 Tonne",
                                    style: robotoBold.copyWith(
                                        color: const Color(0xffbfbfbf),
                                        fontSize: 17
                                    ),),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          width: 2,
                          height: 80,
                          color: const Color(0xffc4c4c4),
                        ),

                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Center(
                                  child: Text("0 Tonne",
                                    style: robotoBold.copyWith(
                                        color: const Color(0xffbfbfbf),
                                        fontSize: 17
                                    ),),
                                ),
                              ),

                              Container(
                                height: 2,
                                width: 80,
                                color: const Color(0xffd4d4d4),
                              ),

                              Expanded(
                                flex: 1,
                                child: Center(
                                  child: Text("98 Tonne",
                                    style: robotoBold.copyWith(
                                        color: const Color(0xffbfbfbf),
                                        fontSize: 17
                                    ),),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),

            const SizedBox(height: 20,),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Image.asset("assets/image/farmer.png",width: 30,height: 40,),

                const SizedBox(width: 7,),

                Text("124 Tasks",
                    style: robotoBold.copyWith(
                        color: Colors.grey)),

                const SizedBox(width: 7,),

              ],
            ),

          ],
        ),
      ),
    );
  }
}
