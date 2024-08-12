import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_service.dart';
import 'attendance_service.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isCheckedIn = false; // Untuk melacak status check-in

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final attendanceService = Provider.of<AttendanceService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await authService.signInWithEmailAndPassword(
                  _emailController.text,
                  _passwordController.text,
                );

                // Setelah login, lakukan check-in otomatis
                await attendanceService.checkIn();
                setState(() {
                  _isCheckedIn = true;
                });
              },
              child: const Text('Login and Check-in'),
            ),
            if (_isCheckedIn)
              ElevatedButton(
                onPressed: () async {
                  await attendanceService.checkOut();
                  setState(() {
                    _isCheckedIn = false;
                  });
                },
                child: const Text('Check-out'),
              ),
            TextButton(
              onPressed: () async {
                await authService.createUserWithEmailAndPassword(
                  _emailController.text,
                  _passwordController.text,
                );
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
