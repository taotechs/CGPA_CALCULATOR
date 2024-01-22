import 'package:flutter/material.dart';

class SemesterGradesPage extends StatefulWidget {
  final int semesterIndex;
  final int numberOfCourses;
  final List<double?> grades;
  final List<double> credits;
  final ValueChanged<int> onNumberOfCoursesChanged;
  final ValueChanged<List<double?>> onGradesChanged;
  final ValueChanged<List<double>> onCreditsChanged;

  const SemesterGradesPage({
    required this.semesterIndex,
    required this.numberOfCourses,
    required this.grades,
    required this.credits,
    required this.onNumberOfCoursesChanged,
    required this.onGradesChanged,
    required this.onCreditsChanged,
  });

  @override
  _SemesterGradesPageState createState() => _SemesterGradesPageState();
}

class _SemesterGradesPageState extends State<SemesterGradesPage> {
  late List<FocusNode> _focusNodes;
  late TextEditingController _numberOfCoursesController;

  @override
  void initState() {
    super.initState();
    _focusNodes = List.generate(widget.numberOfCourses, (index) => FocusNode());
    _numberOfCoursesController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Grades - Semester ${widget.semesterIndex + 1}'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Enter the number of courses:'),
              const SizedBox(height: 10),
              TextField(
                controller: _numberOfCoursesController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Number of Courses',
                ),
                onChanged: (value) {
                  int newNumberOfCourses = int.tryParse(value) ?? 0;
                  widget.onNumberOfCoursesChanged(newNumberOfCourses);
                  // Set focus on the first grade TextField
                  if (_focusNodes.isNotEmpty) {
                    FocusScope.of(context).requestFocus(_focusNodes[0]);
                  }
                  // Rebuild the widget to show grade input fields
                  setState(() {});
                },
                onEditingComplete: () {
                  int newNumberOfCourses =
                      int.tryParse(_numberOfCoursesController.text) ??
                          widget.numberOfCourses;
                  widget.onNumberOfCoursesChanged(newNumberOfCourses);
                  // Set focus on the first grade TextField
                  if (_focusNodes.isNotEmpty) {
                    FocusScope.of(context).requestFocus(_focusNodes[0]);
                  }
                  // Rebuild the widget to show grade input fields
                  setState(() {});
                },
              ),
              const SizedBox(height: 20),
              const Text('Enter grades on a 5.0 scale for each course:'),
              // Conditionally show the grade input fields based on the number of courses
              if (widget.numberOfCourses > 0)
                for (int i = 0; i < widget.numberOfCourses; i++)
                  Row(
                    children: [
                      Text('Course ${i + 1}:'),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          focusNode: _focusNodes[i],
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: 'Grade',
                          ),
                          onChanged: (value) {
                            List<double?> newGrades = List.from(widget.grades);
                            newGrades[i] = double.tryParse(value) ?? 0.0;
                            widget.onGradesChanged(newGrades);
                          },
                          onEditingComplete: () {
                            // Set focus on the next grade TextField
                            if (i + 1 < _focusNodes.length) {
                              FocusScope.of(context)
                                  .requestFocus(_focusNodes[i + 1]);
                            }
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: 'Credits',
                          ),
                          onChanged: (value) {
                            List<double> newCredits = List.from(widget.credits);
                            newCredits[i] = double.tryParse(value) ?? 0.0;
                            widget.onCreditsChanged(newCredits);
                          },
                        ),
                      ),
                    ],
                  ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Save Grades for Semester ${widget.semesterIndex + 1}',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _numberOfCoursesController.dispose();
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }
}
