import 'package:crud_mvvm_app/services/dbservice.dart';
import 'package:flutter/material.dart';

class StudentInsert extends StatefulWidget {
  const StudentInsert({Key? key}) : super(key: key);

  @override
  _StudentInsertState createState() => _StudentInsertState();
}

class _StudentInsertState extends State<StudentInsert> {
  TextEditingController codeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController deptController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  late String code;
  late String name;
  late String dept;
  late String phone;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Insert for CRUD"),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: codeController,
                      decoration: const InputDecoration(labelText: '학번을 입력하세요'),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(labelText: '성명을 입력하세요'),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: deptController,
                      decoration: const InputDecoration(labelText: '전공을 입력하세요'),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: phoneController,
                      decoration:
                          const InputDecoration(labelText: '전화번호을 입력하세요'),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      code = codeController.text.toString();
                      name = nameController.text.toString();
                      dept = deptController.text.toString();
                      phone = phoneController.text.toString();

                      _showDialog(context);
                    },
                    child: const Text('   Insert   '),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text("입력 선택"),
              content: const Text("입력을 하시겠습니까 ?"),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('취소'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      onPressed: () {
                        DBService db = DBService();
                        db.insertJSONData(code, name, dept, phone);

                        Navigator.of(context).pop();
                        Navigator.pop(context); // Main화면으로 이동
                      },
                      child: const Text('입력'),
                    ),
                  ],
                ),
              ]);
        });
  }
} // End
