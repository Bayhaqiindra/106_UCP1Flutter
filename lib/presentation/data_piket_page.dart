import 'package:flutter/material.dart';

class DataPiketPage extends StatefulWidget {
  final String? name;

  const DataPiketPage({super.key, this.name});

  @override
  State<DataPiketPage> createState() => _DataPiketPageState();
}

class _DataPiketPageState extends State<DataPiketPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController taskController = TextEditingController();
  DateTime? selectedDate;
  List<Map<String, String>> taskList = [];

  String? taskError;
  String? dateError;

@override
  void initState() {
    super.initState();
    nameController.text = widget.name ?? 'User'; // Isi otomatis nama anggota
  }

  void _validateInputs() {
    setState(() {
      taskError =
          taskController.text.isEmpty ? 'Tugas tidak boleh kosong' : null;
      dateError = selectedDate == null ? 'Tanggal harus dipilih' : null;
    });
  }
