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
