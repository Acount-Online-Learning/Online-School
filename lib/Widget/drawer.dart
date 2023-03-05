import 'package:education_learning/modules/ExamsScreen.dart';
import 'package:education_learning/modules/NoticeScreen.dart';
import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({Key? key}) : super(key: key);

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
                backgroundImage: AssetImage('images/img.jpeg'),
              ),
              SizedBox(width: 6,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Mohamed Morsy',style: TextStyle(color: Colors.white,fontSize: 10),),
                    Text(' moh.morsy@gmail.com',style: TextStyle(color: Colors.white,fontSize: 10)),

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

          },
          child: ListTile(
            leading: Icon( Icons.supervisor_account_outlined,
              color: Colors.white,
              size: 30,
            ),
            title: Text('Community',style: TextStyle(color: Colors.white),),
          ),
        ),
        InkWell(
          onTap: (){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>ExamScreen()), (route) => false);
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
          onTap: (){},
          child: ListTile(
            leading: Icon( Icons.wrap_text_outlined,
              color: Colors.white,
              size: 30,
            ),
            title: Text('Absense',style: TextStyle(color: Colors.white),),
          ),
        ),
        InkWell(
          onTap: (){},
          child: ListTile(
            leading: Icon( Icons.golf_course,
              color: Colors.white,
              size: 30,
            ),
            title: Text('Courses',style: TextStyle(color: Colors.white),),
          ),
        ),
        InkWell(
          onTap: (){},
          child: ListTile(
            leading: Icon( Icons.bookmark_rounded,
              color: Colors.white,
              size: 30,
            ),
            title: Text('Books',style: TextStyle(color: Colors.white),),
          ),
        ),
        InkWell(
          onTap: (){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>NoticeScreen()), (route) => false);

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
