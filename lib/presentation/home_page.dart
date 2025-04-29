import 'package:flutter/material.dart';
import 'package:ucp/presentation/data_pelanggan_page.dart';
import 'package:ucp/presentation/data_piket_page.dart';
import 'package:ucp/presentation/login_page.dart';
import 'package:ucp/presentation/pendataan_barang_page.dart';

class HomePage extends StatelessWidget {
  final String? name;
  final String? email;

  const HomePage({super.key, this.name, this.email});

  @override
  Widget build(BuildContext context) {
    String displayText = name ?? email ?? 'User'; // fallback kalau null

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 255, 0, 0),
        elevation: 0,
        titleSpacing: 0,
        toolbarHeight: 70,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: ClipOval(
                  child: Image.asset('./assets/images/avatar.png'),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Selamat Datang',
                  style: TextStyle(fontSize: 12, color: Colors.white70),
                ),
                Text(
                  displayText,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
  IconButton(
    onPressed: () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    },
    icon: const Icon(Icons.logout, color: Colors.white),
  ),
],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildBannerPromo(),
            const SizedBox(height: 20),
            _buildMenuSection(context, displayText),
            const SizedBox(height: 20),
            _buildBarangSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBannerPromo() {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: AssetImage('./assets/images/diskon.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildMenuSection(BuildContext context, String displayText) {
    return SizedBox(
      height: 180,
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DataPiketPage(name: displayText),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.event_note, size: 45, color: Colors.white),
                    SizedBox(height: 8),
                    Text(
                      'Data Piket',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DataPelangganPage()),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(left: 12),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.contact_page, size: 45, color: Colors.white),
                    SizedBox(height: 8),
                    Text(
                      'Data Pelanggan',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBarangSection(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BarangPage()),
        );
      },
      child: Container(
        height: 220,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.move_to_inbox, size: 50, color: Colors.white),
            SizedBox(height: 8),
            Text(
              'Barang Masuk/Keluar',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}