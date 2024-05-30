import 'package:flutter/material.dart';
import 'package:profile_student/add.dart';

class AttendenceScreen extends StatelessWidget {
  const AttendenceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: Text(
          'Attendance App',
          style: TextStyle(
            fontSize: 35,
            color: Colors.white,
            fontFamily: 'RobotoSlab-VariableFont',
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: MaterialButton(
                color: Colors.lightBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                onPressed: () {
                  // Ensure you have another screen like AttendanceDetailsScreen to navigate to.
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AttendanceDetailsScreen(),
                    ),
                  );
                },
                child: Text(
                  'Attendance',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: 'RobotoSlab-VariableFont',
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: MaterialButton(
                color: Colors.lightBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddStudentPage(),
                    ),
                  );
                },
                child: Text(
                  'ADD',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'RobotoSlab-VariableFont',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.blue[300],
    );
  }
}

// AttendanceDetailsScreen updated to be a stateful widget
class AttendanceDetailsScreen extends StatefulWidget {
  @override
  State<AttendanceDetailsScreen> createState() => _AttendanceDetailsScreenState();
}

class _AttendanceDetailsScreenState extends State<AttendanceDetailsScreen> {
  var ww = 'semdep';
  var optionsSem = ['1', '2', '3', '4', '5', '6', '7', '8'];
  var _currentItemSelectedSem = '1'; // Initial value set to first option
  var optionsDep = ['BS IT', 'BS Eng', 'BS Math'];
  var _currentItemSelectedDep = 'BS IT'; // Initial value set to first option
  List<String> present = [];
  List<String> absent = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[100],
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => AssignmentPage(
                  present: present,
                  absent: absent,
                  clas: ww,
                ),
              ),
            );
          },
          child: Icon(
            Icons.send,
          ),
        ),
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Attendance Page',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'RobotoSlab-VariableFont',
                ),
              ),
              SizedBox(width: 15),
              Flexible( // Wrap DropdownButton in Flexible
                child: DropdownButton<String>(
                  dropdownColor: Colors.blue[900],
                  isDense: true,
                  isExpanded: true, // Set isExpanded to true
                  iconEnabledColor: Colors.lightBlueAccent,
                  focusColor: Colors.lightBlueAccent,
                  items: optionsSem.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(
                        dropDownStringItem,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'RobotoSlab-VariableFont',
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (newValueSelected) {
                    setState(() {
                      _currentItemSelectedSem = newValueSelected!;
                      ww = _currentItemSelectedSem + _currentItemSelectedDep;
                    });
                    print(ww);
                  },
                  value: _currentItemSelectedSem,
                ),
              ),
              SizedBox(width: 10),
              Flexible( // Wrap DropdownButton in Flexible
                child: DropdownButton<String>(
                  dropdownColor: Colors.blue[900],
                  isDense: true,
                  isExpanded: true, // Set isExpanded to true
                  iconEnabledColor: Colors.lightBlueAccent,
                  focusColor: Colors.lightBlueAccent,
                  items: optionsDep.map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(
                        dropDownStringItem,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'RobotoSlab-VariableFont',
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (newValueSelected1) {
                    setState(() {
                      _currentItemSelectedDep = newValueSelected1!;
                      ww = _currentItemSelectedSem + _currentItemSelectedDep;
                    });
                    print(ww);
                  },
                  value: _currentItemSelectedDep,
                ),
              ),
              SizedBox(width: 25),
            ],
          ),
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (_, index) {
            List<String> studentNames = [
              'Mahrukh', 'Attika', 'Ezza', 'Hadia', 'Anum',
              'Ayesha', 'Saba', 'Zaineb', 'Sehar', 'Noor'
            ];
            String name = studentNames[index];
            return InkWell(
              onTap: () {
                setState(() {
                  if (present.contains(name)) {
                    present.remove(name);
                    absent.add(name);
                  } else if (absent.contains(name)) {
                    absent.remove(name);
                    present.add(name);
                  } else {
                    present.add(name);
                  }
                });
                print("Present: $present");
                print("Absent: $absent");
              },
              child: Card(
                child: ListTile(
                  title: Text(name),
                  trailing: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      color: present.contains(name)
                          ? Color.fromARGB(255, 0, 228, 8)
                          : absent.contains(name)
                          ? Color.fromARGB(255, 248, 20, 4)
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        present.contains(name)
                            ? 'Present'
                            : absent.contains(name)
                            ? 'Absent'
                            : 'Mark',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'RobotoSlab-VariableFont',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class AssignmentPage extends StatelessWidget {
  final List<String> present;
  final List<String> absent;
  final String clas;

  const AssignmentPage({required this.present, required this.absent, required this.clas, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppBar(
            title: Text(
              'Attendance Page',
              style: TextStyle(
                fontSize: 36,
                color: Colors.white,
                fontFamily: 'RobotoSlab-VariableFont',
              ),
            ),
            backgroundColor: Colors.lightBlueAccent, // Setting app bar background color
            elevation: 0, // Removing app bar elevation
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color.fromRGBO(1, 150, 176, 0.67),
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'Class: $clas',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'RobotoSlab-VariableFont',
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color.fromRGBO(1, 150, 176, 0.67),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView(
                children: [
                  Text(
                    'Present:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                      fontFamily: 'RobotoSlab-VariableFont',
                    ),
                  ),
                  ...present.map((student) => ListTile(
                    title: Text(
                      student,
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  SizedBox(height: 10),
                  Text(
                    'Absent:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                      fontFamily: 'RobotoSlab-VariableFont',
                    ),
                  ),
                  ...absent.map((student) => ListTile(
                    title: Text(
                      student,
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
