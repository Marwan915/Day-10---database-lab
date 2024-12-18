import 'package:flutter_day10_database/model/student.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Database {
  final supabase = Supabase.instance.client;
  Future<List<Student>> getData() async {
    var response = await supabase.from("student").select();

    List<Student> studentList = [];
    for (var element in response) {
      studentList.add(Student.fromJson(element));
    }
    print(studentList);
    return studentList;
  }

  // for insert student data

  insertNewStudent({
    required String name,
    required int age,
    required double salary,
  }) async {
    await supabase.from("student").insert({
      "name": name,
      "age": age,
      "salary": salary,
    });
  }

//====================================================================================\\
  //                             for auth table

  signup({required String email, required String password}) async {
    await supabase.auth.signUp(password: password, email: email);
  }

  login({required String email, required String password}) async {
    await supabase.auth.signInWithPassword(password: password, email: email);
  }
}
