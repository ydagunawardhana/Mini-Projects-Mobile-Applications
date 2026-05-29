import 'package:crud/screens/read.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../data/datasource.dart';

class UpdateScreen extends StatefulWidget {
  final String name;
  final int id;
  final String degree;
  const UpdateScreen(
      {super.key, required this.name, required this.id, required this.degree});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController degreeController = TextEditingController();

  void initState() {
    nameController.text = widget.name;
    idController.text = widget.id.toString();
    degreeController.text = widget.degree;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update'),
        centerTitle: true,
      ),
      body: _bodyWidget(),
    );
  }

  _bodyWidget() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    child: Icon(Icons.clear),
                    onTap: () {
                      nameController.clear();
                    },
                  ),
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: idController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    child: Icon(Icons.clear),
                    onTap: () {
                      idController.clear();
                    },
                  ),
                  labelText: 'Id',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: degreeController,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    child: Icon(Icons.clear),
                    onTap: () {
                      degreeController.clear();
                    },
                  ),
                  labelText: 'Degree',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  Map<String, dynamic> studentDetails = {
                    'name': nameController.text,
                    'id': idController.text,
                    'degree': degreeController.text
                  };

                  // Update student details
                  await Database()
                      .updateStudentDetails(studentDetails, idController.text)
                      .then((value) => {
                            Fluttertoast.showToast(
                                msg: "Data updated",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0)
                          });
                  nameController.clear();
                  idController.clear();
                  degreeController.clear();
                  print(nameController.text);
                  print(idController.text);
                  print(degreeController.text);
                },
                child: Text("Update"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
