import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ElderProfileScreen extends StatelessWidget {
  const ElderProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Elder Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _profileHeader(),
            const SizedBox(height: 20),
            _infoSection(),
            const SizedBox(height: 20),
            _medicalSection(),
            const SizedBox(height: 20),
            _contactsSection(),
          ],
        ),
      ),
    );
  }

  Widget _profileHeader() {
    return Column(
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('assets/images/elder.jpg'), // Replace with network image
        ),
        const SizedBox(height: 10),
        const Text('Mr. Ramachandran', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const Text('Age: 72 | Blood Group: B+'),
      ],
    );
  }

  Widget _infoSection() {
    return Card(
      elevation: 2,
      child: ListTile(
        title: const Text('Address'),
        subtitle: const Text('Manjeri, Malappuram, Kerala\nPIN: 676121'),
        trailing: IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {
            // TODO: Add edit function
          },
        ),
      ),
    );
  }

  Widget _medicalSection() {
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          ListTile(
            title: Text('Health Conditions'),
            subtitle: Text('• Hypertension\n• Mild Dementia\n• BP under control'),
          ),
          Divider(),
          ListTile(
            title: Text('Allergies'),
            subtitle: Text('None reported'),
          ),
          Divider(),
          ListTile(
            title: Text('Medications'),
            subtitle: Text('• Amlodipine 5mg\n• Donepezil 10mg (night)'),
          ),
        ],
      ),
    );
  }

  Widget _contactsSection() {
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          ListTile(
            title: Text('Emergency Contact'),
            subtitle: Text('Mr. Shajahan (Neighbor)\nPhone: +91 98470 12345'),
          ),
          Divider(),
          ListTile(
            title: Text('Volunteer Preferences'),
            subtitle: Text('Prefer male volunteer\nTime: 10am – 1pm preferred'),
          ),
        ],
      ),
    );
  }
}
