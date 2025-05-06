import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

import 'reminder_model.dart';
import 'reminder_repository.dart';

class AddReminderPage extends StatefulWidget {
  final Reminder? existingReminder;

  const AddReminderPage({super.key, this.existingReminder});

  @override
  _AddReminderPageState createState() => _AddReminderPageState();
}

class _AddReminderPageState extends State<AddReminderPage> {
  final _formKey = GlobalKey<FormState>();

  final ReminderRepository _reminderRepository = ReminderRepository();

  final TextEditingController _medicineNameController = TextEditingController();
  final TextEditingController _medicineTypeController = TextEditingController();
  final TextEditingController _dosageController = TextEditingController();
  final TextEditingController _timesPerDayController = TextEditingController();

  DateTime? _selectedTime;

  @override
  void initState() {
    super.initState();

    if (widget.existingReminder != null) {
      final r = widget.existingReminder!;
      _medicineNameController.text = r.medicineName;
      _medicineTypeController.text = r.medicineType;
      _dosageController.text = r.dosage;
      _timesPerDayController.text = r.timesPerDay.toString();
      _selectedTime = r.timeToTake;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.existingReminder != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Reminder' : 'Add Reminder'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _medicineNameController,
                  decoration: const InputDecoration(
                    labelText: 'Medicine Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) => value!.isEmpty ? 'Enter medicine name' : null,
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: _medicineTypeController,
                  decoration: const InputDecoration(
                    labelText: 'Medicine Type (Tablet, Syrup, etc.)',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) => value!.isEmpty ? 'Enter medicine type' : null,
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: _dosageController,
                  decoration: const InputDecoration(
                    labelText: 'Dosage (e.g., 500mg)',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) => value!.isEmpty ? 'Enter dosage' : null,
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: _timesPerDayController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Times Per Day',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) => value!.isEmpty ? 'Enter number of times' : null,
                ),
                const SizedBox(height: 15),
                ListTile(
                  title: Text(
                    _selectedTime == null
                        ? 'Select Time'
                        : DateFormat('hh:mm a').format(_selectedTime!),
                    style: const TextStyle(fontSize: 18),
                  ),
                  trailing: const Icon(Icons.access_time),
                  onTap: () async {
                    final TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(_selectedTime ?? DateTime.now()),
                    );
                    if (pickedTime != null) {
                      final now = DateTime.now();
                      setState(() {
                        _selectedTime = DateTime(
                          now.year,
                          now.month,
                          now.day,
                          pickedTime.hour,
                          pickedTime.minute,
                        );
                      });
                    }
                  },
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate() && _selectedTime != null) {
                        final userId = FirebaseAuth.instance.currentUser?.uid;

                        if (userId != null) {
                          final reminder = Reminder(
                            id: widget.existingReminder?.id ?? '',
                            userId: userId,
                            medicineName: _medicineNameController.text.trim(),
                            medicineType: _medicineTypeController.text.trim(),
                            dosage: _dosageController.text.trim(),
                            timeToTake: _selectedTime!,
                            timesPerDay: int.parse(_timesPerDayController.text.trim()),
                          );

                          if (isEditing) {
                            await _reminderRepository.updateReminder(reminder.id, reminder);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Reminder updated successfully!')),
                            );
                          } else {
                            await _reminderRepository.addReminder(reminder);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Reminder added successfully!')),
                            );
                          }

                          Navigator.pop(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('User not found. Please login again.')),
                          );
                        }
                      } else if (_selectedTime == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please select a time')),
                        );
                      }
                    },
                    child: Text(
                      isEditing ? 'Update Reminder' : 'Save Reminder',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
