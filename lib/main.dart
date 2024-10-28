import 'package:flutter/material.dart';
import 'package:mobileapps/Ui/produk_page.dart';
// import 'columnn_widget.dart';
// import 'Ui/produk_form.dart';
import 'Ui/dashboard.dart' as dashboard;
import 'Ui/insert.dart';
import 'Ui/login.dart';
import 'Ui/update.dart';

List<Map<String, String>> salesData = [];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplikasi Manajemen",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sistem Manajemen',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 27.0,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 193, 232, 218),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 27),
          Center(
            child: Wrap(
              spacing: 20.0,
              runSpacing: 20.0,
              children: [
                // Dashboard Card
                HomeButton(
                    icon: Icons.dashboard,
                    label: 'Dashboard',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => dashboard.DashboardPage()),
                      );
                    }),
                // Produk Page Card
                HomeButton(
                    icon: Icons.production_quantity_limits,
                    label: 'Produk List',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProdukPage()),
                      );
                    }),
                // Create Card
                HomeButton(
                  icon: Icons.add,
                  label: 'Add',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddPage()),
                    );
                  },
                ),
                // Update Card
                HomeButton(
                  icon: Icons.update,
                  label: 'Update',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UpdatePage()),
                    );
                  },
                ),
                // Logout Card
                HomeButton(
                  icon: Icons.logout,
                  label: 'Logout',
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
          Center(
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  child: const Text(
                    'Nama : Muhammad Wildan Khalilurrahman\nNPM : 714220009',
                    style: TextStyle(fontSize: 16),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

// Custom widget untuk HomeButtons
class HomeButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function() onTap;

  const HomeButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50),
            SizedBox(height: 10),
            Text(label, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
