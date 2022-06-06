import 'package:crud_mvvm_app/services/dbservice.dart';
import 'package:crud_mvvm_app/view_models/student_view_model.dart';
import 'package:flutter/cupertino.dart';

class StudentListViewModel extends ChangeNotifier {
  List<StudentViewModel> students = <StudentViewModel>[];

  Future<void> queryStudents() async {
    final results = await DBService().queryJSONData();
    students = results.map((item) => StudentViewModel(student: item)).toList();
    notifyListeners();
  }
}
