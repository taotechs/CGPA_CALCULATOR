// ignore_for_file: library_private_types_in_public_api
import 'package:cgpa/screens/drawerpage.dart';
import 'package:cgpa/screens/register_page.dart';
import 'package:cgpa/screens/resetpasswordscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'screens/login_page.dart';
import 'screens/semester_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  runApp(MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CGPA Calculator',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/register': (context) => RegisterPage(),
        '/semester': (context) => const SemesterPage(),
        '/resetpassword': (context) => ResetPasswordScreen(),
      },
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
          'CGPA Calcuator',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        centerTitle: true,
        actions: const [
          Icon(Icons.school),
          SizedBox(width: 10),
          Icon(Icons.calculate),
        ],
      ),
      drawer: const DrawerPage(),
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Image.asset("assets/images/lasutao.png"),
                ),
                const SizedBox(height: 10),
                Text(
                  'Welcome ${FirebaseAuth.instance.currentUser != null ? FirebaseAuth.instance.currentUser!.displayName ?? "" : ""}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(height: 10),
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
