import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  VideoPlayerController? _controller;  // nullable로 변경
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadVideo();
  }

  Future<void> _loadVideo() async {
    try {
      // Firebase Storage에서 동영상 파일의 다운로드 URL 가져오기
      String videoURL = await FirebaseStorage.instance
          .ref('가맹점영상/38388-418005845_small.mp4')  // gs:// 부분 제거
          .getDownloadURL();

      // 비디오 플레이어 컨트롤러 초기화
      _controller = VideoPlayerController.network(videoURL)
        ..initialize().then((_) {
          setState(() {
            _isLoading = false;
            _controller!.play();
          });
        });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print('Error fetching video URL: $e');
    }
  }

  @override
  void dispose() {
    _controller?.dispose();  // nullable 처리
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Storage Video'),
      ),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : _controller != null && _controller!.value.isInitialized
            ? AspectRatio(
          aspectRatio: _controller!.value.aspectRatio,
          child: VideoPlayer(_controller!),
        )
            : Text('Error loading video'),
      ),
      floatingActionButton: _controller != null && _controller!.value.isInitialized
          ? FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller!.value.isPlaying
                ? _controller!.pause()
                : _controller!.play();
          });
        },
        child: Icon(
          _controller!.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      )
          : null,
    );
  }
}
