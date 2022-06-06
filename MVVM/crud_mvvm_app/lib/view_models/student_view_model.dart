import 'package:crud_mvvm_app/models/student.dart';

class StudentViewModel {
  late Student student;

  StudentViewModel({required this.student});

  String get code {
    return student.code;
  }

  String get name {
    return student.name;
  }

  String get dept {
    return student.dept;
  }

  String get phone {
    return student.phone;
  }
}
