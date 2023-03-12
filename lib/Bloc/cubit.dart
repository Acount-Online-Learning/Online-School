import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:comment_tree/data/comment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:online_learning_app/Bloc/states.dart';

import '../Models/QuestionModel.dart';
import '../constants/constants.dart';

class EducationCubit extends Cubit<EducationStates>{
  EducationCubit():super(initialState());
  static EducationCubit getCubitInstance(context)=>BlocProvider.of(context);
  bool isLocked=false;
  var questionNumber=1;
  var Score=0;
  String itemOne='your Teacher';
  String itemTwo='Exams';
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

  int currendIndexSchoolHome=0;
  void changeHomeSchool(index){
    currendIndexSchoolHome=index;
    emit(ChangeHomeSchoolState());
  }


  List<List<DataCell>>scheduleSchool=[
  [  DataCell(
    Container(
        color: HexColor('#00B2FF'),
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Text(
            '8:30 - 9:30',
            style: GoogleFonts.aBeeZee(
                fontSize: 14, color: Colors.white),
          ),
        )),
  ),
    DataCell(Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Chemistry'),
        Text('hassan mohamed',maxLines: 1,style: TextStyle(overflow: TextOverflow.ellipsis,fontSize: 11,color:Colors.grey),),
      ],
    )),
    DataCell(Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Chemistry'),
        Text('hassan mohamed',maxLines: 1,style: TextStyle(overflow: TextOverflow.ellipsis,fontSize: 11,color:Colors.grey),),
      ],
    )),
    DataCell(Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Chemistry'),
        Text('hassan mohamed',maxLines: 1,style: TextStyle(overflow: TextOverflow.ellipsis,fontSize: 11,color:Colors.grey),),
      ],
    )),
    DataCell(Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Chemistry'),
        Text('hassan mohamed',maxLines: 1,style: TextStyle(overflow: TextOverflow.ellipsis,fontSize: 11,color:Colors.grey),),
      ],
    )),],

    [  DataCell(
      Container(
          color: HexColor('#00B2FF'),
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: Text(
              '10:00 - 11:30',
              style: GoogleFonts.aBeeZee(
                  fontSize: 14, color: Colors.white),
            ),
          )),
    ),
      DataCell(Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Physics'),
          Text('hassan mohamed',maxLines: 1,style: TextStyle(overflow: TextOverflow.ellipsis,fontSize: 11,color:Colors.grey),),
        ],
      )),
      DataCell(Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Chemistry'),
          Text('hassan mohamed',maxLines: 1,style: TextStyle(overflow: TextOverflow.ellipsis,fontSize: 11,color:Colors.grey),),
        ],
      )),
      DataCell(Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Chemistry'),
          Text('hassan mohamed',maxLines: 1,style: TextStyle(overflow: TextOverflow.ellipsis,fontSize: 11,color:Colors.grey),),
        ],
      )),
      DataCell(Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Chemistry'),
          Text('hassan mohamed',maxLines: 1,style: TextStyle(overflow: TextOverflow.ellipsis,fontSize: 11,color:Colors.grey),),
        ],
      )),],

    [  DataCell(
      Container(
          color: HexColor('#00B2FF'),
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: Text(
              '12:30 - 1:30',
              style: GoogleFonts.aBeeZee(
                  fontSize: 14, color: Colors.white),
            ),
          )),
    ),
      DataCell(Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Chemistry'),
          Text('hassan mohamed',maxLines: 1,style: TextStyle(overflow: TextOverflow.ellipsis,fontSize: 11,color:Colors.grey),),
        ],
      )),
      DataCell(Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Chemistry'),
          Text('hassan mohamed',maxLines: 1,style: TextStyle(overflow: TextOverflow.ellipsis,fontSize: 11,color:Colors.grey),),
        ],
      )),
      DataCell(Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Chemistry'),
          Text('hassan mohamed',maxLines: 1,style: TextStyle(overflow: TextOverflow.ellipsis,fontSize: 11,color:Colors.grey),),
        ],
      )),
      DataCell(Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Chemistry'),
          Text('hassan mohamed',maxLines: 1,style: TextStyle(overflow: TextOverflow.ellipsis,fontSize: 11,color:Colors.grey),),
        ],
      )),],

    [  DataCell(
      Container(
          color: HexColor('#00B2FF'),
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: Text(
              '2:30 - 3:30',
              style: GoogleFonts.aBeeZee(
                  fontSize: 14, color: Colors.white),
            ),
          )),
    ),
      DataCell(Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Chemistry'),
          Text('hassan mohamed',maxLines: 1,style: TextStyle(overflow: TextOverflow.ellipsis,fontSize: 11,color:Colors.grey),),
        ],
      )),
      DataCell(Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Chemistry'),
          Text('hassan mohamed',maxLines: 1,style: TextStyle(overflow: TextOverflow.ellipsis,fontSize: 11,color:Colors.grey),),
        ],
      )),
      DataCell(Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Chemistry'),
          Text('hassan mohamed',maxLines: 1,style: TextStyle(overflow: TextOverflow.ellipsis,fontSize: 11,color:Colors.grey),),
        ],
      )),
      DataCell(Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Chemistry'),
          Text('hassan mohamed',maxLines: 1,style: TextStyle(overflow: TextOverflow.ellipsis,fontSize: 11,color:Colors.grey),),
        ],
      )),],
  ];
  
  String?
      saturday1='chemistry',
      saturday2='chemistry',
      saturday3='chemistry',
      saturday4='chemistry',
      saturday5='chemistry',

     sunday1='chemistry',
     sunday2='chemistry',
     sunday3='chemistry',
     sunday4='chemistry',
     sunday5='chemistry',

     monday1='chemistry',
     monday2='chemistry',
     monday3='chemistry',
     monday4='chemistry',
     monday5='chemistry',

     tuesday1='chemistry',
     tuesday2='chemistry',
     tuesday3='chemistry',
     tuesday4='chemistry',
     tuesday5='chemistry',

     teacherSaturday1='hassan',
     teacherSaturday2='hassan',
     teacherSaturday3='hassan',
     teacherSaturday4='hassan',
     teacherSaturday5='hassan',

     teacherSunday1='hassan',
     teacherSunday2='hassan',
     teacherSunday3='hassan',
     teacherSunday4='hassan',
     teacherSunday5='hassan',

     teacherMonday1='hassan',
     teacherMonday2='hassan',
     teacherMonday3='hassan',
     teacherMonday4='hassan',
     teacherMonday5='hassan',

     teacherTuesday1='hassan',
     teacherTuesday2='hassan',
     teacherTuesday3='hassan',
     teacherTuesday4='hassan',
     teacherTuesday5='hassan';

   List<List<DataCell>>createScheduleSchool()=>[
     [
      DataCell(
        Container(
            color: HexColor('#00B2FF'),
            height: double.infinity,
            width: double.infinity,
            child: Center(
              child: Text(
                '8:30 - 9:30',
                style: GoogleFonts.aBeeZee(
                    fontSize: 14, color: Colors.white),
              ),
            )),
      ),
      DataCell(Column (
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
  buildDropDown(
  dropdownValue: saturday1,
  itemsDefault:['chemistry','English','french','no thing'],
  onChanged: (newvalue){
    saturday1 = newvalue;
emit(ChangeDropState());
  }
  ),
        SizedBox(height: 5,),
        buildDropDown(
            dropdownValue: teacherSaturday1,
            itemsDefault:['hassan','Ahmed','mohamed','nour','no thing'],
            onChanged: (newvalue){
              teacherSaturday1 = newvalue;
              emit(ChangeDropState());
            }
        ),
      ],
    )),
      DataCell(Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildDropDown(
              dropdownValue: sunday1,
              itemsDefault:['chemistry','English','french','no thing'],
              onChanged: (newvalue){
                sunday1 = newvalue;
                emit(ChangeDropState());
              }
          ),
          SizedBox(height: 5,),
          buildDropDown(
              dropdownValue: teacherSunday1,
              itemsDefault:['hassan','Ahmed','mohamed','nour','no thing'],
              onChanged: (newvalue){
                teacherSunday1 = newvalue;
                emit(ChangeDropState());
              }
          ),
        ],
      )),
      DataCell(Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildDropDown(
              dropdownValue: monday1,
              itemsDefault:['chemistry','English','french','no thing'],
              onChanged: (newvalue){
                monday1 = newvalue;
                emit(ChangeDropState());
              }
          ),
          SizedBox(height: 5,),
          buildDropDown(
              dropdownValue: teacherMonday1,
              itemsDefault:['hassan','Ahmed','mohamed','nour','no thing'],
              onChanged: (newvalue){
                teacherMonday1 = newvalue;
                emit(ChangeDropState());
              }
          ),
        ],
      )),
      DataCell(Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildDropDown(
            dropdownValue: tuesday1,
            itemsDefault:['chemistry','English','french','no thing'],
            onChanged: (newvalue){
              tuesday1 = newvalue;
              emit(ChangeDropState());
            }
        ),
        SizedBox(height: 5,),
        buildDropDown(
            dropdownValue: teacherTuesday1,
            itemsDefault:['hassan','Ahmed','mohamed','nour','no thing'],
            onChanged: (newvalue){
              teacherTuesday1 = newvalue;
              emit(ChangeDropState());
            }
        ),
      ],
    )),
  ],

     [
      DataCell(
      Container(
          color: HexColor('#00B2FF'),
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: Text(
              '10:00 - 11:30',
              style: GoogleFonts.aBeeZee(
                  fontSize: 14, color: Colors.white),
            ),
          )),
    ),
       DataCell(Column (
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           buildDropDown(
               dropdownValue: saturday2,
               itemsDefault:['chemistry','English','french','no thing'],
               onChanged: (newvalue){
                 saturday2 = newvalue;
                 emit(ChangeDropState());
               }
           ),
           SizedBox(height: 5,),
           buildDropDown(
               dropdownValue: teacherSaturday2,
               itemsDefault:['hassan','Ahmed','mohamed','nour','no thing'],
               onChanged: (newvalue){
                 teacherSaturday2 = newvalue;
                 emit(ChangeDropState());
               }
           ),
         ],
       )),
       DataCell(Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           buildDropDown(
               dropdownValue: sunday2,
               itemsDefault:['chemistry','English','french','no thing'],
               onChanged: (newvalue){
                 sunday2 = newvalue;
                 emit(ChangeDropState());
               }
           ),
           SizedBox(height: 5,),
           buildDropDown(
               dropdownValue: teacherSunday2,
               itemsDefault:['hassan','Ahmed','mohamed','nour','no thing'],
               onChanged: (newvalue){
                 teacherSunday2 = newvalue;
                 emit(ChangeDropState());
               }
           ),
         ],
       )),
       DataCell(Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           buildDropDown(
               dropdownValue: monday2,
               itemsDefault:['chemistry','English','french','no thing'],
               onChanged: (newvalue){
                 monday2 = newvalue;
                 emit(ChangeDropState());
               }
           ),
           SizedBox(height: 5,),
           buildDropDown(
               dropdownValue: teacherMonday2,
               itemsDefault:['hassan','Ahmed','mohamed','nour','no thing'],
               onChanged: (newvalue){
                 teacherMonday2 = newvalue;
                 emit(ChangeDropState());
               }
           ),
         ],
       )),
       DataCell(Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           buildDropDown(
               dropdownValue: tuesday2,
               itemsDefault:['chemistry','English','french','no thing'],
               onChanged: (newvalue){
                 tuesday2 = newvalue;
                 emit(ChangeDropState());
               }
           ),
           SizedBox(height: 5,),
           buildDropDown(
               dropdownValue: teacherTuesday2,
               itemsDefault:['hassan','Ahmed','mohamed','nour','no thing'],
               onChanged: (newvalue){
                 teacherTuesday2 = newvalue;
                 emit(ChangeDropState());
               }
           ),
         ],
       )),
    ],

     [
      DataCell(
      Container(
          color: HexColor('#00B2FF'),
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: Text(
              '12:30 - 1:30',
              style: GoogleFonts.aBeeZee(
                  fontSize: 14, color: Colors.white),
            ),
          )),
    ),
       DataCell(Column (
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           buildDropDown(
               dropdownValue: saturday3,
               itemsDefault:['chemistry','English','french','no thing'],
               onChanged: (newvalue){
                 saturday3 = newvalue;
                 emit(ChangeDropState());
               }
           ),
           SizedBox(height: 5,),
           buildDropDown(
               dropdownValue: teacherSaturday3,
               itemsDefault:['hassan','Ahmed','mohamed','nour','no thing'],
               onChanged: (newvalue){
                 teacherSaturday3 = newvalue;
                 emit(ChangeDropState());
               }
           ),
         ],
       )),
       DataCell(Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           buildDropDown(
               dropdownValue: sunday3,
               itemsDefault:['chemistry','English','french','no thing'],
               onChanged: (newvalue){
                 sunday3 = newvalue;
                 emit(ChangeDropState());
               }
           ),
           SizedBox(height: 5,),
           buildDropDown(
               dropdownValue: teacherSunday3,
               itemsDefault:['hassan','Ahmed','mohamed','nour','no thing'],
               onChanged: (newvalue){
                 teacherSunday3 = newvalue;
                 emit(ChangeDropState());
               }
           ),
         ],
       )),
       DataCell(Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           buildDropDown(
               dropdownValue: monday3,
               itemsDefault:['chemistry','English','french','no thing'],
               onChanged: (newvalue){
                 monday3 = newvalue;
                 emit(ChangeDropState());
               }
           ),
           SizedBox(height: 5,),
           buildDropDown(
               dropdownValue: teacherMonday3,
               itemsDefault:['hassan','Ahmed','mohamed','nour','no thing'],
               onChanged: (newvalue){
                 teacherMonday3 = newvalue;
                 emit(ChangeDropState());
               }
           ),
         ],
       )),
       DataCell(Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           buildDropDown(
               dropdownValue: tuesday3,
               itemsDefault:['chemistry','English','french','no thing'],
               onChanged: (newvalue){
                 tuesday3 = newvalue;
                 emit(ChangeDropState());
               }
           ),
           SizedBox(height: 5,),
           buildDropDown(
               dropdownValue: teacherTuesday3,
               itemsDefault:['hassan','Ahmed','mohamed','nour','no thing'],
               onChanged: (newvalue){
                 teacherTuesday3 = newvalue;
                 emit(ChangeDropState());
               }
           ),
         ],
       )),
    ],

     [
      DataCell(
        Container(
            color: HexColor('#00B2FF'),
            height: double.infinity,
            width: double.infinity,
            child: Center(
              child: Text(
                '1:30 - 2:30',
                style: GoogleFonts.aBeeZee(
                    fontSize: 14, color: Colors.white),
              ),
            )),
      ),
       DataCell(Column (
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           buildDropDown(
               dropdownValue: saturday4,
               itemsDefault:['chemistry','English','french','no thing'],
               onChanged: (newvalue){
                 saturday4 = newvalue;
                 emit(ChangeDropState());
               }
           ),
           SizedBox(height: 5,),
           buildDropDown(
               dropdownValue: teacherSaturday4,
               itemsDefault:['hassan','Ahmed','mohamed','nour','no thing'],
               onChanged: (newvalue){
                 teacherSaturday4= newvalue;
                 emit(ChangeDropState());
               }
           ),
         ],
       )),
       DataCell(Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           buildDropDown(
               dropdownValue: sunday4,
               itemsDefault:['chemistry','English','french','no thing'],
               onChanged: (newvalue){
                 sunday4 = newvalue;
                 emit(ChangeDropState());
               }
           ),
           SizedBox(height: 5,),
           buildDropDown(
               dropdownValue: teacherSunday4,
               itemsDefault:['hassan','Ahmed','mohamed','nour','no thing'],
               onChanged: (newvalue){
                 teacherSunday4 = newvalue;
                 emit(ChangeDropState());
               }
           ),
         ],
       )),
       DataCell(Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           buildDropDown(
               dropdownValue: monday4,
               itemsDefault:['chemistry','English','french','no thing'],
               onChanged: (newvalue){
                 monday4 = newvalue;
                 emit(ChangeDropState());
               }
           ),
           SizedBox(height: 5,),
           buildDropDown(
               dropdownValue: teacherMonday4,
               itemsDefault:['hassan','Ahmed','mohamed','nour','no thing'],
               onChanged: (newvalue){
                 teacherMonday4 = newvalue;
                 emit(ChangeDropState());
               }
           ),
         ],
       )),
       DataCell(Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           buildDropDown(
               dropdownValue: tuesday4,
               itemsDefault:['chemistry','English','french','no thing'],
               onChanged: (newvalue){
                 tuesday4 = newvalue;
                 emit(ChangeDropState());
               }
           ),
           SizedBox(height: 5,),
           buildDropDown(
               dropdownValue: teacherTuesday4,
               itemsDefault:['hassan','Ahmed','mohamed','nour','no thing'],
               onChanged: (newvalue){
                 teacherTuesday4 = newvalue;
                 emit(ChangeDropState());
               }
           ),
         ],
       )),
    ],

     [
      DataCell(
      Container(
          color: HexColor('#00B2FF'),
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: Text(
              '2:30 - 3:30',
              style: GoogleFonts.aBeeZee(
                  fontSize: 14, color: Colors.white),
            ),
          )),
    ),
       DataCell(Column (
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           buildDropDown(
               dropdownValue: saturday5,
               itemsDefault:['chemistry','English','french','no thing'],
               onChanged: (newvalue){
                 saturday5 = newvalue;
                 emit(ChangeDropState());
               }
           ),
           SizedBox(height: 5,),
           buildDropDown(
               dropdownValue: teacherSaturday5,
               itemsDefault:['hassan','Ahmed','mohamed','nour','no thing'],
               onChanged: (newvalue){
                 teacherSaturday5 = newvalue;
                 emit(ChangeDropState());
               }
           ),
         ],
       )),
       DataCell(Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           buildDropDown(
               dropdownValue: sunday5,
               itemsDefault:['chemistry','English','french','no thing'],
               onChanged: (newvalue){
                 sunday5 = newvalue;
                 emit(ChangeDropState());
               }
           ),
           SizedBox(height: 5,),
           buildDropDown(
               dropdownValue: teacherSunday5,
               itemsDefault:['hassan','Ahmed','mohamed','nour','no thing'],
               onChanged: (newvalue){
                 teacherSunday5 = newvalue;
                 emit(ChangeDropState());
               }
           ),
         ],
       )),
       DataCell(Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           buildDropDown(
               dropdownValue: monday5,
               itemsDefault:['chemistry','English','french','no thing'],
               onChanged: (newvalue){
                 monday5 = newvalue;
                 emit(ChangeDropState());
               }
           ),
           SizedBox(height: 5,),
           buildDropDown(
               dropdownValue: teacherMonday5,
               itemsDefault:['hassan','Ahmed','mohamed','nour','no thing'],
               onChanged: (newvalue){
                 teacherMonday5 = newvalue;
                 emit(ChangeDropState());
               }
           ),
         ],
       )),
       DataCell(Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           buildDropDown(
               dropdownValue: tuesday5,
               itemsDefault:['chemistry','English','french','no thing'],
               onChanged: (newvalue){
                 tuesday5 = newvalue;
                 emit(ChangeDropState());
               }
           ),
           SizedBox(height: 5,),
           buildDropDown(
               dropdownValue: teacherTuesday5,
               itemsDefault:['hassan','Ahmed','mohamed','nour','no thing'],
               onChanged: (newvalue){
                 teacherTuesday5 = newvalue;
                 emit(ChangeDropState());
               }
           ),
         ],
       )),
    ],
  ];
   void repuild(){
  emit(AddSchduelSchoolState());
}

   List<DataCell>cells(period,m1,t1,m2,t2,m3,t3,m4,t4)=>[
    DataCell(
      Container(
          color: HexColor('#00B2FF'),
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: Text(
              '$period',
              style: GoogleFonts.aBeeZee(
                  fontSize: 14, color: Colors.white),
            ),
          )),
    ),
    DataCell(Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$m1'),
        Text('$t1',maxLines: 1,style: TextStyle(overflow: TextOverflow.ellipsis,fontSize: 11,color:Colors.grey),),
      ],
    )),
    DataCell(Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$m2'),
        Text('$t2',maxLines: 1,style: TextStyle(overflow: TextOverflow.ellipsis,fontSize: 11,color:Colors.grey),),
      ],
    )),
    DataCell(Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$m3'),
        Text('$t3',maxLines: 1,style: TextStyle(overflow: TextOverflow.ellipsis,fontSize: 11,color:Colors.grey),),
      ],
    )),
    DataCell(Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$m4'),
        Text('$t4',maxLines: 1,style: TextStyle(overflow: TextOverflow.ellipsis,fontSize: 11,color:Colors.grey),),
      ],
    )),
  ];

  List<List<DataCell>> newSchedule=[];


}