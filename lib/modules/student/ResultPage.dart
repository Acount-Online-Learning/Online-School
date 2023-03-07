
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Bloc/cubit.dart';
import '../../Bloc/states.dart';
import '../../Styles/Color.dart';
import '../../Widget/drawer.dart';
import '../../constants/Comonent.dart';


class ResultPage extends StatelessWidget {
  final int num;
  ResultPage({required this.num});
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context)=>EducationCubit(),
      child: BlocConsumer<EducationCubit,EducationStates>(
        listener: (context,state){},
        builder: (context,state){
          EducationCubit cubit=EducationCubit.getCubitInstance(context);
          Size size=MediaQuery.of(context).size;

          return Scaffold(
            appBar: AppBar(
              title: Text('Degree'),
              backgroundColor: colorDrawer,
            ),

            drawer: Drawer(
              backgroundColor: colorDrawer,
              width: size.width *0.55 ,
              child: DrawerItem(),
            ),

            body:
            Center(
              child: Text('Result :${num} /${questions.length}',style: TextStyle(fontSize: 20),),
            ),
          );
        },

      ),
    );
  }
}
