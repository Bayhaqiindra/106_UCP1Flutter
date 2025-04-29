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
