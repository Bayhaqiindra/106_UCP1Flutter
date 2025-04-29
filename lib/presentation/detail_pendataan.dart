import 'package:flutter/material.dart';

class DetailPendataanPage extends StatelessWidget {
  final DateTime tanggal;
  final String jenisTransaksi;
  final String jenisBarang;
  final int jumlahBarang;
  final int hargaSatuan;
  final int totalHarga;

  const DetailPendataanPage({
    Key? key,
    required this.tanggal,
    required this.jenisTransaksi,
    required this.jenisBarang,
    required this.jumlahBarang,
    required this.hargaSatuan,
    required this.totalHarga,
  }) : super(key: key);

    Widget buildDataRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('id_ID', null);

    return Scaffold(
      backgroundColor: const Color(0xFFFEF7F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(height: 40),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green.shade100,
                    ),
                    padding: const EdgeInsets.all(20),
                    child: const Icon(
                      Icons.check_circle,
                      size: 80,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Data Berhasil Disimpan',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 32),
                  ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      buildDataRow(
                        'Tanggal',
                        DateFormat(
                          'EEEE, dd MMMM yyyy',
                          'id_ID',
                        ).format(tanggal),
                      ),
                      const Divider(),
                      buildDataRow('Jenis Transaksi', jenisTransaksi),
                      const Divider(),
                      buildDataRow('Jenis Barang', jenisBarang),
                      const Divider(),
                      buildDataRow('Jumlah Barang', jumlahBarang.toString()),
                      const Divider(),
                      buildDataRow(
                        'Harga Satuan',
                        'Rp. ${hargaSatuan.toString()}',
                      ),
                      const Divider(),
                      buildDataRow(
                        'Total Harga',
                        'Rp. ${totalHarga.toString()}',
                      ),
                    ],
                  ),
                ],
              ),
