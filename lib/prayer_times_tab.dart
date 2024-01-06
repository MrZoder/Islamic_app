import 'package:flutter/material.dart';
import 'prayer_details.dart';

String upcomingPrayer(Map<String, String> prayers) {
  DateTime now = DateTime.now();
  String currentTime = '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';

  for (String prayerName in prayers.keys) {
    String prayerTime = prayers[prayerName]!;
    if (currentTime.compareTo(prayerTime) < 0) {
      return prayerName;
    }
  }

  // If no upcoming prayer is found, return an empty string
  return '';
}

class PrayerTimesTab extends StatelessWidget {
  final Map<String, String> prayers;

 const PrayerTimesTab({Key? key, required this.prayers}) : super(key: key);


  @override
  Widget build(BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.all(10),
        color: const Color.fromARGB(255, 11, 104, 107),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            "Upcoming Prayer:  ${upcomingPrayer(prayers)}",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
        const SizedBox(height: 20),
       ListView.builder(
         shrinkWrap: true,
         itemCount: prayers.length,
         itemBuilder: (context, index) {
           String prayer = prayers.keys.toList()[index];
           String time = prayers.values.toList()[index];
           String details = prayerDetails[prayer] ?? '';

           return Card(
             elevation: 3,
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(10),
             ),
             margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
             child: ListTile(
               title: Text( 
                 prayer,
                 style: const TextStyle(
                   fontWeight: FontWeight.bold,
                   fontSize: 16,
                 ),
               ),
               subtitle: Text(
                 time,
                 style: const TextStyle(
                   fontSize: 14,
                 ),
               ),
               trailing: const Icon(
                 Icons.arrow_forward_ios,
                 size: 18,
               ),
               onTap: () {
                    Navigator.push(
                         context,
                        MaterialPageRoute(
                        builder: (context) => PrayerDetailPage(
                        prayer: prayer,
                        time: time,
                        details: details,
                     ),
                   ),
                  );
                 // Handle item tap
               },
             ),
           );
         },
       )
      ],
    ),
  );
}

  

}
