import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../constants/app_constant.dart';

class VideoShow extends StatefulWidget {
  final String pickedVideoPath;

  const VideoShow({
    super.key,
    required this.pickedVideoPath,
  });

  @override
  State<VideoShow> createState() => _VideoShowState();
}

class _VideoShowState extends State<VideoShow> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    logger.i(" video player video path network ${widget.pickedVideoPath}");
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4}"))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          color: Colors.black,
          child: AspectRatio(
            aspectRatio: _controller!.value.aspectRatio,
            child: Stack(
              children: [
                VideoPlayer(_controller!),
                Center(
                  child: IconButton(
                      splashRadius: 25,
                      icon: CircleAvatar(
                        backgroundColor: Colors.black.withOpacity(0.3),
                        child: Icon(
                          _controller!.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow_rounded,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        if (_controller!.value.isPlaying) {
                          _controller!.pause();
                        } else {
                          _controller!.play();
                        }
                        setState(() {});
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
