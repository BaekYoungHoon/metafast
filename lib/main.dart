import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:metafast/firebase_options.dart';
import 'package:get/get.dart';
import 'package:metafast/view/stoken.dart';
import 'package:metafast/view/video_player.dart';
import 'package:metafast/view/video.dart';
import 'package:metafast/data/color.dart';
import 'package:metafast/data/controller.dart';
import 'package:metafast/view/signup.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: mainBlack,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(image: AssetImage("assets/logo.png")),
              Text(
                  "메타페스트 한국 지사",
                style: TextStyle(
                  fontSize: 20,
                  color: mainWhite,
                ),
              )
            ],
          ),
          ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Opacity(
                    opacity: 0.8,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: mainGrey,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: mainWhite,
                          width: 2,
                        ),
                      ),
                      child: MaterialButton(
                        onPressed: (){
                          Get.to(VideoScreen1());
                          view.text = 'picture';
                          title.text = '사진';
                        },
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(image: AssetImage("assets/picture.png")),
                              Text(
                                "사진",
                                style: TextStyle(
                                  color: mainWhite,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: 0.8,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: mainGrey,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: mainWhite,
                          width: 2,
                        ),
                      ),
                      child: MaterialButton(
                        onPressed: (){
                          Get.to(VideoScreen1());
                          view.text = 'event';
                          title.text = '이벤트';
                        },
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(image: AssetImage("assets/event.png")),
                              Text(
                                "이벤트",
                                style: TextStyle(
                                  color: mainWhite,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Opacity(
                    opacity: 0.8,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: mainGrey,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: mainWhite,
                          width: 2,
                        ),
                      ),
                      child: MaterialButton(
                        onPressed: (){
                          Get.to(VideoScreen1());
                          view.text = 'analyze';
                          title.text = '분석';

                        },
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(image: AssetImage("assets/qnstjr.png")),
                              Text(
                                "분석",
                                style: TextStyle(
                                  color: mainWhite,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: 0.8,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: mainGrey,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: mainWhite,
                          width: 2,
                        ),
                      ),
                      child: MaterialButton(
                        onPressed: (){
                          Get.to(VideoScreen1());
                          view.text = 'marketing';
                          title.text = '회사홍보';
                        },
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(image: AssetImage("assets/maketing.png")),
                              Text(
                                "회사홍보",
                                style: TextStyle(
                                  color: mainWhite,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Opacity(
                    opacity: 0.8,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: mainGrey,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: mainWhite,
                          width: 2,
                        ),
                      ),
                      child: MaterialButton(
                        onPressed: (){
                          Get.to(VideoScreen1());
                          view.text = 'franchiseeVideo';
                          title.text = '가맹점 영상';

                        },
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(image: AssetImage("assets/video.png")),
                              Text(
                                "가맹점 영상",
                                style: TextStyle(
                                  color: mainWhite,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: 0.8,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: mainGrey,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: mainWhite,
                          width: 2,
                        ),
                      ),
                      child: MaterialButton(
                        onPressed: (){
                          Get.to(VideoScreen1());
                          view.text = 'businessVideo';
                          title.text = '사업 영상';

                        },
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(image: AssetImage("assets/video.png")),
                              Text(
                                "사업 영상",
                                style: TextStyle(
                                  color: mainWhite,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onTap: (){
            Get.to(Signup());
          },
          child: Container(
            height: 80,
            color: mainBlack,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xff0B01A0),
                    border: Border.all(
                      color: mainWhite,
                      width: 1,
                    ),
                  ),
                  width: size.width * 0.5,
                  height: double.infinity,
                  child: Center(
                    child: Text(
                      "가맹점 가입",
                      style: TextStyle(
                        color: mainWhite,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Get.to(sToken());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xff0B01A0),
                      border: Border.all(
                        color: mainWhite,
                        width: 1,
                      ),
                    ),
                    width: size.width * 0.5,
                    height: double.infinity,
                    child: Center(
                      child: Text(
                        "S 토큰 주식",
                        style: TextStyle(
                          color: mainWhite,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}
