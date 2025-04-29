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
