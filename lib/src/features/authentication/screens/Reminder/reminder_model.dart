import 'package:flutter/material.dart';

class Reminder {
  final String id;
  final String medicineName;
  final String frequency;
  final TimeOfDay time;

  Reminder({
    required this.id,
    required this.medicineName,
    required this.frequency,
    required this.time,
  });

  /// Convert Reminder to Map for database storage
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'medicineName': medicineName,
      'frequency': frequency,
      'time': '${time.hour}:${time.minute}', // Convert TimeOfDay to a string
    };
  }

  /// Create Reminder from Map (retrieved from database)
  factory Reminder.fromMap(Map<String, dynamic> map) {
    final timeParts = map['time'].split(':');
    final time = TimeOfDay(
      hour: int.parse(timeParts[0]),
      minute: int.parse(timeParts[1]),
    );

    return Reminder(
      id: map['id'],
      medicineName: map['medicineName'],
      frequency: map['frequency'],
      time: time,
    );
  }
}

