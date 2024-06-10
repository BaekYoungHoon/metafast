import 'package:flutter/material.dart';
import 'package:metafast/data/color.dart';

class NoticeDetail extends StatelessWidget {
  String title;
  String content;
  NoticeDetail({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBackground,
      appBar: AppBar(
        backgroundColor: mainBackground,
        title: Text(
          title,
          style: TextStyle(color: mainWhite),
        ),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            content,
            style: TextStyle(fontSize: 16, color: mainWhite),
          ),
        ),
      )
    );
  }
}
