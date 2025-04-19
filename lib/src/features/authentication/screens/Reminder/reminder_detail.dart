import 'package:flutter/material.dart';
import 'package:psm_coding_files/src/features/authentication/screens/Reminder/reminder_model.dart';

class ReminderDetailPage extends StatelessWidget {
  final Reminder reminder;
  final Function(String) onDelete;

  const ReminderDetailPage({
    required this.reminder,
    required this.onDelete,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reminder Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Medicine: ${reminder.medicineName}', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text('Frequency: ${reminder.frequency}', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text('Time: ${reminder.time.format(context)}', style: const TextStyle(fontSize: 16)),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    onDelete(reminder.id);
                    Navigator.pop(context);
                  },
                  child: const Text('Delete'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
