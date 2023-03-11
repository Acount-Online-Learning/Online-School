
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../Styles/Color.dart';
import 'drawer.dart';
import 'SubjectExam.dart';


class ExamScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Exam'),
        backgroundColor: colorDrawer,
      ),
      drawer: Drawer(
          backgroundColor: colorDrawer,
        width: size.width *0.55 ,
        child: DrawerItem(),
      ),
      body:ListView.separated(
          itemBuilder: (context,index)=>builtItem(context),
          separatorBuilder: (context,index)=>SizedBox(height: 0,),
          itemCount: 5
      )
    );
  }
  Widget builtItem(context){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
        Expanded(
          child: InkWell(
            onTap: (){
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>SubjectExam()), (route) => false);

            },
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage('assets/sub12.jpeg'),
                      fit: BoxFit.fill,
                  )
              ),

            ),
          ),
        ),
          SizedBox(width: 10),
          Expanded(
            child: InkWell(
              onTap: (){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>SubjectExam()), (route) => false);

              },
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage('assets/sub12.jpeg'),
                      fit: BoxFit.fill,
                    )
                ),

              ),
            ),
          ),



        ],
      ),
    );
  }
}
