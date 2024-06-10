import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:metafast/data/color.dart';
import 'package:metafast/view/noticedetail.dart';

class Notice extends StatelessWidget {

  Future<List<List<String>>> getNoticeList() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final dbget = await db.collection("notice").orderBy('date', descending: true);
    QuerySnapshot snapshot = await dbget.get();

    if (snapshot.docs.isNotEmpty) {
      List<List<String>> tempList = [];
      for (QueryDocumentSnapshot doc in snapshot.docs) {
        String title = doc.get("title");
        String content = doc.get("body");
        String date = doc.get('date').toDate().toString().substring(0, 10);
        tempList.add([title, content, date]);
      }
      return tempList;
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBackground,
      appBar: AppBar(
        backgroundColor: mainBackground,
        title: Text(
            '공지사항',
          style: TextStyle(color: mainWhite)
        ),
      ),
      body: FutureBuilder<List<List<String>>>(
        future: getNoticeList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('공지사항이 없습니다.'));
          } else {
            List<List<String>> noticeList = snapshot.data!;
            return ListView.builder(
              itemCount: noticeList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: (){
                    NoticeDetail n = NoticeDetail(title: noticeList[index][0], content: noticeList[index][1]);
                    Get.to(n);
                  },
                  title: Text(
                      noticeList[index][0],
                    style: TextStyle(fontWeight: FontWeight.bold, color: mainWhite)
                  ),
                  subtitle: Text(noticeList[index][2],
                  style: TextStyle(
                    color: mainWhite
                  ),),
                );
              },
            );
          }
        },
      ),
    );
  }
}
