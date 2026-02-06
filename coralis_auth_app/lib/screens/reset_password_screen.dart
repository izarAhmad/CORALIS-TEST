import 'package:flutter/material.dart';
import '../services/api_service.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String token;

  const ResetPasswordScreen({required this.token});

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final password = TextEditingController();

  void reset() async {
    final res = await ApiService.resetPassword(widget.token, password.text);

    if (res['message'] != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password berhasil diubah')),
      );
      Navigator.popUntil(context, (route) => route.isFirst);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal reset password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reset Password")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Text("Token: ${widget.token}"),
            TextField(controller: password, decoration: InputDecoration(labelText: 'Password Baru'), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(onPressed: reset, child: Text("Reset Password")),
          ],
        ),
      ),
    );
  }
}
