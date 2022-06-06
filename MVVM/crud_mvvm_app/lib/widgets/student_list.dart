import 'package:crud_mvvm_app/view_models/student_view_model.dart';
import 'package:crud_mvvm_app/views/student_delete_page.dart';
import 'package:crud_mvvm_app/views/student_update_page.dart';
import 'package:flutter/material.dart';

class StudentList extends StatelessWidget {
  final List<StudentViewModel> students;
  const StudentList({Key? key, required this.students}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: students.isEmpty
          ? const Text(
              '데이터가 없습니다.',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                final student = students[index];
                return GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                    child: Card(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Text(
                                  "Code :",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(student.code),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Text(
                                  "Name :",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(student.name),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Text(
                                  "Dept :",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(student.dept),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Text(
                                  "Phone :",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(student.phone),
                              ],
                            ),
                          ),
                        ],
                      ),
                      color:
                          index % 2 == 0 ? Colors.amber[50] : Colors.amber[200],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return StudentUpdate(
                        rcode: student.code,
                        rname: student.name,
                        rdept: student.dept,
                        rphone: student.phone,
                      );
                    }));
                  },
                  onLongPress: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return StudentDelete(
                        rcode: student.code,
                        rname: student.name,
                        rdept: student.dept,
                        rphone: student.phone,
                      );
                    }));
                  },
                );
              },
              itemCount: students.length,
            ),
    );
  }
}
