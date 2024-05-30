import 'package:flutter/material.dart';
import 'package:profile_student/assignment_screen.dart';
import 'package:profile_student/attendence_screen.dart';
import 'package:profile_student/course.dart';
import 'package:profile_student/event_screen.dart';
import 'package:profile_student/fee_screen.dart';
import 'package:profile_student/result_screen.dart';


class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          child: LayoutBuilder(
            builder: (context, constraints) {
              double circleWidth = constraints.maxWidth * 1;
              double circleHeight = constraints.maxHeight * 1.1;
              double imageWidth = constraints.maxWidth * 0.5;
              double imageHeight = constraints.maxHeight * 0.7;

              return Stack(
                children: [
                  Container(
                    color: Colors.lightBlueAccent, // Adjust the opacity to lighten the color
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
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 38),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'DashBoard',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize:45 ,
                      fontFamily: 'RobotoSlab-VariableFont',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: height * 0.43,
                    child: LayoutBuilder(builder: (context, constraints) {
                      double innerHeight = constraints.maxHeight;
                      double innerWidth = constraints.maxWidth;

                      return Stack(
                        fit: StackFit.expand,
                        children: [
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: height * 0.3,
                              width: innerWidth,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color.fromRGBO(1, 150, 176, 0.67),
                                border: Border.all(
                                  color: Colors.white, // Border color
                                  width: 2.0, // Border thickness
                                ),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: 70),
                                  Text(
                                    'Mahrukh',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontFamily: 'RobotoSlab-VariableFont',
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            'Roll no',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 21,
                                              fontFamily: 'RobotoSlab-VariableFont',
                                            ),
                                          ),
                                          Text(
                                            '13',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 21,
                                              fontFamily: 'RobotoSlab-VariableFont',
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 25, vertical: 8),
                                        child: Container(
                                          height: 40,
                                          width: 5,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(100),
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            'Semester',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 21,
                                              fontFamily: 'RobotoSlab-VariableFont',
                                            ),
                                          ),
                                          Text(
                                            '8th',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 21,
                                              fontFamily: 'RobotoSlab-VariableFont',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Center(
                              child:
                              CircleAvatar(
                                radius: innerWidth * 0.15, // Adjust the radius as needed
                                backgroundImage: AssetImage('assets/images/file.png'),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                  SizedBox(height: 25),
                  Container(
                    height: height * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color.fromRGBO(1, 150, 176, 0.67),
                      border: Border.all(
                        color: Colors.white, // Border color
                        width: 2.0, // Border thickness
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Text(
                            'CollegeLink',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontFamily: 'RobotoSlab-VariableFont',
                            ),
                          ),
                          Divider(thickness: 2.5, color: Colors.white),
                          SizedBox(height: 10),
                          Expanded(
                            child: GridView.count(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              children: [
                                _buildMenuItem(context, 'Assignment', 'assets/icons/assignment.png', () => AssignmentScreen()),
                                _buildMenuItem(context, 'Events', 'assets/icons/event.png', () => events_screen()),
                                _buildMenuItem(context, 'Attendance', 'assets/icons/checking-attendance.png', () => AttendenceScreen()),
                                _buildMenuItem(context, 'Fee', 'assets/icons/fee.png', () => fee_screen()),
                                _buildMenuItem(context, 'Result', 'assets/icons/medical-result.png', () => result_screen()),
                                _buildMenuItem(context, 'Courses', 'assets/icons/courses.png', () => Courses()),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, String iconPath, Widget Function() screen) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => screen()));
      },
      borderRadius: BorderRadius.circular(30),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.lightBlueAccent,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: Colors.white, // Border color
            width: 2.0, // Border thickness
          ),
        ),
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconPath,
              height: 50,
              width: 50,
              color: Colors.white,
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'RobotoSlab-VariableFont',
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
