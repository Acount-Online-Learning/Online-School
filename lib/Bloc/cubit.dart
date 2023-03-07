import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:comment_tree/data/comment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:online_learning_app/Bloc/states.dart';
import 'package:pie_chart/pie_chart.dart';

import '../Models/QuestionModel.dart';
import '../constants/constants.dart';

class EducationCubit extends Cubit<EducationStates>{
  EducationCubit():super(initialState());
  static EducationCubit getCubitInstance(context)=>BlocProvider.of(context);
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
  List<Widget>homeParent=[
    Column(
      children: [
        Container(
            height: 60,
            width: double.infinity,
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      'Exams',
                      style: GoogleFonts.acme(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Child mark',
                      style: GoogleFonts.actor(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: HexColor(' #EEF2FF'),
                  child: Icon(
                    Icons.calendar_today,
                    color: defaultColor,
                  ),
                )
              ],
            )),
        ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => Container(
                height: 95,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: HexColor('#EEF2FF'),
                    borderRadius: BorderRadius.circular(20)),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Physics',
                          style: GoogleFonts.cairo(
                              fontSize: 16, color: defaultColor),
                        ),
                        Text(
                          '15 Exams',
                          style: GoogleFonts.actor(
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: defaultColor,
                      child: Text(
                        '15/20',
                        style: GoogleFonts.cabin(
                            fontSize: 13, color: Colors.white),
                      ),
                    )
                  ],
                )),
            separatorBuilder:(context,index)=> SizedBox(height: 15,),
            itemCount: 10),
      ],
    ),
    Column(
      children: [
        Container(
            height: 60,
            width: double.infinity,
            color: HexColor('#EEF2FF'),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      'Absence',
                      style: GoogleFonts.acme(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Child absence',
                      style: GoogleFonts.actor(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: HexColor(' #EEF2FF'),
                  child: Icon(
                    Icons.menu,
                    color: defaultColor,
                  ),
                )
              ],
            )),
        SizedBox(height: 10,),
        ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => Card(
              child: Container(
                  height: 80,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Text(
                        '7/3/2023',
                        style: GoogleFonts.cairo(
                            fontSize: 16, color: defaultColor),
                      ),
                      Spacer(),
                      Text(
                        'come',
                        style: GoogleFonts.cabin(
                            fontSize: 15, color: Colors.black),
                      )
                    ],
                  )),
            ),
            separatorBuilder:(context,index)=> SizedBox(height: 15,),
            itemCount: 10),
        SizedBox(height: 15,),
        ElevatedButton(onPressed: (){},
          child: Text(
            'See all',
            style: GoogleFonts.aBeeZee(
                fontSize: 16, color: defaultColor),
          ),
          style: ElevatedButton.styleFrom(backgroundColor:defaultColor),
        )
      ],
    ),
    Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
            height: 60,
            width: double.infinity,
            color: HexColor('#EEF2FF'),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      'Top Students',
                      style: GoogleFonts.acme(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Top students rank',
                      style: GoogleFonts.actor(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: HexColor(' #EEF2FF'),
                  child: Icon(
                    Icons.wine_bar,
                    color: defaultColor,
                  ),
                )
              ],
            )),

        ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => Card(
              child: Container(
                height: 100,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/image.jpg'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hassan mohamed',
                          style: GoogleFonts.cairo(
                              fontSize: 15),
                        ),
                        Text(
                          'First Grade',
                          style: GoogleFonts.cabin(
                              fontSize: 13, color: Colors.grey),
                        )
                      ],
                    ),
                    Spacer(),
                    Text(
                      '17k',
                      style: GoogleFonts.cairo(
                          fontSize: 15, color:defaultColor),
                    ),
                    Icon(Icons.wine_bar),
                  ],
                ),
              ),
            ),
            separatorBuilder:(context,index)=> SizedBox(height: 0,),
            itemCount: 10),
      ],
    ),

  ];
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