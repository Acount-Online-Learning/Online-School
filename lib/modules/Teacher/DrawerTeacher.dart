
import 'package:flutter/material.dart';
import 'package:online_learning_app/modules/Teacher/AbsenceTeacher.dart';
import 'package:online_learning_app/modules/Teacher/HomeTeacher.dart';
import 'package:online_learning_app/modules/Teacher/NoticesScreen.dart';
import 'package:online_learning_app/modules/parent/ExamsChildren.dart';
import 'package:online_learning_app/modules/parent/NoticeChildren.dart';
import 'package:online_learning_app/modules/parent/homeparent.dart';


class DrawerItem extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(height: 30,),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/image.jpg'),
              ),
              SizedBox(width: 6,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Mohamed Morsy',style: TextStyle(color: Colors.white,fontSize: 10),),
                    SizedBox(height: 7,),
                    Text('moh.morsy@gmail.com',maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.white,fontSize: 10),),

                  ],
                ),
              ),
            ],
          ),

        ),
        Container(
          width: double.infinity,
          height: 1,
          color: Colors.grey[300],
        ),
        InkWell(
          onTap: (){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomeTeacher()), (route) => false);
          },
          child: ListTile(
            leading: Icon( Icons.home,
              color: Colors.white,
              size: 30,
            ),
            title: Text('home',style: TextStyle(color: Colors.white),),
          ),
        ),
        InkWell(
          onTap: (){
            //  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>ExamScreen()), (route) => false);
          },
          child: ListTile(
            leading: Icon( Icons.book,
              color: Colors.white,
              size: 30,
            ),
            title: Text('Exams',style: TextStyle(color: Colors.white),),
          ),
        ),
        InkWell(
          onTap: (){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>AbsenceTeacher()), (route) => false);

          },
          child: ListTile(
            leading: Icon( Icons.menu_outlined,
              color: Colors.white,
              size: 30,
            ),
            title: Text('Absence',style: TextStyle(color: Colors.white),),
          ),
        ),
        InkWell(
          onTap: (){
            // Navigator.of(context).push(createRoute(Courses()));
          },
          child: ListTile(
            leading: Icon( Icons.add_to_photos_outlined,
              color: Colors.white,
              size: 30,
            ),
            title: Text('Courses',style: TextStyle(color: Colors.white),),
          ),
        ),
        InkWell(
          onTap: (){
           // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>NoticeChildren()), (route) => false);

          },
          child: ListTile(
            leading: Icon( Icons.notification_important,
              color: Colors.white,
              size: 30,
            ),
            title: Text('Books',style: TextStyle(color: Colors.white),),
          ),
        ),

        InkWell(
          onTap: (){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>NoticeTeacher()), (route) => false);

          },
          child: ListTile(
            leading: Icon( Icons.notification_important,
              color: Colors.white,
              size: 30,
            ),
            title: Text('Notices',style: TextStyle(color: Colors.white),),
          ),
        ),
        Spacer(),
        Container(
          width: double.infinity,
          height: 1,
          color: Colors.grey[300],
        ),
        InkWell(
          onTap: (){},
          child: ListTile(
            leading: Icon( Icons.person,
              color: Colors.white,
              size: 30,
            ),
            title: Text('Profile',style: TextStyle(color: Colors.white),),
          ),
        ),
        InkWell(
          onTap: (){},
          child: ListTile(
            leading: Icon( Icons.arrow_back,
              color: Colors.white,
              size: 30,
            ),
            title: Text('Sign out',style: TextStyle(color: Colors.white),),
          ),
        ),

      ],
    );
  }
}
