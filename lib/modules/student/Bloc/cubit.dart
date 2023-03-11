import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:comment_tree/data/comment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:online_learning_app/modules/student/Bloc/states.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../Models/QuestionModel.dart';



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

  double sliderValue = .4;
  void changeSlider(sliderValue){
   this.sliderValue=sliderValue;
   emit(ChangeSlider());
  }

  void replaycomment(autoRepley,focusNode){
    autoRepley = true;
    Future.delayed(Duration(seconds: 0),
            () {
          focusNode.requestFocus(); //auto focus on second text field.
        });
    emit(CommentReplayState());
  }
  void exitFromreplaycomment(autoRepley){
    autoRepley=false;
    FocusManager.instance.primaryFocus?.unfocus();
    emit(CommentReplayState());
  }
  var controller = TextEditingController();
bool showdialog=false;
  void showDialog(isShowDialog){
    showdialog=isShowDialog;
    emit(showDialogState());
  }

  File ?image;
  void getCameraImage()async{
    final ImagePicker _picker = ImagePicker();
    var imageFromCamar=await _picker.pickImage(source: ImageSource.camera);
    image = File( imageFromCamar!.path );
    emit(GetImageState());
  }
  void getGallertImage()async{
    final ImagePicker _picker = ImagePicker();
    var imageFromGallery=await _picker.pickImage(source: ImageSource.gallery);
      image = File( imageFromGallery!.path );
    emit(GetImageState());
  }

  List<Comment> comments= [
    Comment(
        avatar: 'null',
        userName: 'Mohame',
        content:
        'A Dart template generator which helps teams'),
    Comment(
        avatar: 'null',
        userName: 'Hasssan',
        content:
        'A Dart template generator which helps teams generator which helps teams generator which helps teams'),
    Comment(
        avatar: 'null',
        userName: 'Nour',
        content:
        'A Dart template generator which helps teams'),
    Comment(
        avatar: 'null',
        userName: 'Ahmed',
        content: 'A Dart template hellow teams'),
    Comment(
        avatar: 'null',
        userName: 'Morsy',
        content:
        'A Dart template generator which helps teams generator which helps teams '),
  ];
  void addComments(v){
  comments.add(Comment(avatar: null, userName: 'hassan', content: v));
  controller.text='';
    emit(createCommentState());
  }
  String dropdownValue = 'For all';
  String dropdownMaterial = 'physics';
  void changeDropPerson(value){
    dropdownValue=value;
    emit(ChangeDropState());
  }
  void changeDropMaterial(value){
    dropdownMaterial=value;
    emit(ChangeDropState());
  }

  String dropdownParent='Marks of all Material';

  int currendIndex=0;

  void changeDropHomeParent(value){
    dropdownParent=value;
    if(value=='Marks of all Material')currendIndex=0;
    if(value=='Absence')currendIndex=1;
    if(value=='Total Score')currendIndex=3;
    if(value=='Rating')currendIndex=2;
    emit(ChangeDropState());
  }







}