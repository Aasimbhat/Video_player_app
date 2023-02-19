import 'package:flutter/material.dart';
import 'package:video_player_app/colors.dart';

class VideoInfo extends StatefulWidget {

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors:[
            AppColor.gradientFirst.withOpacity(0.9),
            AppColor.gradientSecond,
          ],
          begin: const FractionalOffset(0.0, 0.4),
          end: Alignment.topRight,
          
           )
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 70,left: 30,right: 30),
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.arrow_back_ios,size: 20,color: AppColor.secondPageIconColor,),
                       Expanded(child: Container()),
                       
                         Icon(Icons.info_outline,size: 20,color: AppColor.secondPageIconColor,),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                          Text(
                      "Legs Toning",
                      style: TextStyle(
                          fontSize: 25,
                          color: AppColor.secondPageTitleColor),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "and Glutes Workout",
                      style: TextStyle(
                          fontSize: 25,
                          color: AppColor.secondPageTitleColor),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 30,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(colors: [
                              AppColor.secondPageContainerGradient1stColor,
                              AppColor.secondPageContainerGradient2ndColor
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            
                            )

                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.timer,size: 20,color: AppColor.secondPageIconColor,),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "60 min",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColor.secondPageIconColor
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Row(
                          children: [
                            Container(
                          height: 30,
                          width: 220,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(colors: [
                              AppColor.secondPageContainerGradient1stColor,
                              AppColor.secondPageContainerGradient2ndColor
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            
                            )

                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.handyman_outlined,size: 20,color: AppColor.secondPageIconColor,),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Resistent band, kettebell",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColor.secondPageIconColor
                                ),
                              )
                            ],
                          ),
                        ),
                          ],
                        )
                     
                      ],
                    ),


                ],
              ),
            )
          ,Expanded(child: 
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topRight: Radius.circular(70))
            ),
          )
          )
          ],
        ),
      ),
    );
  }
}