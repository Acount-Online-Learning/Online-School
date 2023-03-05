import 'package:education_learning/Bloc/cubit.dart';
import 'package:education_learning/Bloc/states.dart';
import 'package:education_learning/Models/QuestionModel.dart';
import 'package:education_learning/modules/ResultPage.dart';
import 'package:education_learning/Widget/OptionsWidget.dart';
import 'package:education_learning/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Styles/Color.dart';
import '../Widget/drawer.dart';

class QuestionScreen extends StatelessWidget {
var controller=PageController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>EducationCubit(),
      child: BlocConsumer<EducationCubit,EducationStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit=EducationCubit.get(context);
          var x=cubit.Score;
          Size size=MediaQuery.of(context).size;

          return  Scaffold(
            appBar: AppBar(
              title: Text('Question'),
              backgroundColor: colorDrawer,
            ),
            drawer: Drawer(
              backgroundColor: colorDrawer,
              width: size.width *0.55 ,
              child: DrawerItem(),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal:17 ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: 10,),
                  Text('Question ${cubit.questionNumber}/${questions.length}',style: TextStyle(fontSize: 20),),
                  SizedBox(height: 20,),

                  Container(width: double.infinity,height: 2,color: Colors.grey,),
                  SizedBox(height: 20,),

                  Expanded(
                    child: PageView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: questions.length,
                      controller: controller,
                      itemBuilder: (context,index)=>PageViewItem(questions[index],context),
                    ),
                  ),
                  BuiltElevatedButton(context,x),
                  SizedBox(height: 20,)
                ],
              ),
            ),
          );
        },

      ),
    );
  }
  Widget PageViewItem(QuestionModel question,context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${question.text}',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
        SizedBox(height: 25,),
        Expanded(child: OptionsWidget(
          question: question,
          onClickedOption: (option) {
            if(question.isLocked){
              return ;

            }else{
             EducationCubit.get(context).onclickOption(question,option);
             EducationCubit.get(context).isLocked=question.isLocked;
             if(question.selectedOption!.iscorrect){
               EducationCubit.get(context).GetScore();
             }
            }
          },
        )),
      ],
    );
  }
  Widget BuiltElevatedButton(context,int x){
  return ElevatedButton(
      onPressed: (){
        if(EducationCubit.get(context).questionNumber < questions.length) {
          controller.nextPage(
              duration: Duration(milliseconds: 250),
              curve: Curves.easeInExpo
          );
          EducationCubit.get(context).increaseQuestionNumber();
        }
        else{
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context)=>ResultPage(num:x)
              )
          );
        }
      },
      child: Text(
        EducationCubit.get(context).questionNumber < questions.length?'Next Page':'See of Result'
      )
  );
  }
}
