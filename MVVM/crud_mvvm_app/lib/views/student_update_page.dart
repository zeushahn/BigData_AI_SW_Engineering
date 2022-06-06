import 'package:crud_mvvm_app/services/dbservice.dart';
import 'package:flutter/material.dart';

class StudentUpdate extends StatefulWidget {
  final String rcode;
  final String rname;
  final String rdept;
  final String rphone;

  const StudentUpdate(
      {Key? key,
      required this.rcode,
      required this.rname,
      required this.rdept,
      required this.rphone})
      : super(key: key);

  @override
  _StudentUpdateState createState() => _StudentUpdateState();
}

class _StudentUpdateState extends State<StudentUpdate> {
  TextEditingController codeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController deptController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  late String code;
  late String name;
  late String dept;
  late String phone;
  late String result;

  @override
  void initState() {
    super.initState();
    codeController.text = widget.rcode;
    nameController.text = widget.rname;
    deptController.text = widget.rdept;
    phoneController.text = widget.rphone;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Update for CRUD"),
          backgroundColor: Colors.blue[900],
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
                      decoration: const InputDecoration(labelText: '학번 입니다.'),
                      readOnly: true,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(labelText: '성명을 수정하세요'),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: deptController,
                      decoration: const InputDecoration(labelText: '전공을 수정하세요'),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: phoneController,
                      decoration:
                          const InputDecoration(labelText: '전화번호을 수정하세요'),
                      keyboardType: TextInputType.phone,
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
                    child: const Text('   Update   '),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue[900],
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
              title: const Text("수정 선택"),
              content: const Text("수정을 하시겠습니까 ?"),
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
                        db.updateJSONData(code, name, dept, phone);

                        Navigator.of(context).pop();
                        Navigator.pop(context); // Main화면으로 이동
                      },
                      child: const Text('수정'),
                    ),
                  ],
                ),
              ]);
        });
  }
} // End
