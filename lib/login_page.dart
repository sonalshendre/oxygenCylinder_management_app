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
  var Email = '';
  var Password = '';
  var company = '';

  _AdminRegisterPageState createState() => _AdminRegisterPageState();
}

class _AdminRegisterPageState extends State<AdminRegisterPage> {
  @override
  // TODO: implement widget

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.network(
                    'https://cdn-icons-png.flaticon.com/128/3782/3782074.png'),
                Text('   Register   ',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        backgroundColor: Colors.blue)),

                TextFormField(
                  controller: widget.adminEmailController,
                  decoration: CommonTextFieldStyle.inputField(lable: 'Email'),
                ),

                TextFormField(
                  controller: widget.adminPasswordController,
                  decoration:
                      CommonTextFieldStyle.inputField(lable: 'Company Name'),
                ),

                TextFormField(
                  controller: widget.cylinderStockController,
                  decoration:
                      CommonTextFieldStyle.inputField(lable: 'Cylinder Stock'),
                ),

                TextFormField(
                  controller: widget.nameOfCompanyController,
                  decoration:
                      CommonTextFieldStyle.inputField(lable: 'Password'),
                ),

                MaterialButton(
                  color: Colors.blue,
                  child: Text(
                    'submit',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    // SharedPeferrenceDemo.addData(key:'email',value: widget.adminEmailController.text);
                    SharedPeferrenceDemo.addData(
                        key: 'password',
                        value: widget.adminPasswordController.text);
                    SharedPeferrenceDemo.addData(
                        key: 'name of company',
                        value: widget.nameOfCompanyController.text);
                    // widget.Email= SharedPeferrenceDemo.getData(key: 'email')!;
                    widget.Password =
                        SharedPeferrenceDemo.getData(key: 'password')!;
                    widget.company =
                        SharedPeferrenceDemo.getData(key: 'name of company')!;
                    // MyDataBase.updateDateCylinder(widget.cylinderStockController.text);

                  },
                ),

                Row(
                  children: [
                    Text('Already Register?'),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginAdminPage()));
                      },
                        child: Text(
                      "Login...",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          decorationStyle: TextDecorationStyle.dashed),
                    ))
                  ],
                ),

                // Text(widget.Password),
                //
                // MaterialButton(
                //     child: Text('submit'),
                //     onPressed: (){
                //   SharedPeferrenceDemo.dispose();
                // })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
