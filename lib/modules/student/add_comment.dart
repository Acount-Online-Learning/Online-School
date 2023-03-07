import 'package:comment_tree/data/comment.dart';
import 'package:comment_tree/widgets/comment_tree_widget.dart';
import 'package:comment_tree/widgets/tree_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:online_learning_app/Bloc/cubit.dart';
import 'package:online_learning_app/Bloc/states.dart';
import '../../constants/constants.dart';
class AddComment extends StatelessWidget{
  bool autoRepley = false;
  FocusNode focusNode = FocusNode();
  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(create: (context)=>EducationCubit(),
      child: BlocConsumer<EducationCubit,EducationStates>(
        builder: (context,state){
          EducationCubit cubit=EducationCubit.getCubitInstance(context);
          return Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      child: CommentTreeWidget<Comment, Comment>(
                        Comment(
                            avatar: 'null',
                            userName: 'hassan',
                            content:
                            'felangel made felangel/cubit_and_beyond public '),
                        cubit.comments,
                        treeThemeData: TreeThemeData(
                            lineColor: HexColor('#6C5CE7'), lineWidth: 3),
                        avatarRoot: (context, data) => PreferredSize(
                          child: CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.grey,
                            backgroundImage: AssetImage('assets/image.jpg'),
                          ),
                          preferredSize: Size.fromRadius(18),
                        ),
                        avatarChild: (context, data) => PreferredSize(
                          child: CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.grey,
                            backgroundImage: AssetImage('assets/image.jpg'),
                          ),
                          preferredSize: Size.fromRadius(12),
                        ),
                        contentChild: (context, data) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 8),
                                decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(12)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${data.userName}',
                                      style: GoogleFonts.aBeeZee(
                                          textStyle: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w600)),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      '${data.content}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption
                                          ?.copyWith(
                                          fontWeight: FontWeight.w300,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              DefaultTextStyle(
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.bold),
                                child: Padding(
                                  padding: EdgeInsets.only(top: 4),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 8,
                                      ),
                                      /*  Expanded(
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.thumb_up_alt_outlined,size: 20,),),
                                ),
                                  Expanded(
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                          Icons.thumb_down_alt_outlined,size: 20,),),
                                ),
                                Expanded(
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                          Icons.favorite_outline,size: 20,),),
                                ),*/
                                    ],
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                        contentRoot: (context, data) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 8),
                                decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(12)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'hassan',
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      '${data.content}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                          fontWeight: FontWeight.w300,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              DefaultTextStyle(
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.bold),
                                child: Padding(
                                  padding: EdgeInsets.only(top: 4),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 8,
                                      ),
                                      SizedBox(
                                        width: 24,
                                      ),
                                      TextButton(
                                          onPressed: () {
                                           cubit.replaycomment(autoRepley, focusNode);
                                          },
                                          child: Text('Reply',style: TextStyle(color:defaultColor),)),
                                      Spacer(),
                                      Icon(
                                        Icons.thumb_up_alt_rounded,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('15'),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Icon(
                                        Icons.thumb_down_alt_rounded,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('5')
                                    ],
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.1),
                          borderRadius: BorderRadius.circular(25)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          CircleAvatar(
                            radius: 15,
                            backgroundImage: AssetImage('assets/image.jpg'),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: TextFormField(
                              focusNode: focusNode,
                              autofocus: autoRepley,
                              controller: cubit.controller,
                              onTapOutside:(v){
                                cubit.exitFromreplaycomment(autoRepley);
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                hintText: 'Write comment...',
                              ),

                              onFieldSubmitted: (v) {
                                if(v.isNotEmpty)cubit.addComments(v);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        listener: (context,state){},
      ),
      )
    );
  }
}
