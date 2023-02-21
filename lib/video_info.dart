import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_app/colors.dart';

class VideoInfo extends StatefulWidget {
  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  List videoInfo = [];
  bool _playArea=false;
  late VideoPlayerController _controller;
  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/videoinfo.json")
        .then((value) {
          setState(() {
                  videoInfo = json.decode(value);

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
      body: Container(
        decoration: _playArea==false? BoxDecoration(
            gradient: LinearGradient(
          colors: [
            AppColor.gradientFirst.withOpacity(0.9),
            AppColor.gradientSecond,
          ],
          begin: const FractionalOffset(0.0, 0.4),
          end: Alignment.topRight,
        )
        ):BoxDecoration(
          color: AppColor.gradientSecond
        ),
        child: Column(
          children: [
            _playArea==false? Container(
              padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 20,
                            color: AppColor.secondPageIconColor,
                          )),
                      Expanded(child: Container()),
                      Icon(
                        Icons.info_outline,
                        size: 20,
                        color: AppColor.secondPageIconColor,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Legs Toning",
                    style: TextStyle(
                        fontSize: 25, color: AppColor.secondPageTitleColor),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "and Glutes Workout",
                    style: TextStyle(
                        fontSize: 25, color: AppColor.secondPageTitleColor),
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
                            gradient: LinearGradient(
                              colors: [
                                AppColor.secondPageContainerGradient1stColor,
                                AppColor.secondPageContainerGradient2ndColor
                              ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.timer,
                              size: 20,
                              color: AppColor.secondPageIconColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "60 min",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: AppColor.secondPageIconColor),
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
                                gradient: LinearGradient(
                                  colors: [
                                    AppColor
                                        .secondPageContainerGradient1stColor,
                                    AppColor.secondPageContainerGradient2ndColor
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.handyman_outlined,
                                  size: 20,
                                  color: AppColor.secondPageIconColor,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Resistent band, kettebell",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColor.secondPageIconColor),
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
            ):Container(
             child: Column(
              children: [
                Container(
                  height:100,
                  padding: const EdgeInsets.only(top: 50,left: 30,right: 30),
                  child: Row(
                    children: [
                     
                         InkWell(
                          onTap: (){
                          debugPrint("tapped");
                          },
                          
                          child: Icon(Icons.arrow_back_ios,size: 20,color: AppColor.secondPageIconColor,)),
                          Expanded(child: Container()),
                          Icon(Icons.info_outline,size: 20,color: AppColor.secondPageTopIconColor,)
                    ],
                  ),
                ),
                _playView(context),
              ],
             ),


            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(70))),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        "Circuit 1: Legs Toning",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColor.circuitsColor),
                      ),
                      Expanded(child: Container()),
                      Row(
                        children: [
                          Icon(
                            Icons.loop_outlined,
                            size: 30,
                            color: AppColor.loopColor,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "3 sets",
                            style: TextStyle(
                                fontSize: 15, color: AppColor.setsColor),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal:30 ,vertical: 8),
                          itemCount: videoInfo.length,
                          itemBuilder: (_, int index) {
                            return GestureDetector(
                              onTap: () {
                                _onTapVideo(index);
                                debugPrint(index.toString());
                                setState(() {
                                  if(_playArea==false){
                                    _playArea=true;
                                  }
                                });
                              },
                              child: Container(
                                height: 135,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 80,
                                          width: 80,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      videoInfo[index]
                                                          ["thumbnail"]
                                                          ),
                                                        fit: BoxFit.cover
                                                          ),
                                                          
                                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              videoInfo[index]["title"],
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              videoInfo[index]["time"],
                                              style: TextStyle(
                                                color: Colors.grey[500],
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 18,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: 20,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            color: Color(0xffeaeefc),
                                            borderRadius: BorderRadius.circular(10)
                                          ),
                                          child: Center(
                                            child: Text(
                                              
                                              "15s rest",
                                              style: TextStyle(
                                                color: Color(0xff839fed)
                                              ),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            for (int i=0;i<70;i++)
                                             i.isEven?Container(
                                                width:3,
                                                height: 1,
                                                decoration: BoxDecoration(
                                                  color: Color(0xff839fed),
                                                  borderRadius: BorderRadius.circular(2)
                                                ),
                                              ):Container(
                                                 width:3,
                                                height: 1,
                                                color: Colors.white,
                                              )
                                        ]
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          }
                          )
                          )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
  _onTapVideo(int index){
    final controller =VideoPlayerController.network(videoInfo[index]["videoUrl"]);
    _controller=controller;
    setState(() {
      
    });
    controller..initialize().then((_){
      _controller.play();
      setState(() {
        
      });
    });
  }
 Widget _playView(BuildContext context){
   final controller=_controller;
   if(controller!=null&&controller.value.isInitialized){
    return Container(
      height: 300,
      width: 300,
      child: VideoPlayer(controller),
    );
   }else{
     return Text("Being initialized pls wait");
   }
  }
}
