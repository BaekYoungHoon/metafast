import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metafast/data/color.dart';
import 'package:metafast/data/setdata.dart';

class Signup extends StatelessWidget {
  List<TextEditingController> controllers = [TextEditingController(), TextEditingController(), TextEditingController(), TextEditingController(), TextEditingController(), TextEditingController(), TextEditingController(), TextEditingController(), TextEditingController()];
  Widget row(String title, TextEditingController controller, double width){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
            title,
          style: TextStyle(
            color: mainWhite,
            fontSize: 15,
            fontWeight: FontWeight.w700
          ),
        ),
        SizedBox(width: 20,),
        Container(
          height: 29,
          width: width,
          decoration: BoxDecoration(
            color: mainWhite,
            border: Border.all(color: mainWhite),
            borderRadius: BorderRadius.circular(4)
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
            )
          ),
        )
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: mainBackground,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: mainWhite,
        ),
        backgroundColor: mainBackground,
        title: Center(
            child: Text(
                '가맹점 가입',
              style: TextStyle(
                color: mainWhite,
                fontSize: 20
              )
            )
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xff0B01A0),
            ),
            height: 30,
            width: 50,
            child: TextButton(
              onPressed: () {
                if(controllers[0].text == '' || controllers[1].text == '' || controllers[2].text == '' || controllers[3].text == ''){
                  Get.snackbar('입력 오류', '모든 항목을 입력해주세요');
                  return;
                }
                else{
                  SetSign set = SetSign(name: controllers[0].text, id: controllers[1].text, staking: controllers[2].text, question: controllers[3].text, recommender: controllers[4].text, recommenderId: controllers[5].text, center: controllers[6].text);
                  set.setSign();
                  for(int i = 0; i < controllers.length; i++){
                    controllers[i].clear();
                  }
                }

              },
              child: Text(
                  '등록',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              row('성명', controllers[0], size.width*0.6),
              SizedBox(height: 20,),
              row('아이디', controllers[1], size.width*0.6),
              SizedBox(height: 20,),
              row('스테이킹', controllers[2], size.width*0.6),
              SizedBox(height: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '문의사항',
                    style: TextStyle(
                        color: mainWhite,
                        fontSize: 15,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: size.width,
                    height: 200,
                    decoration: BoxDecoration(
                        color: mainWhite,
                        border: Border.all(color: mainWhite),
                        borderRadius: BorderRadius.circular(4)
                    ),
                    child: SingleChildScrollView(
                      child: TextField(
                        maxLines: 10,
                        controller: controllers[3],
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ]
          )
        ),
      ),
      bottomNavigationBar: Container(
        color: mainBlue,
        height: 100,
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        '추천인 : ',
                        style: TextStyle(
                          color: mainWhite
                        ),
                      ),
                      Container(
                        width: size.width*0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          // color: Color(0xff3b32c7),
                        ),
                        child: TextField(
                          controller: controllers[4],
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'ex)홍길동',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.normal,
                                fontSize: 13
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                          '아이디 : ',
                        style: TextStyle(
                          color: mainWhite
                        ),
                      ),
                      Container(
                        width: size.width*0.2,
                        child: TextField(
                          controller: controllers[5],
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'ex)hong123',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.normal,
                                fontSize: 13
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '센터명 : ',
                    style: TextStyle(
                      color: mainWhite,
                    ),
                  ),
                  Container(
                    width: size.width*0.6,
                    child: TextField(
                      controller: controllers[6],
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '센터명을 입력해주세요',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                          fontSize: 13
                        )
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  
  
}
