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
    nameController.text = widget.name ?? 'User'; 
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
  body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Nama Anggota',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: nameController,
              readOnly: true, 
              decoration: InputDecoration(
                hintText: 'Nama Anggota',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              ),
            ),
            const SizedBox(height: 16),

            // Tanggal Picker
            const Text(
              'Pilih Tanggal',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (date != null) {
                  setState(() {
                    selectedDate = date;
                    dateError =
                        null; 
                  });
                }
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(
                    color:
                        dateError != null
                            ? Colors.red
                            : Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      selectedDate != null ? formattedDate : 'Pilih Tanggal',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            if (dateError != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  dateError!,
                  style: const TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),

            const SizedBox(height: 24),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tugas Piket',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 8),

                // Input dan Tombol
                Row(
                  children: [
                    // TextField
                    Expanded(
                      flex: 5,
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(0, 255, 255, 255),
                          border: Border.all(
                            color: taskError != null ? Colors.red : Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextFormField(
                          controller: taskController,
                          decoration: const InputDecoration(
                            hintText: 'Masukkan Tugas',
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            border: InputBorder.none,
                          ),
                          onChanged: (_) {
                            if (taskError != null) {
                              setState(() {
                                taskError = null;
                              });
                            }
                          },
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),
