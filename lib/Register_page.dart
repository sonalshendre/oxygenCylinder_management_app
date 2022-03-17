import 'package:flutter/material.dart';
import 'package:oxygen_management_app/firebaseDataDemo.dart';
import 'package:oxygen_management_app/shared_perference_demo.dart';

import 'Login.dart';
import 'common/commonTextFied.dart';

class AdminRegisterPage extends StatefulWidget {
  AdminRegisterPage({Key? key}) : super(key: key);

  TextEditingController adminEmailController = TextEditingController();
  TextEditingController adminPasswordController = TextEditingController();
  TextEditingController cylinderStockController = TextEditingController();
  TextEditingController nameOfCompanyController = TextEditingController();

  @override
  _AdminRegisterPageState createState() => _AdminRegisterPageState();
}

class _AdminRegisterPageState extends State<AdminRegisterPage> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green,
        body: Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,


                children: [

                 SizedBox(height: 150,),

                  TextFormField(
                    controller: widget.adminEmailController,
                    decoration: CommonTextFieldStyle.inputField(lable: 'Email'),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: widget.adminPasswordController,
                    decoration:
                        CommonTextFieldStyle.inputField(lable: 'Password'),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: widget.nameOfCompanyController ,
                    decoration: CommonTextFieldStyle.inputField(
                        lable: 'Company'),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller:widget.cylinderStockController ,
                    decoration:
                        CommonTextFieldStyle.inputField(lable: 'Cylinder Stock'),
                  ),
                  SizedBox(height: 10,),
                  MaterialButton(
                    color: Colors.blue,
                    child: Text(
                      'create',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      SharedPeferrenceDemo.addData(key:'email',value: widget.adminEmailController.text);
                      SharedPeferrenceDemo.addData(
                          key: 'password',
                          value: widget.adminPasswordController.text);
                      SharedPeferrenceDemo.addData(
                          key: 'company',
                          value: widget.nameOfCompanyController.text);
                      MyDataBase.updateDateCylinder(widget.cylinderStockController.text);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginAdminPage()));

                      setState(() {});

                    },
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
