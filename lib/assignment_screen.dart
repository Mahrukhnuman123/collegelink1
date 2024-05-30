import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AssignmentScreen extends StatefulWidget {
  const AssignmentScreen({super.key});

  @override
  _AssignmentScreenState createState() => _AssignmentScreenState();
}

class _AssignmentScreenState extends State<AssignmentScreen> {
  List<String> _filePaths = [];

  @override
  void initState() {
    super.initState();
    _loadFiles();
  }

  Future<void> _loadFiles() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _filePaths = prefs.getStringList('filePaths') ?? [];
    });
  }

  Future<void> _saveFiles() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('filePaths', _filePaths);
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _filePaths.add(result.files.single.path!);
        _saveFiles();
      });
    } else {
      // User canceled the picker
    }
  }

  Future<void> _openFile(String filePath) async {
    await OpenFile.open(filePath);
  }

  Future<void> _removeFile(int index) async {
    setState(() {
      _filePaths.removeAt(index);
      _saveFiles();
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
        fit: StackFit.expand,
        children: [
          Container(
            color: Colors.lightBlueAccent,
            child: LayoutBuilder(
              builder: (context, constraints) {
                double circleWidth = constraints.maxWidth * 1;
                double circleHeight = constraints.maxHeight * 1.1;
                return Stack(
                  children: [
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
            body: Container(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double circleWidth = constraints.maxWidth * 1;
                  double circleHeight = constraints.maxHeight * 1.1;

                  return Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.lightBlueAccent, Colors.blueAccent],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
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
                      Positioned(
                        top: 50.0,
                        left: 16.0,
                        right: 16.0,
                        child: Center(
                          child: Text(
                            'Assignments',
                            style: TextStyle(
                              fontSize: 35,
                              fontFamily: 'RobotoSlab-VariableFont',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 100.0,
                        left: 16.0,
                        right: 16.0,
                        bottom: 100.0, // Leave space for the upload button container
                        child: Column(
                          children: [
                            Expanded(
                              child: _filePaths.isNotEmpty
                                  ? ListView.builder(
                                itemCount: _filePaths.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () => _openFile(_filePaths[index]),
                                    child: Container(
                                      margin: EdgeInsets.symmetric(vertical: 4.0),
                                      padding: EdgeInsets.all(12.0),
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(1, 150, 176, 0.67),
                                        borderRadius: BorderRadius.circular(8.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.white,
                                            blurRadius: 4.0,
                                            spreadRadius: 1.0,
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              _filePaths[index].split('/').last,
                                              style: TextStyle(fontSize: 16.0),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.delete,
                                                color: Colors.red),
                                            onPressed: () =>
                                                _removeFile(index),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              )
                                  : Center(
                                  child: Text(
                                    'No file selected',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'RobotoSlab-VariableFont',
                                        color: Colors.white),
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 14.0,
                        left: 14.0,
                        right: 14.0,
                        child: Container(
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(1, 150, 176, 0.67),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Upload File',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontFamily: 'RobotoSlab-VariableFont'),
                              ),
                              SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: _pickFile,
                                child: Text(
                                  'Choose File',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.black,
                                      fontFamily: 'RobotoSlab-VariableFont'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          )
        ]
    );



  }
}
