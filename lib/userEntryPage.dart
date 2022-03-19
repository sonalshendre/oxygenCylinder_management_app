import 'package:flutter/material.dart';
import 'package:oxygen_management_app/common/StreamDemo.dart';
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
  String? error;

  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: key,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('  Customer Entry Page  ',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          backgroundColor: Colors.blue)),
                  SizedBox(height: 30,),
                  TextFormField(
                    validator: (val) {
                      return val!.isEmpty ? 'Please Enter Name' : null;
                    },
                    controller: nameController,
                    decoration: CommonTextFieldStyle.inputField(
                        //errorT: error,
                        lable: "Customer Name",
                        hintext: 'Enter full name of customer'),
                  ),
                  SizedBox(height: 30,),
                  TextFormField(
                    validator: (val) {
                      return val!.isEmpty ? 'Please Enter valid email' : null;
                    },
                    controller: emailController,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color(0xffc8e6c9),
                      label: Text(
                        'Email',
                        style: TextStyle(color: Colors.blue),
                      ),
                      suffixIcon: Icon(Icons.email),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 3,
                          color: Colors.blue,
                          style: BorderStyle.solid,
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        width: 2,
                        color: Colors.blue,
                      )),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 30,),
                  TextFormField(
                    validator: (val) {
                      return val!.isEmpty && val.length < 10
                          ? 'Please Valid Moblie Number'
                          : null;
                    },
                    controller: mobileController,
                    decoration: CommonTextFieldStyle.inputField(
                        errorT: error,
                        lable: "Mobile Number",
                        hintext: 'Enter Mobile number of customer'),
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                  ),
                  SizedBox(height: 30,),
                  TextFormField(

                    validator: (val) {
                      return val!.isEmpty ? 'Please Enter Issue Cylinder' : null;
                    },
                    controller: noCylinderController,
                    decoration: CommonTextFieldStyle.inputField(
                        lable: "Number of Cylinder Issue",
                        hintext: 'Enter No. of issue cylinder',
                        errorT: error),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 30,),
                  MaterialButton(
                    onPressed: () {
                      if (int.parse(noCylinderController.text.isNotEmpty
                              ? noCylinderController.text
                              : '0') >=
                          MyDataBase.availableCylinder) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('No cyliner Availabe'),
                              );
                            });
                      }
                      else{

                      if (key.currentState!.validate()) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title:
                                    Text('Do you want to add anothere customer'),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomePage()));
                                      },
                                      child: Text('no')),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    UserEntryDemo()));
                                      },
                                      child: Text(
                                        'yes',
                                        style: TextStyle(color: Colors.blue),
                                      )),
                                ],
                              );
                            });

                        MyDataBase.insertData(
                                email: emailController.text,
                                name: nameController.text,
                                mobileNo: mobileController.text,
                                noOfIssueCylinder: noCylinderController.text)
                            .then((value) {
                          setState(() {});
                        });

                        MyDataBase.updateDateCylinder((int.parse(
                                        MyDataBase.dataCylinder[0].toString()) -
                                    int.parse(
                                        noCylinderController.text.toString()))
                                .toString())
                            .then((value) {
                          cylinder = (int.parse(
                                      MyDataBase.dataCylinder[0].toString()) -
                                  int.parse(noCylinderController.text.toString()))
                              .toString();
                          StreamBuilderDemo.setUdateText(cylinder);
                          setState(() {});
                        });

                        setState(() {});
                      }

                      ///ValidateIfEnd
                      else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Please Enter valid detail')));
                      }}
                    },

                    ///onPressEnd

                    child: Text(
                      'ADD',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    color: Colors.blueAccent,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
