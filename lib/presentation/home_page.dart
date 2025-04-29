import 'package:flutter/material.dart';

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
