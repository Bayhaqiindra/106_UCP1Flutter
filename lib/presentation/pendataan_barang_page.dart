import 'package:flutter/material.dart';

class BarangPage extends StatefulWidget {
  const BarangPage({Key? key}) : super(key: key);

  @override
  State<BarangPage> createState() => _BarangPageState();
}

class _BarangPageState extends State<BarangPage> {
  final _formKey = GlobalKey<FormState>();

  DateTime? selectedDate;
  String? jenisTransaksi;
  String? jenisBarang;
  final jumlahBarangController = TextEditingController();
  final hargaSatuanController = TextEditingController();
  final Map<String, int> hargaBarang = {
    'Carrier': 1500000,
    'Sleeping Bag': 500000,
    'Tenda': 2500000,
    'Sepatu': 1000000,
  };

  InputDecoration buildInputDecoration(
  String hintText, {
  Widget? prefixIcon,
  Widget? prefix,
  String? prefixText,
}) {
  return InputDecoration(
    hintText: hintText,
    prefixIcon: prefixIcon,
    prefix: prefix,
    prefixText: prefixText,
    prefixStyle: const TextStyle(color: Colors.black),
    hintStyle: const TextStyle(color: Colors.black54),
    filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(color: Colors.black26),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(color: Colors.black26),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(color: Colors.black54),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(color: Colors.red),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(color: Colors.red),
    ),
  );
}

Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF7F5),
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Pendataan Barang',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              const Text(
                'Tanggal Transaksi',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextFormField(
                readOnly: true,
                decoration: buildInputDecoration(
                  'Tanggal Transaksi',
                  prefixIcon: const Icon(Icons.calendar_today),
                ),
                controller: TextEditingController(
                  text:
                      selectedDate != null
                          ? DateFormat(
                            'EEEE, dd MMMM yyyy',
                            'id_ID',
                          ).format(selectedDate!)
                          : '',
                ),
                onTap: _selectDate,
                validator: (value) {
                  if (selectedDate == null) {
                    return 'Tanggal wajib diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              DropdownButtonFormField<String>(
                value: jenisTransaksi,
                items: const [
                  DropdownMenuItem(
                    value: 'Barang Masuk',
                    child: Text('Barang Masuk'),
                  ),
                  DropdownMenuItem(
                    value: 'Barang Keluar',
                    child: Text('Barang Keluar'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    jenisTransaksi = value;
                  });
                },
                decoration: buildInputDecoration('Jenis Transaksi'),
                validator:
                    (value) => value == null ? 'Pilih jenis transaksi' : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: jenisBarang,
                items: const [
                  DropdownMenuItem(value: 'Carrier', child: Text('Carrier')),
                  DropdownMenuItem(
                    value: 'Sleeping Bag',
                    child: Text('Sleeping Bag'),
                  ),
                  DropdownMenuItem(value: 'Tenda', child: Text('Tenda')),
                  DropdownMenuItem(value: 'Sepatu', child: Text('Sepatu')),
                ],
                onChanged: (value) {
                  setState(() {
                    jenisBarang = value;
                    hargaSatuanController.text = hargaBarang[value].toString();
                  });
                },
                decoration: buildInputDecoration('Jenis Barang'),
                validator:
                    (value) => value == null ? 'Pilih jenis barang' : null,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Jumlah Barang',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: jumlahBarangController,
                          keyboardType: TextInputType.number,
                          decoration: buildInputDecoration('Jumlah Barang'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Jumlah barang wajib diisi';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Harga Satuan',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: hargaSatuanController,
                          keyboardType: TextInputType.number,
                          readOnly: true,
                          decoration: buildInputDecoration(
                            'Harga Satuan',
                            prefixText: 'Rp. ',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Harga satuan wajib diisi';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
