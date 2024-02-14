import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> _launchUrl(String link) async {
  Uri _url = Uri.parse(link);
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}

const lasuweb = 'https://lasu.edu.ng';
const taoweb = 'https://www.taotechsolutions.com';

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);

  void _showSnackBar(String message, Color color, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 16.0,
      child: FutureBuilder<User?>(
        future: FirebaseAuth.instance.authStateChanges().first,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final user = snapshot.data;

          return ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(user != null ? user.displayName ?? "" : ""),
                accountEmail: Text(user != null ? user.email ?? "" : ""),
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/scholarimg.png"),
                ),
                decoration: const BoxDecoration(color: Colors.purple),
                otherAccountsPictures: const [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/tao.png"),
                  ),
                ],
              ),
              ListTile(
                title: const Text("LASU Website"),
                leading: const Icon(Icons.school_rounded),
                onTap: () {
                  _launchUrl(lasuweb);
                },
              ),
              ListTile(
                title: const Text("Taotech Solutions Website"),
                leading: const Icon(Icons.location_city),
                onTap: () {
                  _launchUrl(taoweb);
                },
              ),
              ListTile(
                title: const Text("Latest Features"),
                leading: const Icon(Icons.run_circle),
                onTap: () {
                  _showSnackBar('Cool Features!', Colors.blue, context);
                },
              ),
              ListTile(
                title: const Text("Login another user"),
                leading: const Icon(Icons.login),
                onTap: () {
                  _showSnackBar('Another Login!', Colors.orange, context);
                  Navigator.pushNamed(context, '/');
                },
              ),
              ListTile(
                title: const Text("Logout"),
                leading: const Icon(Icons.logout),
                onTap: () async {
                  _showSnackBar(
                      'Logged out successfully!', Colors.red, context);
                  await FirebaseAuth.instance.signOut();
                  // ignore: use_build_context_synchronously
                  Navigator.pushNamed(context, '/');
                },
              ),
              ListTile(
                title: const Text("Register another user"),
                leading: const Icon(Icons.person_add),
                onTap: () {
                  _showSnackBar('Register Now!', Colors.purpleAccent, context);
                  Navigator.pushNamed(context, '/register');
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
