import 'package:flutter/material.dart';
import 'package:flutter_day10_database/pages/signup_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: "https://fdsimkdkqjcwtzslrmyj.supabase.co",
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZkc2lta2RrcWpjd3R6c2xybXlqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQzNTgzOTEsImV4cCI6MjA0OTkzNDM5MX0.-ZyQfVwjhZyxa9HquSpiib89XLwz0H4RdoFlKirlgIU");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SignupPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
