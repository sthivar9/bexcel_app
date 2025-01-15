import 'package:bexcel/auth/auth_gate.dart';
import 'package:bexcel/main/note_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: "https://qqcinzfygrihrhcvcjqa.supabase.co",
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFxY2luemZ5Z3JpaHJoY3ZjanFhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzY1ODM3MzUsImV4cCI6MjA1MjE1OTczNX0.q9JSpyq-ajirW--Td0P4_9FhRYFkCbCN7Bw_s0dzAJU");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthGate(),
    );
  }
}
