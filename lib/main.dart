// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import "Light.dart";
import 'Controller.dart';
import 'Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(debugShowCheckedModeBanner: false, home: App());
    });
  }
}

class App extends StatelessWidget {
  myAppController controller = myAppController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<myAppController>(
      // specify type as Controller
      init: myAppController(), // intialize with the Controller
      builder: (myAppController controller) => Scaffold(
        body: Container(
            child: IndexedStack(
          index: controller.myIndex,
          children: [
            Home(),
            Light(),
          ],
        )),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.fromLTRB(25.sp, 15.sp, 25.sp, 15.sp),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20.sp)),
            child: BottomAppBar(
                color: Color(0xFF5AC2DA),
                child: Container(
                    padding:
                        EdgeInsetsDirectional.only(top: 1.h, bottom: 0.5.h),
                    height: 8.5.h,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MaterialButton(
                              minWidth: 10,
                              onPressed: () {
                                controller.changeIndex(0);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.home,
                                    color: controller.myIndex == 0
                                        ? Color.fromARGB(255, 255, 255, 255)
                                        : Color.fromARGB(178, 255, 255, 255),
                                    size: 23.sp,
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  controller.myIndex == 0
                                      ? CircleAvatar(
                                          minRadius: 0.3.h,
                                          maxRadius: 0.3.h,
                                          backgroundColor: Colors.white,
                                        )
                                      : SizedBox(),
                                ],
                              )),
                          MaterialButton(
                              minWidth: 10,
                              onPressed: () {
                                controller.changeIndex(1);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.pie_chart_outline,
                                    color: controller.myIndex == 1
                                        ? Color.fromARGB(255, 255, 255, 255)
                                        : Color.fromARGB(178, 255, 255, 255),
                                    size: 23.sp,
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  controller.myIndex == 1
                                      ? CircleAvatar(
                                          minRadius: 0.3.h,
                                          maxRadius: 0.3.h,
                                          backgroundColor: Colors.white,
                                        )
                                      : SizedBox(),
                                ],
                              )),
                        ]))),
          ),
        ),
      ),
    );
  }
}
