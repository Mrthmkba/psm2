import 'package:flutter/material.dart';
import 'package:psm_coding_files/src/features/authentication/screens/reminder_repo/reminder_model.dart';
import 'package:intl/intl.dart';
import 'add_reminder.dart';
import 'reminder_repository.dart'; // Make sure to import your ReminderRepository

class ReminderDetailsPage extends StatelessWidget {
  final Reminder reminder;

  const ReminderDetailsPage({super.key, required this.reminder});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reminder Details'),
        backgroundColor: Colors.deepPurple,
        actions: [
          // Edit button
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Navigate to AddReminderPage with the existing reminder for editing
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddReminderPage(existingReminder: reminder),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Medicine Name: ${reminder.medicineName}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Type: ${reminder.medicineType}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Dosage: ${reminder.dosage}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Times Per Day: ${reminder.timesPerDay}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text(
              'Time to Take: ${DateFormat('hh:mm a').format(reminder.timeToTake)}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final confirm = await showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('Delete Reminder'),
              content: const Text('Are you sure you want to delete this reminder?'),
              actions: [
                TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
                TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('Delete')),
              ],
            ),
          );

          if (confirm == true) {
            await ReminderRepository().deleteReminder(reminder.id);
            Navigator.pop(context); // Go back to the previous page
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Reminder deleted')),
            );
          }
        },
        label: const Text('Delete'),
        icon: const Icon(Icons.delete),
        backgroundColor: Colors.red,
      ),
    );
  }
}
