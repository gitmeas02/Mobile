import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Music extends StatefulWidget {
  final Map<String, dynamic> book;
  const Music({Key? key, required this.book}) : super(key: key);

  @override
  State<Music> createState() => _MusicState();
}

class _MusicState extends State<Music> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration currentPosition = Duration.zero;
  Duration totalDuration = Duration.zero;

  @override
  void initState() {
    super.initState();

    _audioPlayer.onDurationChanged.listen((Duration d) {
      setState(() {
        totalDuration = d;
      });
    });

    _audioPlayer.onPositionChanged.listen((Duration p) {
      setState(() {
        currentPosition = p;
      });
    });

    _audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        isPlaying = false;
        currentPosition = Duration.zero;
      });
    });
  }

  void _playPause() async {
    if (isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(UrlSource(widget.book['audio']));
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  void _seekToSeconds(int seconds) {
    Duration newDuration = Duration(seconds: seconds);
    _audioPlayer.seek(newDuration);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Top background
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 300,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    widget.book['img'],
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.book['title'],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.book['text'],
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Player controls
          Positioned(
            top: 320,
            left: 20,
            right: 20,
            child: Column(
              children: [
                Slider(
                  min: 0,
                  max: totalDuration.inSeconds.toDouble(),
                  value: currentPosition.inSeconds.toDouble().clamp(0, totalDuration.inSeconds.toDouble()),
                  onChanged: (value) {
                    _seekToSeconds(value.toInt());
                  },
                  activeColor: Colors.blue,
                  inactiveColor: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_formatDuration(currentPosition)),
                      Text(_formatDuration(totalDuration)),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        int newSeconds = currentPosition.inSeconds - 10;
                        if (newSeconds < 0) newSeconds = 0;
                        _seekToSeconds(newSeconds);
                      },
                      icon: Icon(Icons.replay_10),
                      iconSize: 36,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 20),
                    IconButton(
                      onPressed: _playPause,
                      icon: Icon(
                        isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill,
                      ),
                      iconSize: 64,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 20),
                    IconButton(
                      onPressed: () {
                        int newSeconds = currentPosition.inSeconds + 10;
                        if (newSeconds > totalDuration.inSeconds) newSeconds = totalDuration.inSeconds;
                        _seekToSeconds(newSeconds);
                      },
                      icon: Icon(Icons.forward_10),
                      iconSize: 36,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
