import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:lilac_infotech/pages/videopp.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController _controller;
  final String _fileUrl =
      "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4";
  bool downloading = false;
  var progressString = "";

  Future<void> downloadFile() async {
    Dio dio = Dio();

    try {
      var dir = await getApplicationDocumentsDirectory();
      await dio.download(_fileUrl, "${dir.path}/video.mp4",
          onReceiveProgress: (rec, total) {
        print("Rec: $rec , Total: $total");
        setState(() {
          downloading = true;
          progressString = ((rec / total) * 100).toStringAsFixed(0) + "%";
        });
      });
    } catch (e) {
      print('oopopopopopopopo');
      print(e);
    }

    print('Download Completed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(children: [
        Container(
          height: 250,
          child: Stack(
            children: [
              VideoItems(
                videoPlayerController: VideoPlayerController.network(
                    'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4'),
                looping: true,
                autoplay: true,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                  height: 53,
                  width: 55,
                  margin: EdgeInsets.only(top: 15, left: 15),
                  child: Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 53,
                    width: 55,
                    margin: EdgeInsets.only(top: 15, right: 15),
                    child: Icon(
                      Icons.supervised_user_circle,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        // ignore: deprecated_member_use
        Row(
          children: [
            Container(
                margin: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(5)),
                child: IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.chevron_left_sharp,
                      size: 30,
                    ))),
            Container(
              padding: EdgeInsets.only(left: 90),
              // ignore: deprecated_member_use
              child: RaisedButton(
                  color: Colors.blue,
                  child: Text(
                    "Download",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  onPressed: () {}),
            ),
            Padding(
              padding: EdgeInsets.only(left: 90),
              child: Container(
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5)),
                  child: IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.chevron_right_sharp,
                        size: 30,
                      ))),
            ),
          ],
        ),
      ]),
    ));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
