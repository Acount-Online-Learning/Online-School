import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_learning_app/constants/Comonent.dart';
import 'package:online_learning_app/modules/Schools/Bloc/Cubit.dart';
import 'package:online_learning_app/modules/Schools/Bloc/States.dart';

import '../../constants/constants.dart';
import 'DrawerSchool.dart';

class ResultScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>SchoolCubit(),

      child: BlocConsumer<SchoolCubit,SchoolStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit=SchoolCubit.get(context);
          return  Scaffold(
            appBar: AppBar(
              title: Text('Results'),
            ),
              drawer: Drawer(
            backgroundColor: defaultColor,
            width: MediaQuery.of(context).size.width *0.55 ,
            child: DrawerItem(),
          ),
            body:  Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: DropdownButton(

                              value: cubit.itemOne,
                              isExpanded: true,

                              hint: Text('  Select Please ',style: TextStyle(color:defaultColor ),),
                              items: resultone.map((item) =>
                                  DropdownMenuItem(
                                      value: item,

                                      child: Text('${item}',style: TextStyle(fontSize: 20,color: defaultColor),)
                                  )
                              ).toList(),
                              onChanged: (value){
                                cubit.changeItemone(value);
                              }
                          ),
                        ),
                      ),
                      SizedBox(width: 7,),
                      Expanded(
                        child: Container(
                          child: DropdownButton(
                              value: cubit.itemTwo,
                              isExpanded: true,

                              hint: Text('  Select Please ',style: TextStyle(color: defaultColor),),
                              items: resulttwo.map((item) =>
                                  DropdownMenuItem(
                                      value: item,
                                      child: Text('${item}', maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style:GoogleFonts.comfortaa(fontSize: 13,color: defaultColor),)
                                  )
                              ).toList(),
                              onChanged: (value){
                                cubit.changeItemTwo(value);
                              }
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                     // height: 300,
                      child: ListView.separated(
                          itemBuilder: (context,index)=>BuiltResult(context),
                          separatorBuilder: (context,index)=>Container(),
                          itemCount: 1
                      ),
                    ),
                  ),
                ],
              )
            ),
          );
        },

      ),
    );
  }
    Widget BuiltItem(){
    return  Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
          border: Border(
              top: BorderSide(color: Colors.grey,width: 2),
              bottom: BorderSide(color: Colors.grey,width: 2),

              right:BorderSide(color: Colors.grey,width: 2),
              left: BorderSide(color: Colors.grey,width: 2)
          )
      ),
      child: Column(

          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15)
                  ),
                  color: defaultColor,

                ),
                  child: Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Center(child: Text('English (50)',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)),
                  )),
            ),
            Expanded(
              flex: 1,
              child: Container(child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5),
                child: Text('48'),
              )),
            ),

          ],
        ),
    );
    }
    Widget BuiltResult(context){

      var cubit=SchoolCubit.get(context);

    return Container(
    height:cubit.value? 200:70,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: defaultColor,width: 1),
                  top: BorderSide(color: defaultColor,width: 1),
                  right: BorderSide(color: defaultColor,width: 1),
                  left: BorderSide(color: defaultColor,width: 1),

                )
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: CircleAvatar(
                      radius: 35,
                      backgroundImage:AssetImage('assets/images/img.jpeg') ,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Mohamed Morsy',style: TextStyle(fontSize: 20),),
                        Text('300/300',style: TextStyle(fontSize:16,color:Colors.grey ),)
                      ],
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                        onPressed: (){
                          cubit.ChangeContainer();
                        },
                        icon: cubit.value?Icon(Icons.remove,color: defaultColor,):Icon(Icons.add,color: defaultColor,)
                    ),
                  )
                ],
              ),
            ),
          ),
          cubit.value ?
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index)=>BuiltItem(),
                  separatorBuilder: (context,index)=>SizedBox(width: 10,),
                  itemCount: 8
              ),
            ),
          )

      :SizedBox(height: 10,),


        ],
      ),
    );
    }
}
