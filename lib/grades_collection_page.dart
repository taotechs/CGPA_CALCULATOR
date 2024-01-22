// ignore_for_file: library_private_types_in_public_api
import 'package:cgpa/semester_grade_page.dart';
import 'package:flutter/material.dart';

class GradesCollectionPage extends StatefulWidget {
  final int numberOfSemesters;

  const GradesCollectionPage({super.key, required this.numberOfSemesters});

  @override
  _GradesCollectionPageState createState() => _GradesCollectionPageState();
}

class _GradesCollectionPageState extends State<GradesCollectionPage> {
  late List<List<double?>> _grades;
  late List<List<double>> _credits;
  late List<int> _numberOfCourses;

  String getCGPAClassification(double cgpa) {
    if (cgpa >= 4.5) {
      return 'First Class';
    } else if (cgpa >= 3.5) {
      return 'Second Class Upper';
    } else if (cgpa >= 2.5) {
      return 'Second Class Lower';
    } else if (cgpa >= 1.5) {
      return 'Third Class';
    } else if (cgpa >= 1.0) {
      return 'Pass';
    } else {
      return 'Fail';
    }
  }

  Color getColorForClassification(String classification) {
    switch (classification) {
      case 'First Class':
        return Colors.green;
      case 'Second Class Upper':
        return Colors.blue;
      case 'Second Class Lower':
        return Colors.orange;
      case 'Third Class':
        return Colors.yellow;
      case 'Pass':
        return Colors.blueAccent;
      case 'Fail':
        return Colors.red;
      default:
        return Colors.black;
    }
  }

  @override
  void initState() {
    super.initState();
    _grades = List.generate(widget.numberOfSemesters,
        (index) => List<double?>.filled(5, null, growable: false));
    _credits = List.generate(widget.numberOfSemesters,
        (index) => List<double>.filled(5, 0, growable: false));
    _numberOfCourses = List.generate(widget.numberOfSemesters, (index) => 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Grades'),
      ),
      backgroundColor: Color.fromARGB(255, 211, 155, 225),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Enter grades on a 5.0 scale for each semester:'),
            Expanded(
              child: ListView.builder(
                itemCount: widget.numberOfSemesters,
                itemBuilder: (BuildContext context, int index) {
                  return ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SemesterGradesPage(
                            semesterIndex: index,
                            numberOfCourses: _numberOfCourses[index],
                            grades: _grades[index],
                            credits: _credits[index],
                            onNumberOfCoursesChanged: (int newNumberOfCourses) {
                              setState(() {
                                _numberOfCourses[index] = newNumberOfCourses;
                              });
                            },
                            onGradesChanged: (List<double?> newGrades) {
                              setState(() {
                                _grades[index] = newGrades;
                              });
                            },
                            onCreditsChanged: (List<double> newCredits) {
                              setState(() {
                                _credits[index] = newCredits;
                              });
                            },
                          ),
                        ),
                      );
                    },
                    child: Text('Semester ${index + 1}'),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Insert the additional code here
                double totalWeightedSum = 0;
                double totalCredits = 0;

                // Loop through semesters and courses to calculate total weighted sum and credits
                for (int i = 0; i < widget.numberOfSemesters; i++) {
                  for (int j = 0; j < _numberOfCourses[i]; j++) {
                    if (_grades[i][j] != null) {
                      totalWeightedSum += _grades[i][j]! * _credits[i][j];
                      totalCredits += _credits[i][j];
                    }
                  }
                }

                // Calculate total CGPA
                double totalCGPA =
                    totalCredits > 0 ? totalWeightedSum / totalCredits : 0.0;

                // Determine classification and get color
                String classification = getCGPAClassification(totalCGPA);

                // Show dialog
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Total CGPA'),
                      backgroundColor:
                          getColorForClassification(classification),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Your total CGPA is: ${totalCGPA.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text('Classification: $classification',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Calculate Total CGPA'),
            ),
          ],
        ),
      ),
    );
  }
}
