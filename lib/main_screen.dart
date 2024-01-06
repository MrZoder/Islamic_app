import 'package:intl/intl.dart';
import 'package:adhan/adhan.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:prayer_app/gallery_tab.dart';
import 'prayer_times_tab.dart';
import 'events_tab.dart';

class PrayerTimesPage extends StatelessWidget {
   
    Location location = Location();
    LocationData?  _currentPosition;
    double? latitude, longitude;

  PrayerTimesPage({super.key});

    Future<Map<String, String>> fetchPrayerTimes() async {    
      

    final myCoordinates = Coordinates(-34.280,148.280);
    final params = CalculationMethod.muslim_world_league.getParameters();
    params.madhab = Madhab.shafi;
    final prayerTimes = PrayerTimes.today(myCoordinates, params);

    String fajrTime = DateFormat.jm().format(prayerTimes.fajr);
    String dhuhrTime = DateFormat.jm().format(prayerTimes.dhuhr);
    String asrTime = DateFormat.jm().format(prayerTimes.asr);
    String maghribTime = DateFormat.jm().format(prayerTimes.maghrib);
    String ishaTime = DateFormat.jm().format(prayerTimes.isha);

    return {
      'Fajr': fajrTime,
      'Dhuhr': dhuhrTime,
      'Asr': asrTime,
      'Maghrib': maghribTime,
      'Isha': ishaTime,
    };
  }

  

  final List<String> events = [
    'Arts and crafts 11th of January',
    'Event 2',
    'Event 3',
  ];


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 6, 82, 51), // Islamic color theme
          title: const Text('Young Mosque'),
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            ),
          bottom: const TabBar(
            indicatorColor: Color.fromARGB(255, 85, 255, 144),
            labelColor: Color.fromARGB(255, 109, 203, 62),
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(
                text: 'Prayer Times', 
                icon: Icon(Icons.timelapse)
             ),
              
              Tab(
                text: 'Events',
                icon: Icon(Icons.event)
              ),

              Tab(
                text: 'Gallery',
                icon: Icon(Icons.photo_library_outlined),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FutureBuilder<Map<String, String>>(
              future: fetchPrayerTimes(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  Map<String, String> Prayer = snapshot.data!;
                  return PrayerTimesTab(prayers: Prayer);
                }
              },
            ),
             EventListPage(),
             GalleryTab(),
          ],
        ),
        
      ),
    );
    
  }

  getLoc() async{
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _currentPosition = await location.getLocation();
    latitude = _currentPosition!.latitude;
    longitude = _currentPosition!.longitude;

    
  }
  

}