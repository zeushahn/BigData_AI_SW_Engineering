import 'dart:async';
import 'dart:convert';

import 'package:crud_mvvm_app/models/student.dart';
import 'package:http/http.dart' as http;

class DBService {
  // Query
  Future<List<Student>> queryJSONData() async {
    var url =
        Uri.parse('http://localhost:8080/Flutter/student_query_flutter.jsp');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(utf8.decode(response.bodyBytes));
      final Iterable json = body['results'];
      return json.map((student) => Student.fromJson(student)).toList();
    } else {
      throw Exception("Unable to perform request!");
    }
  }

  // Insert
  insertJSONData(String code, String name, String dept, String phone) async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/student_insert_return_flutter.jsp?code=$code&name=$name&dept=$dept&phone=$phone');
    await http.get(url);
  }

  // Delete
  deleteJSONData(String code) async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/student_delete_return_flutter.jsp?code=$code');
    await http.get(url);
  }

  // Update
  updateJSONData(String code, String name, String dept, String phone) async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/student_update_return_flutter.jsp?code=$code&name=$name&dept=$dept&phone=$phone');
    await http.get(url);
  }
} // End
