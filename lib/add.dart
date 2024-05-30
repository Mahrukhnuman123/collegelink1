import 'package:flutter/material.dart';
import 'package:profile_student/attendence_screen.dart';

class AddStudentPage extends StatefulWidget {
  @override
  State<AddStudentPage> createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController rollNumberController = TextEditingController();

  var selectedSem = 'Sem';
  var selectedDep = 'Dep';
  var optionsSem = ['1', '2', '3', '4', '5', '6', '7', '8'];
  var optionsDep = ['BS IT', 'BS Eng', 'BS Math'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            child: LayoutBuilder(
              builder: (context, constraints) {
                double circleWidth = constraints.maxWidth * 1;
                double circleHeight = constraints.maxHeight * 1.1;

                return Stack(
                  children: [
                    Container(
                      color: Colors.lightBlueAccent,
                    ),
                    Positioned(
                      top: constraints.maxHeight * 0.17,
                      right: -constraints.maxWidth * 0.05,
                      child: Container(
                        width: 192,
                        height: 202,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFF3365B0).withOpacity(0.67),
                        ),
                      ),
                    ),
                    Positioned(
                      top: -circleHeight * 0.4,
                      left: -circleWidth * 0.3,
                      child: Container(
                        width: circleWidth,
                        height: circleHeight,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFF3365B0).withOpacity(0.67),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Text(
                    'Add a Student',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'RobotoSlab-VariableFont',
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(1, 150, 176, 0.67),
                            border: Border.all(
                              color: Colors.white,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white,
                                blurRadius: 10.0,
                                spreadRadius: 1.0,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  controller: nameController,
                                  decoration: InputDecoration(
                                    hintText: 'Name',
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.all(8),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 30),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  controller: rollNumberController,
                                  decoration: InputDecoration(
                                    hintText: 'Roll Number',
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.all(8),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Dep: ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'RobotoSlab-VariableFont',
                                    ),
                                  ),
                                  Flexible(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: DropdownButton<String>(
                                        isExpanded: true,
                                        dropdownColor: Colors.blue[100],
                                        items: optionsDep.map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (newValue) {
                                          setState(() {
                                            selectedDep = newValue!;
                                          });
                                        },
                                        value: selectedDep == 'Dep' ? null : selectedDep,
                                        hint: Text(
                                          'Dep',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Text(
                                    'Sem: ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'RobotoSlab-VariableFont',
                                    ),
                                  ),
                                  Flexible(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: DropdownButton<String>(
                                        isExpanded: true,
                                        dropdownColor: Colors.blue[100],
                                        items: optionsSem.map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (newValue) {
                                          setState(() {
                                            selectedSem = newValue!;
                                          });
                                        },
                                        value: selectedSem == 'Sem' ? null : selectedSem,
                                        hint: Text(
                                          'Sem',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              MaterialButton(
                                color: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AttendenceScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'ADD',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'RobotoSlab-VariableFont',
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
