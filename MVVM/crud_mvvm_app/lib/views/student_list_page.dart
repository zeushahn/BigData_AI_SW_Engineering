import 'package:crud_mvvm_app/view_models/student_list_view_model.dart';
import 'package:crud_mvvm_app/views/student_insert_page.dart';
import 'package:crud_mvvm_app/widgets/student_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentListPage extends StatefulWidget {
  const StudentListPage({Key? key}) : super(key: key);

  @override
  _StudentListPageState createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage> {
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<StudentListViewModel>(context);
    vm.queryStudents();

    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD for Students'),
        backgroundColor: Colors.red[200],
        actions: [
          IconButton(
            icon: const Icon(Icons.add_outlined),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const StudentInsert();
              }));
            },
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: StudentList(
              students: vm.students,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.red[50],
    );
  }
}
