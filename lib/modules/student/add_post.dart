import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_learning_app/Bloc/cubit.dart';
import 'package:online_learning_app/Bloc/states.dart';
import '../../constants/constants.dart';

class AddPost extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>EducationCubit(),
    child: BlocConsumer<EducationCubit,EducationStates>(
        builder: (context,state){
          EducationCubit cubit=EducationCubit.getCubitInstance(context);
          return Scaffold(appBar: AppBar(),
              body: CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                  AssetImage('assets/image.jpg'),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Hassan Mohamed',
                                        style: GoogleFonts.aBeeZee(
                                            textStyle: TextStyle(
                                              fontSize: 15,
                                            )),
                                      ),
                                      SizedBox(height: 10,),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: DropdownButton<String>(
                                              value: cubit.dropdownValue,
                                              style: TextStyle(color: defaultColor),
                                              items: <String>['For all', 'Same level', 'My friends']
                                                  .map<DropdownMenuItem<String>>((String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(
                                                    value,
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                    style:GoogleFonts.comfortaa(fontSize: 13,),
                                                  ),
                                                );
                                              }).toList(),
                                              // Step 5.
                                              onChanged: (String? newValue) {
                                                cubit.changeDropPerson( newValue!);
                                              },
                                            ),
                                          ),
                                          SizedBox(width: 20,),
                                          Expanded(
                                            child: DropdownButton<String>(
                                              //    isExpanded: true,
                                              value: cubit.dropdownMaterial,
                                              style: TextStyle(color: defaultColor),
                                              // Step 4.
                                              items: <String>['physics', ' Chemist', 'Science']
                                                  .map<DropdownMenuItem<String>>((String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(
                                                    value,
                                                    style:GoogleFonts.comfortaa(fontSize: 13),
                                                  ),
                                                );
                                              }).toList(),
                                              // Step 5.
                                              onChanged: (String? newValue) {
                                                cubit.changeDropMaterial(newValue!);
                                              },
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                      width: double.infinity,
                                      height: 200,
                                      margin:EdgeInsets.symmetric(horizontal: 10) ,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color:defaultColorContainer,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Write Post...',
                                        ),
                                        keyboardType: TextInputType.multiline,
                                        maxLines: null,
                                      )
                                  ),
                                  if(cubit.image!=null) Expanded(
                                    child: Container(width: double.infinity,
                                      padding: EdgeInsets.all(10),
                                      margin:EdgeInsets.symmetric(horizontal: 10) ,
                                      decoration: BoxDecoration(
                                        color:defaultColorContainer,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Image(image:FileImage(cubit.image!,),width: double.infinity,height: 250,fit: BoxFit.fill),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            ElevatedButton(onPressed: (){
                              cubit.showDialog( true);

                            },style: ElevatedButton.styleFrom(backgroundColor: defaultColor,elevation: 0,),
                                child: Text('Add Image',style: GoogleFonts.actor(),)),
                            SizedBox(height: 10,),
                            ElevatedButton(onPressed: (){
                              cubit.showDialog( true);
                            },style: ElevatedButton.styleFrom(fixedSize: Size(200, 30),backgroundColor: defaultColor,elevation: 0,),
                                child: Text('Publish',style: GoogleFonts.actor(fontSize: 15),)),
                            if(cubit.showdialog) AlertDialog(
                              backgroundColor: defaultColorContainer,
                              actionsAlignment: MainAxisAlignment.end,
                              actionsPadding: EdgeInsets.zero,
                              contentPadding:EdgeInsets.zero,

                              elevation: 0,
                              content:Column(children: [ListTile(
                                leading: Icon(Icons.camera_alt,color: defaultColor,),
                                title:Text('Camera',style:GoogleFonts.cairo(textStyle:TextStyle(color: defaultColor))
                                ),
                                onTap: (){cubit.getCameraImage();},
                              ),
                                ListTile(
                                  leading: Icon(Icons.image,color: defaultColor,),
                                  title:Text('Gallery',style:GoogleFonts.cairo(textStyle:TextStyle(color: defaultColor))
                                  ),
                                  onTap: (){cubit.getGallertImage();},
                                ),
                              ],),
                              actions: [
                                // The "Yes" button
                                TextButton(
                                    onPressed: () {
                                      // Remove the box
                                      cubit.showDialog( false);
                                      // Close the dialog
                                    },
                                    child: const Text('Cancel')),
                              ],
                            )
                          ]
                      ),
                    )
                  ]
              )
          );
        },
    listener: (context,state){},
    ),
    );
  }
}
