import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  final String title;

  // Constructor includes an optional title to make the page slightly more contextual
  const SuccessPage({super.key, this.title = "Service"});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color(0xFF0D47A1), // Use primary blue for app bar
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 80,
            ),
            SizedBox(height: 20),
            Text(
              'Successfully Loaded!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Navigation Successful.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}