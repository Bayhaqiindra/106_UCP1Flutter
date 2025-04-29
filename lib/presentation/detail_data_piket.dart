import 'package:flutter/material.dart';

class TaskDetailPage extends StatelessWidget {
  final String taskTitle;
  final String taskDate; // contoh "29/4/2025"
  final String userName;

  const TaskDetailPage({
    super.key,
    required this.taskTitle,
    required this.taskDate,
    required this.userName,
  });

@override
  Widget build(BuildContext context) {
    initializeDateFormatting('id_ID', null);

    DateTime parsedDate = DateFormat('d/M/yyyy').parse(taskDate);
    String formattedDate = DateFormat(
      'EEEE, dd MMMM yyyy',
      'id_ID',
    ).format(parsedDate);

return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Detail $taskTitle',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
