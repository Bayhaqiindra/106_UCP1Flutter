import 'package:flutter/material.dart';

class DetailPelangganPage extends StatelessWidget {
  final String nama;
  final String email;
  final String hp;
  final String alamat;
  final String provinsi;
  final String kodePos;

  const DetailPelangganPage({
    Key? key,
    required this.nama,
    required this.email,
    required this.hp,
    required this.alamat,
    required this.provinsi,
    required this.kodePos,
  }) : super(key: key);