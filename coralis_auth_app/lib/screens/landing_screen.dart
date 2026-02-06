import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'register_screen.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.blueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo-coralis.webp', height: 70),
            SizedBox(height: 20),
            Text(
              "Coralis Flutter App",
              style: TextStyle(fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Authentication Demo",
              style: TextStyle(color: Colors.white70),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
              },
              child: Text("Login"),
            ),
            SizedBox(height: 10),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                side: BorderSide(color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => RegisterScreen()));
              },
              child: Text("Register", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
