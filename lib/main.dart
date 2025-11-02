import 'package:flutter/material.dart';
import 'package:paytm_app/core/routes/app_routes.dart';

void main() {
  runApp(const patymCloneApp());
}

class patymCloneApp extends StatelessWidget {
  const patymCloneApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Paytm Clone',
      routes: getRoutes(),
    );
  }
}
