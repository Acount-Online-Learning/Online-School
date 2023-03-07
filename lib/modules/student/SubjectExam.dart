
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Bloc/cubit.dart';
import '../../Bloc/states.dart';
import '../../Widget/drawer.dart';
import '../../constants/Comonent.dart';
import '../../constants/constants.dart';
import 'QuestionScreen.dart';


class SubjectExam extends StatelessWidget {
  const SubjectExam({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return BlocProvider(
      create: (context)=>EducationCubit(),
      child: BlocConsumer<EducationCubit,EducationStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit=EducationCubit.getCubitInstance(context);
         return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Scaffold(
              appBar: AppBar(
                title: Text('Subject'),
                backgroundColor: defaultColor,
                leading: IconButton(
                  onPressed: () {
            Navigator.pop(context);
            },
              icon: const Icon(Icons.arrow_back,size: 35,),
            ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
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
                                items: itemone.map((item) =>
                                    DropdownMenuItem(
                                        value: item,

                                        child: Text('${item}',style: TextStyle(fontSize: 20),)
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
                                items: itemtwo.map((item) =>
                                    DropdownMenuItem(
                                        value: item,
                                        child: Text('${item}', maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style:GoogleFonts.comfortaa(fontSize: 13,),)
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
                    SizedBox(height: 10,),
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context,index)=>TableItem(index+1,context),
                          separatorBuilder:(context,index)=> SizedBox(height: 20,),
                          itemCount: 5
                      ),
                    ),
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
      child: Text(text,style: TextStyle(fontSize: 15,color: defaultColor),),
    );
  }
  Widget HeaderTextBasic(String text){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 5),
      child: Text(text,maxLines:1,overflow:TextOverflow.ellipsis,style: TextStyle(fontSize: 15,color: Colors.black),),
    );
  }
Widget TableItem(int index,context){
    return          Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,

      children: [
        TableRow(


            decoration: BoxDecoration(
              // color: Colors.black.withOpacity(0.7),
                border: Border(
                    top: BorderSide(color: Colors.grey,width: 2),
                    bottom: BorderSide(color: Colors.grey,width: 0),

                    right:BorderSide(color: Colors.grey,width: 2),
                    left: BorderSide(color: Colors.grey,width: 2)
                )
            ),
            children: [
              HeaderTextMain('Number'),
              HeaderTextBasic('${index}')



            ]
        ),
        TableRow(


            decoration: BoxDecoration(
              // color: Colors.black.withOpacity(0.7),
                border: Border(
                    top: BorderSide(color: Colors.grey,width: 1),
                    bottom: BorderSide(color: Colors.grey,width: 0),

                    right:BorderSide(color: Colors.grey,width: 1),
                    left: BorderSide(color: Colors.grey,width: 1)

                )
            ),
            children: [
              HeaderTextMain('Name'),
              HeaderTextBasic('Chapter 5'),




            ]
        ),
        TableRow(


            decoration: BoxDecoration(
              // color: Colors.black.withOpacity(0.7),
                border: Border(
                    top: BorderSide(color: Colors.grey,width: 2),
                    bottom: BorderSide(color: Colors.grey,width: 0),

                    right:BorderSide(color: Colors.grey,width: 2),
                    left: BorderSide(color: Colors.grey,width: 2)

                )
            ),
            children: [
              HeaderTextMain('Teacher'),
              HeaderTextBasic('Mohamed Ahmed '),




            ]
        ),
        TableRow(


            decoration: BoxDecoration(
              // color: Colors.black.withOpacity(0.7),
                border: Border(
                    top: BorderSide(color: Colors.grey,width: 2),
                    bottom: BorderSide(color: Colors.grey,width: 0),

                    right:BorderSide(color: Colors.grey,width: 2),
                    left: BorderSide(color: Colors.grey,width: 2)

                )
            ),
            children: [
              HeaderTextMain('Questions'),
              HeaderTextBasic('20'),




            ]
        ),
        TableRow(


            decoration: BoxDecoration(
              // color: Colors.black.withOpacity(0.7),
                border: Border(
                    top: BorderSide(color: Colors.grey,width: 2),
                    bottom: BorderSide(color: Colors.grey,width: 0),

                    right:BorderSide(color: Colors.grey,width: 2),
                    left: BorderSide(color: Colors.grey,width: 2)

                )
            ),
            children: [
              HeaderTextMain('Degrees'),
              HeaderTextBasic('20'),




            ]
        ),
        TableRow(


            decoration: BoxDecoration(
              // color: Colors.black.withOpacity(0.7),
                border: Border(
                    top: BorderSide(color: Colors.grey,width: 2),
                    bottom: BorderSide(color: Colors.grey,width: 0),

                    right:BorderSide(color: Colors.grey,width: 2),
                    left: BorderSide(color: Colors.grey,width: 2)

                )
            ),
            children: [
              HeaderTextMain('Average'),
              HeaderTextBasic('16'),




            ]
        ),
        TableRow(


            decoration: BoxDecoration(
              // color: Colors.black.withOpacity(0.7),
                border: Border(
                    top: BorderSide(color: Colors.grey,width: 2),
                    bottom: BorderSide(color: Colors.grey,width: 0),

                    right:BorderSide(color: Colors.grey,width: 2),
                    left: BorderSide(color: Colors.grey,width: 2)

                )
            ),
            children: [
              HeaderTextMain('Top'),
              HeaderTextBasic('19'),




            ]
        ),
        TableRow(


            decoration: BoxDecoration(
              // color: Colors.black.withOpacity(0.7),
                border: Border(
                    top: BorderSide(color: Colors.grey,width: 2),
                    bottom: BorderSide(color: Colors.grey,width: 0),

                    right:BorderSide(color: Colors.grey,width: 2),
                    left: BorderSide(color: Colors.grey,width: 2)

                )
            ),
            children: [
              HeaderTextMain('Rank'),
              HeaderTextBasic('20'),




            ]
        ),
        TableRow(


            decoration: BoxDecoration(
              // color: Colors.black.withOpacity(0.7),
                border: Border(
                    top: BorderSide(color: Colors.grey,width: 2),
                    bottom: BorderSide(color: Colors.grey,width: 0),

                    right:BorderSide(color: Colors.grey,width: 2),
                    left: BorderSide(color: Colors.grey,width: 2)

                )
            ),
            children: [
              HeaderTextMain('Start'),
              Row(
                children: [
                  Expanded(

                    child: MaterialButton(
                      height: 60,
                      color: Colors.white,
                      onPressed: (){},
                      child: Text('Add to cart',style: TextStyle(color: Colors.blue),),
                    ),
                  ),
                  SizedBox(width:5 ,),
                  Expanded(
                    child: MaterialButton(
                      height: 60,
                      color: Colors.blue,
                      onPressed: (){
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>QuestionScreen()), (route) => false);

                      },
                      child: Text('start',style: TextStyle(fontSize: 17,color: Colors.white),),
                    ),
                  )

                ],
              )




            ]
        ),







      ],
    );

}
}
