import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:metafast/data/color.dart';
import 'package:video_player/video_player.dart';
import 'package:metafast/data/controller.dart';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:video_player/video_player.dart';

class VideoScreen1 extends StatefulWidget {
  @override
  _VideoListScreenState createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoScreen1> {
  List<Reference> videoRefs = [];
  bool _isLoading = true;
  Map<String, VideoPlayerController> _controllers = {};

  @override
  void initState() {
    super.initState();
    _fetchVideos();
  }

  @override
  void dispose() {
    // 모든 컨트롤러를 dispose합니다.
    _controllers.forEach((key, controller) {
      controller.dispose();
    });
    super.dispose();
  }

  Future<void> _fetchVideos() async {
    try {
      ListResult listResult = await FirebaseStorage.instance.ref(view.text).listAll();
      setState(() {
        videoRefs = listResult.items;
        _isLoading = false;
      });
      // 각 비디오에 대한 VideoPlayerController를 초기화합니다.
      for (Reference ref in videoRefs) {
        String videoURL = await ref.getDownloadURL();
        VideoPlayerController controller = VideoPlayerController.network(videoURL)
          ..initialize().then((_) {
            setState(() {}); // 비디오 초기화가 완료되면 화면을 업데이트합니다.
          });
        _controllers[ref.name] = controller;
      }
    } catch (e) {
      print('Error fetching video list: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print('title : ${title.text}');
    return Scaffold(
      backgroundColor: mainBlack,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: mainWhite,
        ),
        backgroundColor: mainBlack,
        title: Center(
          child: Text(
              title.text,
              style: TextStyle(
                  color: mainWhite
              )
          ),
        ),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: videoRefs.length,
        itemBuilder: (context, index) {
          Reference ref = videoRefs[index];
          VideoPlayerController? controller = _controllers[ref.name];

          return ListTile(
            title: Text(
                ref.name,
                style: TextStyle(
                    color: mainWhite
                ),
            ),
            subtitle: controller != null && controller.value.isInitialized
                ? AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: VideoPlayer(controller),
            )
                : Container(
              height: 200,
              color: Colors.black,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
            onTap: () async {
              String videoURL = await ref.getDownloadURL();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoPlayerScreen(videoURL: videoURL),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  final String videoURL;

  VideoPlayerScreen({required this.videoURL});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoURL)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBlack,
      appBar: AppBar(
        backgroundColor: mainBlack,
        iconTheme: IconThemeData(
          color: mainWhite,
        ),
        title: Text('Video Player'),
      ),
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        )
            : CircularProgressIndicator(),
      ),
    );
  }
}


// class VideoScreen1 extends StatefulWidget {
//   @override
//   _VideoScreenState createState() => _VideoScreenState();
// }
//
// class _VideoScreenState extends State<VideoScreen1> {
//   final storageRef = FirebaseStorage.instance.ref();
//
//   VideoPlayerController? _controller;  // nullable로 변경
//   bool _isLoading = true;
//   int itemCount = 0;
//   List<Reference> videoList = [];
//   @override
//   void initState() {
//     super.initState();
//     _loadVideo();
//   }
//
//   Future<void> _loadVideo() async {
//
//     try {
//       String storageURL = await storageRef.child('picture/picture.mp4').getDownloadURL();
//       ListResult list = await storageRef.child('picture').listAll();
//       videoList = list.items;
//       itemCount = list.items.length;
//       print('리스트 카운트 ${list.items.length}');
//       print('리스트 아이템 ${videoList[0]}');
//       // Firebase Storage에서 동영상 파일의 다운로드 URL 가져오기
//       String videoURL = await FirebaseStorage.instance
//           .ref('picture/picture.mp4')  // gs:// 부분 제거
//           // .child('picture')
//           // .child('187970-881517500_small.mp4')
//           .getDownloadURL();
//       final gsReference =
//       FirebaseStorage.instance.refFromURL("gs://metafast1-50125.appspot.com/picture.mp4");
//
//
//       // 비디오 플레이어 컨트롤러 초기화
//       _controller = VideoPlayerController.network(storageURL)
//         ..initialize().then((_) {
//           setState(() {
//             _isLoading = false;
//             _controller!.play();
//           });
//         });
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//       });
//       print('Error fetching video URL: $e');
//     }
//   }
//
//   @override
//   void dispose() {
//     _controller?.dispose();  // nullable 처리
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         iconTheme: IconThemeData(
//           color: Colors.white,
//         ),
//         backgroundColor: Colors.black,
//         title: Text('사진',
//           style: TextStyle(
//             color: Colors.white,
//           )
//         )
//       ),
//       body: ListView.builder(
//         itemCount: itemCount,
//           itemBuilder: (context, index) {
//             return Container(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                       '날짜',
//                     style: TextStyle(
//                       color: Colors.white,
//                     ),
//                   ),
//                   Container(
//                     color: Colors.white,
//                     width: size.width,
//                     height: 200,
//                     child: _isLoading
//                         ? CircularProgressIndicator()
//                         : _controller != null && _controller!.value.isInitialized
//                         ? AspectRatio(
//                       aspectRatio: _controller!.value.aspectRatio,
//                       child: VideoPlayer(_controller!),
//                     )
//                         : Text('Error loading video'),
//                   ),
//                 ],
//               ),
//             );
//           }
//       ),
//       floatingActionButton: _controller != null && _controller!.value.isInitialized
//           ? FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             _controller!.value.isPlaying
//                 ? _controller!.pause()
//                 : _controller!.play();
//           });
//         },
//         child: Icon(
//           _controller!.value.isPlaying ? Icons.pause : Icons.play_arrow,
//         ),
//       )
//           : null,
//     );
//   }
// }
