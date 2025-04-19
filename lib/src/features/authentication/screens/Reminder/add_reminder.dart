import 'package:flutter/material.dart';
import 'package:psm_coding_files/src/features/authentication/screens/Reminder/reminder_model.dart';


class AddReminderPage extends StatefulWidget {
  final Function(Reminder) onSave;

  const AddReminderPage({required this.onSave, Key? key}) : super(key: key);

  @override
  _AddReminderPageState createState() => _AddReminderPageState();
}

class _AddReminderPageState extends State<AddReminderPage> {
  final TextEditingController _nameController = TextEditingController();
  String _frequency = 'Every 4 Hours';
  TimeOfDay _time = TimeOfDay.now();

  void _pickTime() async {
    final selectedTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (selectedTime != null) {
      setState(() {
        _time = selectedTime;
      });
    }
  }

  void _saveReminder() {
    if (_nameController.text.isNotEmpty) {
      final reminder = Reminder(
        id: DateTime.now().toString(),
        medicineName: _nameController.text,
        frequency: _frequency,
        time: _time,
      );
      widget.onSave(reminder);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Reminder')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Medicine Name'),
            ),
            const SizedBox(height: 16),
            DropdownButton<String>(
              value: _frequency,
              items: ['Every 4 Hours', 'Every 8 Hours', 'Every 12 Hours']
                  .map((freq) => DropdownMenuItem(value: freq, child: Text(freq)))
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _frequency = value;
                  });
                }
              },
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: _pickTime,
              child: Text('Pick Time: ${_time.format(context)}'),
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: _saveReminder,
              child: const Text('Set Reminder'),
            ),
          ],
        ),
      ),
    );
  }
}
