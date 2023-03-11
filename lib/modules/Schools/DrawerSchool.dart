import 'package:flutter/material.dart';
import 'package:online_learning_app/modules/Schools/ClassesScreen.dart';
import 'package:online_learning_app/modules/Schools/ResultScreen.dart';
import 'package:online_learning_app/modules/Schools/RoomsScreen.dart';
import 'package:online_learning_app/modules/Schools/TeacherScreen.dart';


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
         // Navigator.of(context).push(createRoute(Community()));
          },
          child: ListTile(
            leading: Icon( Icons.home,
              color: Colors.white,
              size: 30,
            ),
            title: Text('Home',style: TextStyle(color: Colors.white),),
          ),
        ),
        InkWell(
          onTap: (){
            //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>ExamScreen()), (route) => false);
          },
          child: ListTile(
            leading: Icon( Icons.subject_outlined,
              color: Colors.white,
              size: 30,
            ),
            title: Text('Subject',style: TextStyle(color: Colors.white),),
          ),
        ),
        InkWell(
          onTap: (){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>ClassesScreen()), (route) => false);

          },
          child: ListTile(
            leading: Icon( Icons.menu,
              color: Colors.white,
              size: 30,
            ),
            title: Text('Classes',style: TextStyle(color: Colors.white),),
          ),
        ),
        InkWell(
          onTap: (){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> RoomsScreen()), (route) => false);

          },
          child: ListTile(
            leading: Icon( Icons.roofing_sharp,
              color: Colors.white,
              size: 30,
            ),
            title: Text('Roms',style: TextStyle(color: Colors.white),),
          ),
        ),
        InkWell(
          onTap: (){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>TeacherScreen()), (route) => false);
          },
          child: ListTile(
            leading: Icon( Icons.person,
              color: Colors.white,
              size: 30,
            ),
            title: Text('Teachers',style: TextStyle(color: Colors.white),),
          ),
        ),
        InkWell(
          onTap: (){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>ResultScreen()), (route) => false);

          },
          child: ListTile(
            leading: Icon( Icons.zoom_out_map_outlined,
              color: Colors.white,
              size: 30,
            ),
            title: Text('Results',style: TextStyle(color: Colors.white),),
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
