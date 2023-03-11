import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_app/constants/constants.dart';
import 'package:online_learning_app/modules/parent/Bloc/Cubit.dart';
import 'package:online_learning_app/modules/parent/Bloc/States.dart';
import 'package:online_learning_app/modules/parent/DrawerParent.dart';

class ExamsChildren extends StatelessWidget  {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>CubitParent(),
      child: BlocConsumer<CubitParent,ParentStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit=CubitParent.get(context);
         return Scaffold(
            appBar: AppBar(
              title: Text('Exam'),
            ),
           drawer: Drawer(
             backgroundColor: defaultColor,
             width: MediaQuery.of(context).size.width *0.55 ,
             child: DrawerItem(),
           ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
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
                          CircleAvatar(
                            radius: 35,
                            backgroundImage:AssetImage('assets/images/img.jpeg') ,
                          ),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Mohamed Morsy',style: TextStyle(fontSize: 20),),
                              Text('300/300',style: TextStyle(fontSize:16,color:Colors.grey ),)
                            ],
                          ),
                          Spacer(),
                          IconButton(
                              onPressed: (){
                                cubit.ChangeContainer();
                              },
                              icon: cubit.value?Icon(Icons.remove,color: defaultColor,):Icon(Icons.add,color: defaultColor,)
                          )
                        ],
                      ),
                    ),
                  ),
                   cubit.value ?
                  Container(
                    color: Colors.grey[200],
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(child: Text('Name',maxLines:2,overflow:TextOverflow.ellipsis,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                            Expanded(child: Text('Subject',maxLines:2,overflow:TextOverflow.ellipsis,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                            Expanded(child: Text('Degree',maxLines:2,overflow:TextOverflow.ellipsis,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                            Expanded(child: Text('Status',maxLines:2,overflow:TextOverflow.ellipsis,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                          ],
                        ),
                       SizedBox(height:10 ,),
                        for(int i=0;i<4;i++)
                          BuiltRowItem()


                      ],
                    ),
                  ):SizedBox(height: 10,),


                ],
              ),
            ),
          );
        },

      ),
    );
  }
  Widget BuiltRowItem(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(child: Text('ch 1',maxLines:2,overflow:TextOverflow.ellipsis,style: TextStyle(fontSize: 15,color: Colors.grey),)),
          Expanded(child: Text('chemistry',maxLines:2,overflow:TextOverflow.ellipsis,style: TextStyle(fontSize: 15,color: Colors.grey),)),
          Expanded(child: Text('47/50',maxLines:2,overflow:TextOverflow.ellipsis,style: TextStyle(fontSize: 15,color: Colors.grey),)),
          Expanded(child: Text('Success',maxLines:2,overflow:TextOverflow.ellipsis,style: TextStyle(fontSize: 15,color: Colors.green),)),
        ],
      ),
    );

  }
}
