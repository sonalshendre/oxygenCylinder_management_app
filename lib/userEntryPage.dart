import 'package:flutter/material.dart';
import 'package:oxygen_management_app/firebaseDataDemo.dart';
import 'package:oxygen_management_app/homepage.dart';

import 'common/commonTextFied.dart';

class UserEntryDemo extends StatefulWidget {
  UserEntryDemo({Key? key}) : super(key: key);

  @override
  State<UserEntryDemo> createState() => _UserEntryDemoState();
}

class _UserEntryDemoState extends State<UserEntryDemo> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController mobileController = TextEditingController();

  TextEditingController noCylinderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('Customer Entery Page',
                  style: TextStyle(fontSize: 20, color: Colors.blueAccent)),
              TextFormField(
                controller: nameController,
                decoration: CommonTextFieldStyle.inputField(
                    lable: "Customer Name",
                    hintext: 'Enter full name of customer'),
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'email',
                  suffixIcon: Icon(Icons.email),
                ),
              ),
              TextFormField(
                controller: mobileController,
                decoration: CommonTextFieldStyle.inputField(
                    lable: "Mobile Number",
                    hintext: 'Enter Mobile number of customer'),
              ),
              TextFormField(
                controller: noCylinderController,
                decoration: CommonTextFieldStyle.inputField(
                    lable: "Number of Cylinder Issue",
                    hintext: 'Enter No. of issue cylinder'),
              ),
              MaterialButton(
                onPressed: () {
                  MyDataBase.insertData(
                          email: emailController.text,
                          name: nameController.text,
                          mobileNo: mobileController.text,
                          noOfIssueCylinder: noCylinderController.text)
                      .then((value) {
                    setState(() {});
                  });

                  MyDataBase.updateDateCylinder(
                          (int.parse(MyDataBase.dataCylinder[0].toString())-
                              int.parse(noCylinderController.text.toString()))
                                  .toString())
                      .then((value) {
                        cylinder = (int.parse(MyDataBase.dataCylinder[0].toString())-
                            int.parse(noCylinderController.text.toString()))
                            .toString();
                    setState(() {});
                  });
                },
                child: Text('add'),
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
