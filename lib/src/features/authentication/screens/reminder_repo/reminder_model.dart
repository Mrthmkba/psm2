class Reminder {
  final String id;
  final String userId;
  final String medicineName;
  final String medicineType;
  final String dosage;
  final DateTime timeToTake;
  final int timesPerDay;

  Reminder({
    required this.id,
    required this.userId,
    required this.medicineName,
    required this.medicineType,
    required this.dosage,
    required this.timeToTake,
    required this.timesPerDay,
  });

  /// Convert the Reminder object to a Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'medicineName': medicineName,
      'medicineType': medicineType,
      'dosage': dosage,
      'timeToTake': timeToTake.toIso8601String(),
      'timesPerDay': timesPerDay,
    };
  }

  /// Create a Reminder object from a Map (from Firestore)
  factory Reminder.fromMap(Map<String, dynamic> map) {
    return Reminder(
      id: map['id'] ?? '', // Extract from Firestore document
      userId: map['userId'],
      medicineName: map['medicineName'],
      medicineType: map['medicineType'],
      dosage: map['dosage'],
      timeToTake: DateTime.parse(map['timeToTake']),
      timesPerDay: map['timesPerDay'],
    );
  }

  /// A convenient method to copy an existing Reminder with updated fields
  Reminder copyWith({
    String? id,
    String? userId,
    String? medicineName,
    String? medicineType,
    String? dosage,
    DateTime? timeToTake,
    int? timesPerDay,
  }) {
    return Reminder(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      medicineName: medicineName ?? this.medicineName,
      medicineType: medicineType ?? this.medicineType,
      dosage: dosage ?? this.dosage,
      timeToTake: timeToTake ?? this.timeToTake,
      timesPerDay: timesPerDay ?? this.timesPerDay,
    );
  }
}
