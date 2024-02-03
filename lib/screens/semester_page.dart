// ignore_for_file: library_private_types_in_public_api

import 'package:cgpa/screens/grades_collection_page.dart';
import 'package:flutter/material.dart';

class SemesterPage extends StatefulWidget {
  const SemesterPage({super.key});

  @override
  _SemesterPageState createState() => _SemesterPageState();
}

class _SemesterPageState extends State<SemesterPage> {
  int _numberOfSemesters = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 212, 168, 202),
      appBar: AppBar(
        title: const Text('Number of Semesters'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Enter the number of semesters:'),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _numberOfSemesters = int.tryParse(value) ?? 0;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GradesCollectionPage(
                      numberOfSemesters: _numberOfSemesters,
                    ),
                  ),
                );
              },
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
