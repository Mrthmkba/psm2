import 'package:flutter/material.dart';
import 'package:psm_coding_files/src/features/authentication/screens/Reminder/reminder_detail.dart';
import 'package:psm_coding_files/src/features/authentication/screens/Reminder/reminder_model.dart';

import 'add_reminder.dart';

class ReminderListPage extends StatefulWidget {
  @override
  _ReminderListPageState createState() => _ReminderListPageState();
}

class _ReminderListPageState extends State<ReminderListPage> {
  List<Reminder> reminders = [];

  void addReminder(Reminder reminder) {
    setState(() {
      reminders.add(reminder);
    });
  }

  void deleteReminder(String id) {
    setState(() {
      reminders.removeWhere((reminder) => reminder.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Medicine Reminders')),
      body: reminders.isEmpty
          ? const Center(child: Text('No reminders set.'))
          : ListView.builder(
        itemCount: reminders.length,
        itemBuilder: (context, index) {
          final reminder = reminders[index];
          return ListTile(
            title: Text(reminder.medicineName),
            subtitle: Text('${reminder.frequency} at ${reminder.time.format(context)}'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ReminderDetailPage(
                  reminder: reminder,
                  onDelete: deleteReminder,
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddReminderPage(onSave: addReminder),
          ),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
