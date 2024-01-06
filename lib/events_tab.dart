import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String eventName;
  final String eventTime;
  final String eventDescription;

  const EventCard({super.key, 
    required this.eventName,
    required this.eventTime,
    required this.eventDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: BorderSide(
          color: Colors.grey.shade500,
        )
        
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        // Add more padding to make the card look better
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              eventName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(
                  Icons.access_time,
                  size: 16,
                ),
                const SizedBox(width: 3),
                Text(
                  eventTime,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              eventDescription,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
class EventListPage extends StatelessWidget {
  final List<Event> events = [
    Event(
      name: "Community Picnic",
      time: "Saturday, 2:00 PM",
      description: "Join us for a fun-filled picnic at the park!",
    ),
    Event(
      name: "Volunteer Day",
      time: "Sunday, 9:00 AM",
      description: "Help make a difference in our community by volunteering.",
    ),
    // Add more events here
  ];

   EventListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Community Events"),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 23,

        ),
      ),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          return EventCard(
            eventName: event.name,
            eventTime: event.time,
            eventDescription: event.description,
          );
        },
      ),
    );
  }
}

class Event {
  final String name;
  final String time;
  final String description;

  Event({
    required this.name,
    required this.time,
    required this.description,
  });
}