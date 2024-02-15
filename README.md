# CGPA Calculator App

## Overview

The CGPA Calculator app is a powerful tool designed to help students calculate their Cumulative Grade Point Average (CGPA) based on grades and credits earned in multiple semesters. The app offers a user-friendly interface for entering academic information and provides a seamless experience for calculating and tracking CGPA.
## App Homepage Screenshot
![CGPA Calculator App](https://github.com/taotechs/CGPA_CALCULATOR/blob/main/download.png)

## App Components

### 1. Programming Language and Framework

The CGPA Calculator app is developed using the Flutter framework, a versatile UI toolkit by Google. Flutter enables the creation of natively compiled applications for mobile, web, and desktop platforms from a single codebase. The programming language utilized is Dart, a language optimized for building diverse applications.

### 2. Main Entry Point (main.dart)

The `main.dart` file serves as the entry point for the app. It introduces the `MyApp` widget, a `StatelessWidget` responsible for creating the app's structure. The `MyApp` widget sets the app's theme and initializes the `HomePage`.

### 3. Home Page (HomePage)

The `HomePage` widget represents the initial screen of the app. It features a welcoming message and a button that navigates users to the `SemesterPage` for entering the number of semesters.

### 4. Semester Page (SemesterPage)

The `SemesterPage` widget is a `StatefulWidget` that enables users to input the number of semesters they want to calculate the CGPA for. It includes a `TextField` for entering the number of semesters and a button to proceed to the `GradesCollectionPage`.

### 5. Grades Collection Page (GradesCollectionPage)

The `GradesCollectionPage` widget is a `StatefulWidget` responsible for collecting grade information for each semester. Users can navigate to individual `SemesterGradesPage` instances to input grades, and there's an option to calculate the total CGPA.

### 6. Semester Grades Page (SemesterGradesPage)

The `SemesterGradesPage` widget represents the page for entering grades and credits for each course within a semester. It dynamically generates input fields based on the user-entered number of courses.

## App Workflow

1. **Home Page:**
   - Welcome message and start button.
   - Navigate to `SemesterPage` on button press.

2. **Semester Page:**
   - Enter the number of semesters.
   - Navigate to `GradesCollectionPage` on button press.

3. **Grades Collection Page:**
   - Enter grades and credits for each semester.
   - Navigate to individual `SemesterGradesPage` for detailed input.
   - Calculate total CGPA for all semesters.

4. **Semester Grades Page:**
   - Enter the number of courses, grades, and credits.
   - Save entered grades for each semester.

5. **Total CGPA Calculation:**
   - Calculate total CGPA based on entered grades and credits.
   - Display CGPA classification and total CGPA in an alert dialog.

## Usage Instructions

1. **Welcome Screen:**
   - Open the app to see a welcome message.

2. **Number of Semesters:**
   - Click the "Start Calculating" button on the home page.
   - Enter the number of semesters on the `SemesterPage`.

3. **Enter Grades:**
   - Click "Next" on the `SemesterPage`.
   - Enter grades and credits for each semester on the `GradesCollectionPage`.

4. **Detailed Grade Entry:**
   - Click on a semester on the `GradesCollectionPage` to enter detailed grades for each course on the `SemesterGradesPage`.
   - Save grades for each semester.

5. **Calculate Total CGPA:**
   - On the `GradesCollectionPage`, click "Calculate Total CGPA" to see an alert with the total CGPA and classification.

## Conclusion

The CGPA Calculator app provides a streamlined and user-friendly interface for students to calculate their cumulative GPA across multiple semesters. Leveraging the Flutter framework and Dart programming language, the app delivers a cross-platform mobile application with a responsive and intuitive design. Developers can easily extend functionalities and make enhancements using the modular structure of the app.
