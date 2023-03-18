import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_app/constants/Comonent.dart';
import 'package:online_learning_app/modules/Schools/Bloc/Cubit.dart';
import 'package:online_learning_app/modules/Schools/Bloc/States.dart';
import '../../constants/constants.dart';
import 'DrawerSchool.dart';
class TeacherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return BlocProvider(
      create: (context)=>SchoolCubit(),

      child: BlocConsumer<SchoolCubit,SchoolStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit=SchoolCubit.get(context);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Scaffold(
              appBar: AppBar(
                title: Text('Classes'),
                backgroundColor: defaultColor,
              ),
              drawer: Drawer(
                backgroundColor: defaultColor,
                width: MediaQuery.of(context).size.width *0.55 ,
                child: DrawerItem(),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context,index)=>TableItem(index+1,context),
                          separatorBuilder:(context,index)=> SizedBox(height: 20,),
                          itemCount: 5
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Spacer(),
                        BuiltButton(name: 'Invite Teracher', function: (){})
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },

      ),
    );
  }
  Widget HeaderTextMain(String text){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
      child: Text(text,style: TextStyle(fontSize: 20,color: defaultColor),),
    );
  }
  Widget HeaderTextBasic(String text){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 5),
      child: Text(text,maxLines:1,overflow:TextOverflow.ellipsis,style: TextStyle(fontSize: 15,color: Colors.black),),
    );
  }
  Widget TableItem(int index,context){
    Size size=MediaQuery.of(context).size;

    return          Column(
      children: [
        RowItem(context),

        Table(

          defaultVerticalAlignment: TableCellVerticalAlignment.middle,

          children: [
            TableRow(


                decoration: BoxDecoration(
                  // color: Colors.black.withOpacity(0.7),
                    border: Border(
                        top: BorderSide(color: Colors.grey,width: 2),
                        bottom: BorderSide(color: Colors.grey,width: 2),

                        right:BorderSide(color: Colors.grey,width: 2),
                        left: BorderSide(color: Colors.grey,width: 2)

                    )
                ),
                children: [
                  HeaderTextMain('Subject'),
                  HeaderTextBasic('Physics'),




                ]
            ),
            TableRow(


                decoration: BoxDecoration(
                  // color: Colors.black.withOpacity(0.7),
                    border: Border(
                        top: BorderSide(color: Colors.grey,width: 2),
                        bottom: BorderSide(color: Colors.grey,width: 2),

                        right:BorderSide(color: Colors.grey,width: 2),
                        left: BorderSide(color: Colors.grey,width: 2)

                    )
                ),
                children: [
                  HeaderTextMain('Class'),
                  HeaderTextBasic('First Crade '),




                ]
            ),
            TableRow(


                decoration: BoxDecoration(
                  // color: Colors.black.withOpacity(0.7),
                    border: Border(
                        top: BorderSide(color: Colors.grey,width: 2),
                        bottom: BorderSide(color: Colors.grey,width: 2),

                        right:BorderSide(color: Colors.grey,width: 2),
                        left: BorderSide(color: Colors.grey,width: 2)

                    )
                ),
                children: [
                  HeaderTextMain('Class'),
                  HeaderTextBasic('First Grade '),




                ]
            ),
            TableRow(


                decoration: BoxDecoration(
                  // color: Colors.black.withOpacity(0.7),
                    border: Border(
                        top: BorderSide(color: Colors.grey,width: 2),
                        bottom: BorderSide(color: Colors.grey,width: 2),

                        right:BorderSide(color: Colors.grey,width: 2),
                        left: BorderSide(color: Colors.grey,width: 2)

                    )
                ),
                children: [
                  HeaderTextMain('Class Room'),
                  HeaderTextBasic('6/1 '),




                ]
            ),

            TableRow(


                decoration: BoxDecoration(
                  // color: Colors.black.withOpacity(0.7),
                    border: Border(
                        top: BorderSide(color: Colors.grey,width: 2),
                        bottom: BorderSide(color: Colors.grey,width: 2),

                        right:BorderSide(color: Colors.grey,width: 2),
                        left: BorderSide(color: Colors.grey,width: 2)

                    )
                ),
                children: [
                  HeaderTextMain('Rank'),
                  HeaderTextBasic('1500 '),




                ]
            ),

            TableRow(


                decoration: BoxDecoration(
                  // color: Colors.black.withOpacity(0.7),
                    border: Border(
                        top: BorderSide(color: Colors.grey,width: 2),
                        bottom: BorderSide(color: Colors.grey,width: 2),

                        right:BorderSide(color: Colors.grey,width: 2),
                        left: BorderSide(color: Colors.grey,width: 2)

                    )
                ),
                children: [
                  HeaderTextMain('Options'),
                  Row(children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                    SizedBox(width: 10,),
                    IconButton(onPressed: (){}, icon: Icon(Icons.delete)),

                  ],)




                ]
            ),








          ],
        ),
      ],
    );

  }
  Widget HeaderRowItem(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('assets/images/img.jpeg'),
        ),
        SizedBox(width: 5,),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Mohamed Morsy',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
              SizedBox(height: 5,),
              Text('301045456789765',style: TextStyle(fontSize: 15,color: Colors.green),)
            ],
          ),
        )
      ],
    );
  }
  Widget RowItem(context){
    Size size=MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        // color: Colors.black.withOpacity(0.7),
          border: Border(
              top: BorderSide(color: Colors.grey,width: 2),
              bottom: BorderSide(color: Colors.grey,width: 2),

              right:BorderSide(color: Colors.grey,width: 2),
              left: BorderSide(color: Colors.grey,width: 2)

          )
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
                width: size.width*0.25,
                child: HeaderTextMain('user')),
            Container(
                width: size.width *0.6,
                child: HeaderRowItem())
          ],
        ),
      ),
    );
  }
}

