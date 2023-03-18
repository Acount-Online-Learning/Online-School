import 'package:flutter/material.dart';
import 'package:online_learning_app/constants/constants.dart';

import 'DrawerTeacher.dart';

class AbsenceTeacher extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Absence',style:TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.white)),
      ),
      drawer: Drawer(
        backgroundColor: defaultColor,
        width: MediaQuery.of(context).size.width *0.55 ,
        child: DrawerItem(),
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              color: defaultColor,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Text('Absence',style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.white),),
                    Spacer(),
                    Text('Status',style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.white),)
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context,index)=>RowItem(),
                  separatorBuilder:(context,index) =>SizedBox(height: 10,),
                  itemCount: 5
              ),
            ),
            SizedBox(height: 10,),

            Container(
              color: defaultColor,
              height: 50,
              child: Center(child: Text('Apply Absence',style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.white),)),
            )
          ],
        ),
      ),
    );
  }
  Widget RowItem(){
    return Card (
      elevation: 20,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/img.jpeg'),
              ),
            ),
            SizedBox(height: 5,),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment:CrossAxisAlignment.start ,
                children: [
                  Text('Mohamed Morsy',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20 )),
                  SizedBox(height: 10,),
                  Text('3010034637283746',style: TextStyle(color: Colors.grey),),
                ],
              ),
            ),
            SizedBox(height: 5,),
            Expanded(
              child: Container(
                height: 40,
                width: 60,
                color: defaultColor,
                child: MaterialButton(
                  onPressed: (){},
                  child: Text('Come',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
