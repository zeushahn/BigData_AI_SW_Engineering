import 'package:crud_mvvm_app/services/dbservice.dart';
import 'package:flutter/material.dart';

class StudentDelete extends StatefulWidget {
  final String rcode;
  final String rname;
  final String rdept;
  final String rphone;

  const StudentDelete(
      {Key? key,
      required this.rcode,
      required this.rname,
      required this.rdept,
      required this.rphone})
      : super(key: key);

  @override
  _StudentDeleteState createState() => _StudentDeleteState();
}

class _StudentDeleteState extends State<StudentDelete> {
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
          title: const Text("Delete for CRUD"),
          backgroundColor: Colors.red,
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
                      decoration: const InputDecoration(labelText: '성명 입니다.'),
                      readOnly: true,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: deptController,
                      decoration: const InputDecoration(labelText: '전공 입니다.'),
                      readOnly: true,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: phoneController,
                      decoration: const InputDecoration(labelText: '전화번호 입니다.'),
                      readOnly: true,
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      code = codeController.text.toString();
                      _showDialog(context);
                    },
                    child: const Text('   Delete   '),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
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
              title: const Text("삭제 선택"),
              content: const Text("삭제를 하시겠습니까 ?"),
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
                        db.deleteJSONData(code);

                        Navigator.of(context).pop();
                        Navigator.pop(context); // Main화면으로 이동
                      },
                      child: const Text('삭제'),
                    ),
                  ],
                ),
              ]);
        });
  }
} // End


