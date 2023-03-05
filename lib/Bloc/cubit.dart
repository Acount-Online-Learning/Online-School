import 'package:bloc/bloc.dart';
import 'package:education_learning/Bloc/states.dart';
import 'package:education_learning/Models/QuestionModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EducationCubit extends Cubit<EducationStates>{
  EducationCubit():super(initialState());
  static EducationCubit get(context)=>BlocProvider.of(context);
  bool isLocked=false;
  var questionNumber=1;
  var Score=0;
  String? itemOne;
  String? itemTwo;
  void changeItemone(value){
    itemOne=value;
    emit(changeItemOneState());
  }
  void changeItemTwo(value){
    itemTwo=value;
    emit(changeItemtwoState());
  }

  void onclickOption(QuestionModel question,Options option) {
    question.isLocked = true;
    question.selectedOption = option;
    emit(onclickOptionState());
  }
  void increaseQuestionNumber(){
    questionNumber++;
    emit(increaseQuestionNumberState());
  }
  void GetScore(){
    Score++;
    isLocked=false;
    emit(GetScoreState());
  }


}