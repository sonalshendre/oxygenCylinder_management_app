import 'package:flutter/material.dart';
import 'package:oxygen_management_app/firebaseDataDemo.dart';

class ViewCustomerList extends StatelessWidget {
  const ViewCustomerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: MyDataBase.data.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.all(15),

              padding: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Color(0xffc8e6c9),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blue,width: 3),
              ),

              child: Column(
                children: [
                  Container(
                    color: Colors.blueAccent,
                    width: 200,
                    child: Center(
                      child: Text(
                        MyDataBase.data[index]['CustomerName'],
                        style: TextStyle(fontSize: 23,color: Colors.white),

                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'No of cylinder issue: ${MyDataBase.data[index]['NoOfIssueCylinder']}',
                    style: const TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 20,
                    ),),

                  Text(
                    'email:   ${MyDataBase.data[index]['email']}',
                    style: const TextStyle(
                      fontSize: 17,
                    ),
                  ),

                  Text(
                    'phone number:   ${MyDataBase.data[index]['CustomerMobileNo']}',
                    style: TextStyle(fontSize: 15),
                  ),


                ],
              ),
            );
          }
          // ListTile(
          //   hoverColor: Colors.redAccent,
          //   contentPadding: EdgeInsets.all(10),
          //  title: Text(MyDataBase.data[index]['CustomerName'],style: TextStyle(fontSize: 25),),
          //   subtitle: Column(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     crossAxisAlignment:CrossAxisAlignment.start,
          //     children: [
          //       Text('email:   ${MyDataBase.data[index]['email']}',style: TextStyle(fontSize: 20,),),
          //       Text('phone number:   ${MyDataBase.data[index]['CustomerMobileNo']}',style: TextStyle(fontSize: 20),),
          //       Text('No of cylinder issue: ${MyDataBase.data[index]['NoOfIssueCylinder']}',style: TextStyle(fontSize: 20,),)
          //     ],
          //   ),
          // ),

          ),
    );
  }
}
