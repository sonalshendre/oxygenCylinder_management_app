import 'package:flutter/material.dart';
import 'package:oxygen_management_app/common/StreamDemo.dart';
import 'package:oxygen_management_app/common/commonTextFied.dart';
import 'package:oxygen_management_app/firebaseDataDemo.dart';

import 'homepage.dart';

class ReturnCylinderUpdatedemo extends StatefulWidget {
  ReturnCylinderUpdatedemo(
      {Key? key,
      this.customerName = '',
      this.email = '',
      this.keyCu = '',
      this.numOfCylinder = ''})
      : super(key: key);
  String customerName = '';
  String email = '';
  String keyCu = '';
  String numOfCylinder = '';
  TextEditingController returnCylinderController = TextEditingController();

  @override
  _ReturnCylinderUpdatedemoState createState() =>
      _ReturnCylinderUpdatedemoState();
}

class _ReturnCylinderUpdatedemoState extends State<ReturnCylinderUpdatedemo> {
  @override
  Widget build(BuildContext context) {
    widget.returnCylinderController.text = widget.numOfCylinder;
    return SafeArea(
      child: Scaffold(

        appBar: AppBar(

            backgroundColor: Colors.green,
            centerTitle: true,
            title: Row(

              children: [
                CircleAvatar(
                  radius: 45,
                  child: Image.network(
                    'https://cdn-icons-png.flaticon.com/128/3062/3062899.png',width: 50,height: 40,),
                ),
                Text(
                  ' Jivan',
                  style: TextStyle(fontSize: 35),
                ),
              ],
            ),
            elevation: 10),

        body: Center(
          child: Container(
            width: 350,
            height: 300,
            decoration: BoxDecoration(
              color: Color(0xffc8e6c9),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blue, width: 3),
            ),
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Customer name:   ',
                      style: TextStyle(fontSize: 15, color: Colors.deepPurple),
                    ),
                    Text(
                      widget.customerName,
                      style: TextStyle(fontSize: 20, color: Colors.blue),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'email Id :   ',
                      style: TextStyle(fontSize: 13, color: Colors.deepPurple),
                    ),
                    Text(
                      widget.email,
                      style: TextStyle(fontSize: 18, color: Colors.blue),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'return cylinder:   ',
                      style: TextStyle(fontSize: 18, color: Colors.deepPurple),
                    ),
                    Container(
                      width: 50,
                      child: TextField(
                        controller: widget.returnCylinderController,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                MaterialButton(
                  onPressed: () {

                      if (widget.returnCylinderController.text ==
                          widget.numOfCylinder) {
                        MyDataBase.deleteData(widget.keyCu);
                        MyDataBase.updateDateCylinder((int.parse(
                            MyDataBase.dataCylinder[0].toString()) +
                            int.parse(widget.returnCylinderController.text
                                .toString()))
                            .toString())
                            .then((value) {
                          cylinder =
                              (int.parse(
                                  MyDataBase.dataCylinder[0].toString()) +
                                  int.parse(widget
                                      .returnCylinderController.text
                                      .toString()))
                                  .toString();

                          // StreamBuilderDemo.setUdateText(cylinder);

                          Navigator.pop(context);
                        });
                      } else {
                        MyDataBase.updateDateCylinder((int.parse(
                            MyDataBase.dataCylinder[0].toString()) +
                            int.parse(widget.returnCylinderController.text
                                .toString()))
                            .toString())
                            .then((value) {
                          cylinder =
                              (int.parse(
                                  MyDataBase.dataCylinder[0].toString()) +
                                  int.parse(widget
                                      .returnCylinderController.text
                                      .toString()))
                                  .toString();

                          // StreamBuilderDemo.setUdateText(cylinder);
                        });

                        MyDataBase.updateData(
                            (int.parse(widget.numOfCylinder) -
                                int.parse(
                                    widget.returnCylinderController.text))
                                .toString(),
                            widget.keyCu)
                            .then((value) {
                          Navigator.pop(context);
                        });
                      }

                  },

                  color: Colors.blue,
                  child: Text(
                    'update',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
