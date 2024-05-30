import 'package:flutter/material.dart';

class Courses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          child: LayoutBuilder(
            builder: (context, constraints) {
              double circleWidth = constraints.maxWidth * 1.5; // Increase circle width
              double circleHeight = constraints.maxHeight * 1.5; // Increase circle height
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
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Column(
            children: [
              SizedBox(height: 30),
              Text(
                'CollegeLink',
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontFamily: 'RobotoSlab-VariableFont',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 35),
              Text(
                'Course Outline',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontFamily: 'RobotoSlab-VariableFont',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 35),
              Text(
                'BS IT',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontFamily: 'RobotoSlab-VariableFont',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        Center(
          child: Container(
            width: 300, // Increase width
            height: 300, // Decrease height for a rectangular shape
            decoration: BoxDecoration(
              color: Color.fromRGBO(1, 150, 176, 0.67),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.white, // Border color
                width: 2.0, // Border thickness
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 10.0,
                  spreadRadius: 1.0,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
