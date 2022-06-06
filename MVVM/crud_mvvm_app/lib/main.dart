import 'package:crud_mvvm_app/view_models/student_list_view_model.dart';
import 'package:crud_mvvm_app/views/student_list_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRUD',
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => StudentListViewModel(),
        child: const StudentListPage(),
      ),
    );
  }
}
