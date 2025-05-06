import 'package:cloud_firestore/cloud_firestore.dart';
import 'reminder_model.dart';

class ReminderRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Add a new reminder and store its document ID in Firestore
  Future<void> addReminder(Reminder reminder) async {
    final docRef = _firestore.collection('reminders').doc();
    final newReminder = reminder.copyWith(id: docRef.id);

    await docRef.set(newReminder.toMap());
  }

  /// Get all reminders for the current user
  Future<List<Reminder>> getRemindersByUser(String userId) async {
    final query = await _firestore
        .collection('reminders')
        .where('userId', isEqualTo: userId)
        .get();

    return query.docs.map((doc) {
      final map = doc.data();
      map['id'] = doc.id;
      return Reminder.fromMap(map);
    }).toList();
  }

  /// Update an existing reminder by ID
  Future<void> updateReminder(String id, Reminder updatedReminder) async {
    await _firestore.collection('reminders').doc(id).update(updatedReminder.toMap());
  }

  /// Delete a reminder by ID
  Future<void> deleteReminder(String id) async {
    await _firestore.collection('reminders').doc(id).delete();
  }
}
