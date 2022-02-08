import 'package:cropsecure/screen/expenditure/addexpenditure.dart';
import 'package:cropsecure/screen/expenditure/expenditurehistory.dart';
import 'package:cropsecure/screen/yields/addyeilds.dart';
import 'package:cropsecure/screen/yields/yieldshistory.dart';
import 'package:cropsecure/utill/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class YieldScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            leading: InkWell(
                onTap: (){
                  Get.back();
                },
                child: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
            titleSpacing: 10,
            title: Text("Yields",
              style: robotoExtraBold.copyWith(
                color: Colors.white,
                fontSize: 19,
              ),),
            bottom: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                    boxShadow: const[
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ), //BoxShadow
                    ],
                    gradient: const LinearGradient(
                        colors: [Colors.white, Colors.white]),
                    borderRadius: BorderRadius.circular(1),
                    color: const Color(0xff6dbc47)),
                unselectedLabelColor: Colors.white,
                isScrollable: false,
                labelStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: "Proxima Nova",
                    fontWeight: FontWeight.w600
                ),
                tabs:const[
                  Tab(text: "Add Yields"),
                  Tab(text: "History"),])),

        body: TabBarView(
          children: [
            AddYields(),
            YieldsHistory(),
          ],
        ),
      ),
    );
  }
}