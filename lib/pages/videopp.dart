import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

// ignore: must_be_immutable
class VideoItems extends StatefulWidget {
  final VideoPlayerController videoPlayerController;

  bool looping;
  bool autoplay;
  /* final bool looping;
  final bool autoplay;*/

  VideoItems({
    required this.videoPlayerController,
    required this.looping,
    required this.autoplay,
    Key? key,
  }) : super(key: key);

  @override
  _VideoItemsState createState() => _VideoItemsState();
}

class _VideoItemsState extends State<VideoItems> {
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      autoInitialize: true,
      showOptions: false,
      aspectRatio: 5 / 3,
      /* autoPlay: widget.autoplay,
      looping: widget.looping,*/
      errorBuilder: (context, errorMessage) {
        return Container(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }
}
