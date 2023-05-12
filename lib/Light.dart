// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, import_of_legacy_library_into_null_safe
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Light extends StatefulWidget {
  const Light({super.key});

  @override
  State<Light> createState() => _LightState();
}

class _LightState extends State<Light> {
  int inx = -1;
  int perc = 50;

  final List<IconData> icons = [
    Icons.ac_unit,
    Icons.lightbulb,
    Icons.tv_outlined,
    Icons.thermostat,
  ];
  TimeOfDay _timeOfDay = TimeOfDay(hour: 8, minute: 30);
  TimeOfDay _timeOfDay2 = TimeOfDay(hour: 8, minute: 30);

  void _showTimePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() {
        _timeOfDay = value!;
      });
    });
  }

  void _showTimePicker2() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((val) {
      setState(() {
        _timeOfDay2 = val!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var n = 4;
    var listOfContainers = <Padding>[];
    var list = List<int>.generate(n, (i) => i + 1);
    bool _switchValue = true;
    double progressValue = 20.0;
    double b = perc * 1.0;

    list.forEach((i) {
      Color borderColor = (i == inx) ? Color(0xFF5AC2DA) : Color(0xFF5AC2DA);
      Color boxColor = (i == inx) ? Color(0xFF5AC2DA) : Colors.white;
      Color iconColor = (i == inx) ? Colors.white : Color(0xFF5AC2DA);
      IconData icon = icons[i - 1];

      return listOfContainers.add(
        Padding(
          padding: const EdgeInsets.all(0),
          child: Container(
            width: 15.w,
            height: 7.5.h,
            decoration: BoxDecoration(
                color: boxColor,
                border: Border.all(width: 0.3.w, color: borderColor),
                borderRadius: BorderRadius.all(Radius.circular(15.sp))),
            child: InkWell(
                onTap: () {
                  setState(() {
                    inx = i;
                    print(i);
                  });
                },
                child: Icon(
                  icon, // Using icon based on index
                  color: iconColor,
                  size: 25.sp,
                )),
          ),
        ),
      );
    });

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: 0),
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(8.w, 5.h, 8.w, 3.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 3.w),
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 18.sp,
                    ),
                    SizedBox(width: 29.w),
                    Text('Light',
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 19.sp, fontWeight: FontWeight.w600))),
                  ],
                ),
                SizedBox(height: 3.h),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: listOfContainers),
                SizedBox(height: 2.h),
                Container(
                  width: 78.w,
                  height: 11.h,
                  padding: EdgeInsets.fromLTRB(5.w, 0.h, 6.w, 0.h),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(216, 181, 227, 238),
                      borderRadius: BorderRadius.all(Radius.circular(22.sp))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Chandelier Lamp',
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontSize: 14.5.sp,
                                      fontWeight: FontWeight.w400))),
                          SizedBox(height: 1.h),
                          Text('3 hours',
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontSize: 18.5.sp,
                                      fontWeight: FontWeight.w800))),
                        ],
                      ),
                      Transform.scale(
                        scale: 4.5.sp,
                        child: CupertinoSwitch(
                          value: _switchValue,
                          thumbColor: Color.fromARGB(255, 29, 164, 194),
                          activeColor: Color.fromARGB(255, 145, 212, 228),
                          onChanged: (value) {
                            setState(() {
                              _switchValue = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2.5.h),
                Container(
                  height: 28.h,
                  child: SfRadialGauge(axes: <RadialAxis>[
                    RadialAxis(
                      minimum: -180,
                      maximum: 220,
                      canScaleToFit: false,
                      showLabels: false,
                      showTicks: false,
                      startAngle: 90,
                      endAngle: 90,
                      axisLineStyle: AxisLineStyle(
                        thickness: 1.8.sp,
                        cornerStyle: CornerStyle.bothFlat,
                        color: Color.fromARGB(82, 203, 244, 248),
                        thicknessUnit: GaugeSizeUnit.factor,
                      ),
                      pointers: <GaugePointer>[
                        RangePointer(
                            value: progressValue,
                            width: 1.8.sp,
                            sizeUnit: GaugeSizeUnit.factor,
                            cornerStyle: CornerStyle.bothFlat,
                            gradient: const SweepGradient(colors: <Color>[
                              Color.fromARGB(191, 29, 178, 211),
                              Color.fromARGB(104, 32, 182, 216)
                            ], stops: <double>[
                              0.25,
                              0.5
                            ])),
                        MarkerPointer(
                            value: progressValue,
                            markerType: MarkerType.circle,
                            color: Colors.white,
                            markerOffset: 0.sp,
                            markerHeight: 25.sp,
                            markerWidth: 25.sp,
                            borderColor: Color.fromARGB(191, 29, 178, 211),
                            borderWidth: 12.sp,
                            imageUrl: " noti.png")
                      ],
                    )
                  ]),
                ),
                SizedBox(height: 2.h),
                LinearPercentIndicator(
                  width: 55.w,
                  animation: true,
                  animationDuration: 1000,
                  lineHeight: 2.5.h,
                  leading: Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Text('OFF',
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 15.sp,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500))), //left content
                  ),
                  trailing: Padding(
                    //sufix content
                    padding: EdgeInsets.only(left: 15),
                    child: Text('100%',
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 15.5.sp,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500))), //left content
                    //right content
                  ),
                  percent: b / 100, // 30/100 = 0.3
                  linearStrokeCap: LinearStrokeCap
                      .roundAll, //make round cap at start and end both
                  progressColor:
                      Color(0xFF5AC2DA), //percentage progress bar color
                  backgroundColor: Color.fromARGB(
                      216, 181, 227, 238), //background progressbar color
                ),
                SizedBox(height: 0.5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text((perc).toString(),
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 15.sp,
                                color: Color(0xFF5AC2DA),
                                fontWeight: FontWeight.w800))),
                    Text("%",
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 15.sp,
                                color: Color(0xFF5AC2DA),
                                fontWeight: FontWeight.w800))),
                  ],
                ),
                SizedBox(height: 2.h),
                Container(
                  width: 80.w,
                  height: 16.h,
                  padding: EdgeInsets.fromLTRB(6.w, 0.h, 6.w, 0.h),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(216, 181, 227, 238),
                      borderRadius: BorderRadius.all(Radius.circular(20.sp))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Schedule',
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontSize: 18.5.sp,
                                      fontWeight: FontWeight.w900))),
                          Container(
                              padding: EdgeInsets.all(5.sp),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Color(0xFF5AC2DA),
                                  border: Border.all(
                                      width: 0.3.w, color: Color(0xFF5AC2DA)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(23.sp))),
                              child: Icon(Icons.add,
                                  color: Colors.white, size: 19.sp)),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('  From',
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w500))),
                              SizedBox(height: 1.h),
                              InkWell(
                                onTap: _showTimePicker,
                                child: Container(
                                  height: 4.5.h,
                                  width: 30.w,
                                  padding:
                                      EdgeInsets.fromLTRB(3.w, 1.h, 2.w, 1.h),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 0.3.w, color: Colors.grey),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(23.sp))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                          _timeOfDay.format(context).toString(),
                                          style: GoogleFonts.lato(
                                              textStyle: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontWeight:
                                                      FontWeight.w500))),
                                      Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        size: 20.sp,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('  To',
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w500))),
                              SizedBox(height: 1.h),
                              InkWell(
                                onTap: _showTimePicker2,
                                child: Container(
                                  height: 4.5.h,
                                  width: 30.w,
                                  padding:
                                      EdgeInsets.fromLTRB(3.w, 1.h, 2.w, 1.h),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 0.3.w, color: Colors.grey),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(23.sp))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                          _timeOfDay2
                                              .format(context)
                                              .toString(),
                                          style: GoogleFonts.lato(
                                              textStyle: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontWeight:
                                                      FontWeight.w500))),
                                      Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        size: 20.sp,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
