import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../constants/assets_constants.dart';

class CustomVideoPlayer extends StatefulWidget {
  const CustomVideoPlayer({
    Key? key,  this.videoLink = 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
  }) : super(key: key);
  final String videoLink;

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late VideoPlayerController _controller;
  Widget? controls;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      widget.videoLink,
    )
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      })
      ..addListener(() {
        if (_controller.value.isPlaying) {
          controls = GestureDetector(
            onTap: () {
              setState(() {
                _controller.pause();
              });
            },
            child: Image.asset(
              icPause,
              height: 50,
            ),
          );
        } else if (_controller.value.position.inMilliseconds -
            _controller.value.duration.inMilliseconds <
            1) {
          setState(() {
            controls = GestureDetector(
              onTap: () {
                setState(() {
                  _controller.play();
                });
              },
              child: Image.asset(
                icLearning,
                height: 50,
              ),
            );
          });
        } else {
          controls = GestureDetector(
            onTap: () {
              setState(() {
                _controller.play();
              });
            },
            child: Image.asset(
              icLearning,
              height: 50,
            ),
          );
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: Stack(
          children: [
            VideoPlayer(
              _controller,
            ),
            Positioned.fill(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [controls ?? Container()],
              ),
            )
          ],
        ),
      ),
    );
  }
}