import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart'; // ADD this for Get.snackbar and Get.offAll
import '../login/login.dart';
import 'reminder_detail.dart';
import 'reminder_model.dart';
import 'reminder_repository.dart';// make sure the correct path to LoginScreen is imported

class ReminderListPage extends StatefulWidget {
  const ReminderListPage({Key? key}) : super(key: key);

  @override
  _ReminderListPageState createState() => _ReminderListPageState();
}

class _ReminderListPageState extends State<ReminderListPage> {
  // ✅ Initialize with an empty Future list to avoid late error
  Future<List<Reminder>> _remindersFuture = Future.value([]);
  final ReminderRepository _repo = ReminderRepository();

  @override
  void initState() {
    super.initState();
    _loadReminders();
  }

  // ✅ NEW VERSION: Check if user is available
  void _loadReminders() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      _remindersFuture = _repo.getRemindersByUser(user.uid);
    } else {
      Get.snackbar("Session Expired", "Please login again.");
      Get.offAll(() => const LoginScreen()); // send back to login
    }
    setState(() {}); // refresh UI
  }

  Future<void> _refresh() async {
    _loadReminders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Reminders'),
        backgroundColor: Colors.deepPurple,
      ),
      body: FutureBuilder<List<Reminder>>(
        future: _remindersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading reminders'));
          }

          final reminders = snapshot.data ?? [];
          if (reminders.isEmpty) {
            return const Center(child: Text('No reminders found'));
          }

          return RefreshIndicator(
            onRefresh: _refresh,
            child: ListView.builder(
              itemCount: reminders.length,
              itemBuilder: (context, index) {
                final r = reminders[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  child: ListTile(
                    title: Text(r.medicineName),
                    subtitle: Text('${r.medicineType} • ${r.dosage}'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ReminderDetailsPage(reminder: r),
                        ),
                      );
                      _refresh();
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.pushNamed(context, '/addReminder');
          _refresh();
        },
      ),
    );
  }
}
