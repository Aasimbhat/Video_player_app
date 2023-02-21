import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_app/colors.dart';
import 'package:video_player_app/video_info.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List info=[];
  _initData(){
    DefaultAssetBundle.of(context).loadString("json/info.json").then((value){
        setState(() {
             info=json.decode(value);

        });
    });
  }
@override
void initState() {
  super.initState();
  _initData();
  
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.homePageBackground,
      body: Container(
        padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Training",
                  style: TextStyle(
                      fontSize: 30,
                      color: AppColor.homePageTitle,
                      fontWeight: FontWeight.w700),
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.arrow_back_ios,
                  color: AppColor.homePageIcons,
                  size: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.calendar_today_outlined,
                  color: AppColor.homePageIcons,
                  size: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColor.homePageIcons,
                  size: 20,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  "Your Program",
                  style: TextStyle(
                      fontSize: 20,
                      color: AppColor.homePageSubtitle,
                      fontWeight: FontWeight.w700),
                ),
                Expanded(child: Container()),
                InkWell(
                   onTap: (){
                    Get.to(()=>VideoInfo());
                  },

                  child: Text(
                    "Details",
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColor.homePageDetail,
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: (){
                    Get.to(()=>VideoInfo());
                  },

                  child: Icon(
                    Icons.arrow_forward,
                    size: 20,
                    color: AppColor.homePageIcons,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 220,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      topRight: Radius.circular(80)),
                  gradient: LinearGradient(colors: [
                    AppColor.gradientFirst.withOpacity(0.8),
                    AppColor.gradientSecond.withOpacity(0.9)
                  ], begin: Alignment.bottomLeft, end: Alignment.centerRight),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(5, 10),
                        blurRadius: 20,
                        color: AppColor.gradientSecond.withOpacity(0.7))
                  ]),
              child: Container(
                padding: const EdgeInsets.only(left: 20, top: 25, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Next Workout",
                      style: TextStyle(
                          fontSize: 16,
                          color: AppColor.homePageContainerTextSmall),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Legs Toning",
                      style: TextStyle(
                          fontSize: 25,
                          color: AppColor.homePageContainerTextSmall),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "and Glutes Workout",
                      style: TextStyle(
                          fontSize: 25,
                          color: AppColor.homePageContainerTextSmall),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.timer,
                              size: 20,
                              color: AppColor.homePageContainerTextSmall,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "60 min",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: AppColor.homePageContainerTextSmall),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                        Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: AppColor.gradientFirst,
                                blurRadius: 10,
                                offset: Offset(4, 8)),
                          ], borderRadius: BorderRadius.circular(60)),
                          child: Icon(
                            Icons.play_circle_fill,
                            color: Colors.white,
                            size: 60,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 140,
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage("images/card.jpg"),
                            fit: BoxFit.fill),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 40,
                              offset: Offset(8, 10),
                              color: AppColor.gradientSecond.withOpacity(0.5)),
                          BoxShadow(
                              blurRadius: 40,
                              offset: Offset(-1, -5),
                              color: AppColor.gradientSecond.withOpacity(0.5))
                        ]),
                  ),
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(
                      right: 200,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage("images/figure.png"),
                      ),
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 100,
                    margin: EdgeInsets.only(left: 150, top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "You are doing great",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColor.homePageDetail),
                        ),
                        SizedBox(height: 10),
                        RichText(
                            text: TextSpan(
                                text: "Keep it up \n",
                                style: TextStyle(
                                    color: AppColor.homePagePlanColor,
                                    fontSize: 16),
                                children: [
                              TextSpan(text: "stick to your plan")
                            ])),
                      ],
                    ),
                  ),
           
                ],
              ),
            ),
            SizedBox(
              height: 18,
            ),
                   Row(
                    children: [
                      Text(
                        "Area of focus",
                        textAlign: TextAlign.center,
                        style:TextStyle(
                          fontSize: 25,
                          fontWeight:FontWeight.w500,
                          color: AppColor.homePageTitle

                        )
                      ),
                    ],
                  ),
                  Expanded(child: 
                  OverflowBox(
                    maxWidth: MediaQuery.of(context).size.width,
                    child: MediaQuery.removePadding(context: context, 
                      removeTop: true,
                      child: ListView.builder(
                        
                        itemCount: (info.length.toDouble()/2).toInt(),
                        itemBuilder: (_,i){
                          int a=2*1;
                          int b=2*i+1;
                          return Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(bottom: 5),
                                height: 170,
                                margin: EdgeInsets.only(left: 30,bottom: 15,top: 15),
                                width: (MediaQuery.of(context).size.width-90)/2,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(image: 
                                  AssetImage(info[a]["img"])),
                                  boxShadow: [
                                    BoxShadow(
                                      offset:Offset(5,5),
                                      blurRadius: 3,
                                      color: AppColor.gradientSecond.withOpacity(0.2)
                                    ),
                                     BoxShadow(
                                      offset:Offset(-5,-5),
                                      blurRadius: 3,
                                      color: AppColor.gradientSecond.withOpacity(0.2)
                                    ),
                                  ]
                                ),
                                child: Center(
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      info[a]["title"],
                                      style: TextStyle( 
                                        fontSize:20,
                                        color: AppColor.homePageDetail
                                  
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                               Container(
                                padding: EdgeInsets.only(bottom: 5),
                                height: 170,
                                width: (MediaQuery.of(context).size.width-90)/2,
                                margin: EdgeInsets.only(left: 30,bottom: 15,top: 15),
                    
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(image: 
                                  AssetImage(info[b]["img"])),
                                  boxShadow: [
                                    BoxShadow(  
                                      offset:Offset(5,5),
                                      blurRadius: 3,
                                      color: AppColor.gradientSecond.withOpacity(0.2)
                                    ),
                                     BoxShadow(
                                      offset:Offset(-5,-5),
                                      blurRadius: 3,
                                      color: AppColor.gradientSecond.withOpacity(0.2)
                                    ),
                                  ]
                                ),
                                child: Center(
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      info[b]["title"],
                                      style: TextStyle( 
                                        fontSize:20,
                                        color: AppColor.homePageDetail
                                  
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                      
                      ),
                    ),
                  ))
          ],
        ),
      ),
    );
  }
}
