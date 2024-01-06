import 'package:flutter/material.dart';

class PrayerDetailPage extends StatelessWidget {
  final String prayer;
  final String time;
  final String details;
  const PrayerDetailPage({super.key, 
    required this.prayer,
    required this.time, 
    required this.details,

  });

  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Prayer Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              prayer,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              time,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Text(
                  prayerDetails[prayer] ?? '',
                 textAlign: TextAlign.center,
                style: const TextStyle(
                 fontSize: 15,
                fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
            // Add more details about the prayer here
          ],
        ),
      ),
    );
  }

  
}

Map<String, String> prayerDetails = {
      'Fajr': fajr(),
      'Dhuhr': duhr(),
      'Asr' : asr(),
      'Maghrib' : maghrib(),
      'Isha' : isha(),
      // Add more prayers and their details here
};


String fajr(){
  String prayerDescription = "Fajr prayer marks the beginning of the day. We wake up at dawn, sacrifice our sleep, and come to Allah seeking His pleasure and guidance. The early morning prayer sets the right tone and energy for us. However, it’s only when we turn our habit of observing Fajr into a spiritual exercise that we begin to see it playing a vital part in blessing our entire day with noor and barakah.";
  return prayerDescription;
}

String duhr(){
  String prayerDetails = 'Zuhr (Dhuhr) prayer is the second prayer that Muslims has to offer in a day its time starts when the sun declines towards the west from the middle of the sky.';
  return prayerDetails;
}

String asr(){
  String prayerDetails = 'After the Zuhr prayer, Muslims perform Asr prayer the third obligatory prayer. It’s time that starts in the afternoon. There is so much importance on offering Asr prayer in hadith Holy Prophet Muhammad (SAW) said: “He who performs Salat (prayers) before the rising of the sun and before its setting, will not enter the Hell.” (Muslim)';
  return prayerDetails;
}

String maghrib(){ 
  String prayerDetails = 'Maghrib prayer is the fourth obligatory prayer its time starts with the sunset. If one does not offer the Maghrib Salah purposely, is supposed to be punished by Allah Almighty.';
  return prayerDetails;

}//Maghrib

String isha(){
  String prayerDetails = 'The last prayer of the day is Isha prayer its time starts when the time of Maghrib prayer ends and remains until midnight. Isha prayer is hard to execute so it also follows with vast rewards from the Almighty Allah. Prophet Muhammad (PBUH) said: “Whoever offers Isha salah in jama’ah it is as though he spent half the night in worship. And whoever offers fajr salah in jama’ah it is as though he spent the entire night in worship.” (Muslim)';
  return prayerDetails;
}

