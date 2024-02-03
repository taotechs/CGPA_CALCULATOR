// ignore_for_file: library_private_types_in_public_api
import 'dart:js';

import 'package:cgpa/screens/taotech.dart';
import 'package:cgpa/taotech/main.dart';
import 'package:flutter/material.dart';
import 'screens/semester_page.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://www.taotechsolutions.com');
void main() {
  runApp(const MyApp());
}

Future<void> _launchTaotechWeb() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CGPA Calculator',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const HomePage(),
    );
  }
}

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 212, 168, 202),
      appBar: AppBar(
        title: const Text(
          'CGPA Calculator',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        centerTitle: true,
        actions: const [
          Icon(Icons.school),
          Icon(Icons.calculate),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.purple),
              child: Text("Menu"),
            ),
            ListTile(
              title: const Text("LASU Website"),
              leading: const Icon(Icons.home),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Taotech Solutions Website"),
              leading: const Icon(Icons.home),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const MyWidget(),),);
                
              },
            ),
            ListTile(
              title: const Text("LASU Website"),
              leading: const Icon(Icons.home),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    child: Image.asset("assets/images/lasutao.png")),
                const Text(
                  'Welcome to CGPA Calculator',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SemesterPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple, // background
                    foregroundColor: Colors.white, // foreground
                  ),
                  child: const Text(
                    'Start Calculating',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
