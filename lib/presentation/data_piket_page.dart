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

@override
  Widget build(BuildContext context) {
    String formattedDate = '';
    if (selectedDate != null) {
      // Menggunakan DateFormat dari package intl untuk format tanggal
      formattedDate = DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(selectedDate!);
    }

    return Scaffold(
      appBar: AppBar(
    backgroundColor: Colors.red,
    centerTitle: true,
    iconTheme: const IconThemeData(color: Colors.white),
    title: Text(
      'Data Piket',
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  ),
