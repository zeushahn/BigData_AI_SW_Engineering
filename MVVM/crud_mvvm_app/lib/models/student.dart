class Student {
  late String code;
  late String name;
  late String dept;
  late String phone;

  Student(
      {required this.code,
      required this.name,
      required this.dept,
      required this.phone});

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
        code: json['code'],
        name: json['name'],
        dept: json['dept'],
        phone: json['phone']);
  }
}
