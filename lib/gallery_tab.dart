import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class GalleryTab extends StatelessWidget {
  final List<String> eventPhotos = [
    'assets/Images/Food.jpg',
    'assets/Images/SheikhAbdu.jpg',
    'assets/Images/SheikhEmad.jpg',
    'assets/Images/hoblos.jpg',
    'assets/Images/sultan.jpg',
    'assets/Images/gather.jpg',

    // Add more event photos here
  ];

  final List<String> lectureVideos = [
    'https://www.example.com/video1.mp4',
    'https://www.example.com/video2.mp4',
    'https://www.example.com/video3.mp4',
    // Add more lecture videos here
  ];

   GalleryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Event Photos',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: eventPhotos.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    eventPhotos[index],
                    width: 300,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Lecture Videos',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: lectureVideos.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: VideoPlayer(
                    // ignore: deprecated_member_use
                    VideoPlayerController.network(
                      lectureVideos[index],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}