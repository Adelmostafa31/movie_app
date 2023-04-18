import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class watch_screen_in_movie_details extends StatefulWidget {
  watch_screen_in_movie_details({Key? key, required this.url, }) : super(key: key,);
  final String url;
  @override
  State<watch_screen_in_movie_details> createState() =>
      _watch_screen_in_movie_detailsState(url);
}

class _watch_screen_in_movie_detailsState extends State<watch_screen_in_movie_details> {

  // https://youtu.be/bg95VC6EtuY
  late YoutubePlayerController controller;
  final String url;

  _watch_screen_in_movie_detailsState(this.url);
  @override
  void initState() {
    final vedioUrl = "${url}";
    // final vedioId = YoutubePlayer.convertUrlToId(vedioUrl);
    controller = YoutubePlayerController(
      initialVideoId: vedioUrl,
      flags: const YoutubePlayerFlags(
          autoPlay: false, showLiveFullscreenButton: true, isLive: true),
    );
    super.initState();
  }

  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: height*0.82,
            child: YoutubePlayerBuilder(
              player: YoutubePlayer(
                controller: controller,
                showVideoProgressIndicator: true,
                onReady: () => debugPrint('Ready'),
                bottomActions: [
                  CurrentPosition(
                    controller: controller,
                  ),
                  ProgressBar(
                    controller: controller,
                    colors: const ProgressBarColors(
                      playedColor: Colors.blue,
                      handleColor: Colors.grey,
                    ),
                  ),
                ],
                aspectRatio: 16 / 9,
                liveUIColor: Colors.red,
                progressColors: const ProgressBarColors(
                    playedColor: Colors.red, backgroundColor: Colors.red),
              ),
              onEnterFullScreen: () {
                // ignore: avoid_print
                return print('object');
              },
              builder: (context, player) => YoutubePlayer(
                controller: controller,
              ),
            ),
          )
        ],
      ),
    );
  }
}
