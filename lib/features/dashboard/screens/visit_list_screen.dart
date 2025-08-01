import 'package:flutter/material.dart';

class VisitListScreen extends StatelessWidget {
  const VisitListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Fake data for now
    final List<Map<String, String>> upcoming = [
      {
        'date': 'Aug 4',
        'time': '10:00 AM',
        'task': 'Blood Pressure Check',
        'volunteer': 'Shanavas K.'
      },
      {
        'date': 'Aug 6',
        'time': '2:00 PM',
        'task': 'Doctor Accompaniment',
        'volunteer': 'Anjali M.'
      },
    ];

    final List<Map<String, String>> completed = [
      {
        'date': 'Aug 2',
        'time': '11:30 AM',
        'task': 'Medicine Delivery',
        'volunteer': 'Nikhil S.',
        'status': 'Completed'
      },
      {
        'date': 'Jul 30',
        'time': '9:00 AM',
        'task': 'Companionship Visit',
        'volunteer': 'Sneha P.',
        'status': 'Checked-in'
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Visit History')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Upcoming Visits', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          ...upcoming.map(_buildUpcomingCard).toList(),
          const SizedBox(height: 30),
          const Text('Completed Visits', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          ...completed.map(_buildCompletedCard).toList(),
        ],
      ),
    );
  }

  Widget _buildUpcomingCard(Map<String, String> visit) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.schedule),
        title: Text('${visit['task']}'),
        subtitle: Text('${visit['date']} • ${visit['time']}\nVolunteer: ${visit['volunteer']}'),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // TODO: Visit details screen
        },
      ),
    );
  }

  Widget _buildCompletedCard(Map<String, String> visit) {
    return Card(
      color: Colors.green[50],
      child: ListTile(
        leading: const Icon(Icons.check_circle, color: Colors.green),
        title: Text('${visit['task']}'),
        subtitle: Text('${visit['date']} • ${visit['time']}\nVolunteer: ${visit['volunteer']}'),
        trailing: Text('${visit['status']}', style: const TextStyle(color: Colors.green)),
        onTap: () {
          // TODO: Visit details or report
        },
      ),
    );
  }
}
