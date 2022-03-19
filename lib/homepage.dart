import 'dart:async';

import 'package:flutter/material.dart';
import 'package:oxygen_management_app/customerlist.dart';
import 'package:oxygen_management_app/firebaseDataDemo.dart';
import 'package:oxygen_management_app/searchCustomer.dart';
import 'package:oxygen_management_app/shared_perference_demo.dart';
import 'package:oxygen_management_app/userEntryPage.dart';

import 'Login.dart';
import 'common/StreamDemo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

String cylinder = '';

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController? tabController;
  TextEditingController tc = TextEditingController();


  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 4, vsync: this);
    MyDataBase.selectData();
    MyDataBase.selectDataCylinder().then((value) {
      Timer(Duration(seconds: 3), () {
        setState(() {

          cylinder = MyDataBase.dataCylinder.isNotEmpty
              ? MyDataBase.dataCylinder[0]
              : '0';

        });
      });
    });
  }

  int lengthd = MyDataBase.dataCylinder.length;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.green,
            centerTitle: true,
            actions: [
              GestureDetector(
                  child: Text(
                    'logout',
                    style: TextStyle(fontSize: 15),
                  ),
                  onTap: (){
                    SharedPeferrenceDemo.dispose(key: 'login');
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => LoginAdminPage()));
                  }),
            ],
            title: Row(
              children: [
                CircleAvatar(
                  radius: 45,
                  child: Image.network(
                    'https://cdn-icons-png.flaticon.com/128/3062/3062899.png',
                    width: 50,
                    height: 40,
                  ),
                ),
                Text(
                  ' Jivan',
                  style: TextStyle(fontSize: 35),
                ),
              ],
            ),
            elevation: 10),
        bottomNavigationBar: Container(
          height: 50,
          color: Colors.green,
          child: TabBar(
            controller: tabController,
            tabs: [
              Column(
                children: const [
                  Icon(Icons.home, color: Colors.white),
                  Text(
                    'homeScreen',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.library_add, color: Colors.white),
                  Text(
                    'Entry',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.ac_unit_sharp, color: Colors.white),
                  Text(
                    'Update',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.storage, color: Colors.white),
                  Text(
                    'List',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Image.network(
                      'https://cdn-icons-png.flaticon.com/128/3782/3782074.png'),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 150,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Color(0xffc8e6c9),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blue, width: 3),
                    ),
                    child: Column(
                      children: [
                        Text(
                          '  Total Avaliable Cylinder  ',
                          style: TextStyle(
                              fontSize: 23,
                              color: Colors.white,
                              backgroundColor: Colors.blue),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        StreamBuilder<String>(
                          initialData: '0',
                          stream: StreamBuilderDemo.textUpdateStream,
                          builder: (context, snapshot) => Text(
                            '${snapshot.data}',
                            style: TextStyle(
                                fontSize: 40, color: Colors.deepPurple),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            UserEntryDemo(),
            SearchCustomerDemo(),
            ViewCustomerList(),
          ],
        ),
      ),
    );
  }
}
