import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ShowVideo extends StatefulWidget {
   @override
  State<ShowVideo> createState() => _ShowVideoState();
}

class _ShowVideoState extends State<ShowVideo> {
  final FlickManager flickManager=
  FlickManager(videoPlayerController:VideoPlayerController.network('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: AspectRatio(
          aspectRatio: 16/9,
          child: FlickVideoPlayer(flickManager:flickManager ,),
        ),
      ),
    );
  }
}
