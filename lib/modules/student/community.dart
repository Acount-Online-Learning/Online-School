import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Widget/drawer.dart';

import '../../constants/constants.dart';
import 'add_comment.dart';
import 'add_post.dart';


class Community extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Image.asset('assets/comunity.png',color: Colors.white,width: 40,height: 40,)],
      ),
      drawer: Drawer(
        backgroundColor: defaultColor,
        width: MediaQuery.of(context).size.width *0.55 ,
        child: DrawerItem(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child:  SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: (){
                  Navigator.of(context).push(createRoute(AddPost()));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey.withOpacity(.2)),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('assets/image.jpg'),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text('Add Post',
                          style:
                              GoogleFonts.actor(textStyle: TextStyle(fontSize: 15)))
                    ],
                  ),
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 25,
                                    backgroundImage:
                                        AssetImage('assets/image.jpg'),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Hassan Mohamed',
                                        style: GoogleFonts.aBeeZee(
                                            textStyle: TextStyle(
                                          fontSize: 15,
                                        )),
                                      ),
                                      Text(
                                        '1 minute ago',
                                        style: GoogleFonts.abel(
                                          textStyle: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                ' Google’s Mobile SDK to build native iOS and Android, Desktop'
                                ' (Windows, Linux, macOS), and Web apps from a single codebase. '
                                'When building applications with Flutter everything towards Widgets –'
                                ' the blocks with which the flutter apps are built. They are structural '
                                'elements that ship with a bunch of material design-specific',
                                style: GoogleFonts.cairo(
                                    textStyle: TextStyle(
                                  fontSize: 13,
                                )),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                color: Colors.grey,
                                height: 1.5,
                                width: double.infinity,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: IconButton(
                                        onPressed: () {},
                                        icon:
                                            Icon(Icons.thumb_up_alt_outlined)),
                                  ),
                                  Expanded(child: Text('1200')),
                                  Expanded(
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                            Icons.thumb_down_alt_outlined)),
                                  ),
                                  Expanded(child: Text('200')),
                                  Expanded(
                                    child: IconButton(
                                        onPressed: () {
                                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddComment()));
                                        },
                                        icon:
                                            Icon(Icons.comment_bank_outlined)),
                                  ),
                                  Expanded(child: Text('1000')),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 15,
                      ),
                  itemCount: 5),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundImage:
                            AssetImage('assets/image.jpg'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hassan Mohamed',
                                style: GoogleFonts.aBeeZee(
                                    textStyle: TextStyle(
                                      fontSize: 15,
                                    )),
                              ),
                              Text(
                                '1 minute ago',
                                style: GoogleFonts.abel(
                                  textStyle: TextStyle(fontSize: 12),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        ' Google’s Mobile SDK to build native iOS and Android, Desktop'
                            ' (Windows, Linux, macOS), and Web apps from a single codebase. '
                            'When building applications with Flutter everything towards Widgets –'
                            ' the blocks with which the flutter apps are built. They are structural '
                            'elements that ship with a bunch of material design-specific',
                        style: GoogleFonts.cairo(
                            textStyle: TextStyle(
                              fontSize: 13,
                            )),
                      ),
                      Image.asset('assets/image.jpg',fit: BoxFit.fill,width: double.infinity,height: 200,),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        color: Colors.grey,
                        height: 1.5,
                        width: double.infinity,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: IconButton(
                                onPressed: () {},
                                icon:
                                Icon(Icons.thumb_up_alt_outlined)),
                          ),
                          Expanded(child: Text('1200')),
                          Expanded(
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                    Icons.thumb_down_alt_outlined)),
                          ),
                          Expanded(child: Text('200')),
                          Expanded(
                            child: IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddComment()));
                                },
                                icon:
                                Icon(Icons.comment_bank_outlined)),
                          ),
                          Expanded(child: Text('1000')),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

}
Route createRoute(Widget child) {
  return PageRouteBuilder(
    pageBuilder:(context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin =Offset(0.0, 1.0);
      const end = Offset(0.0, 0.0);
      const curve = Curves.fastOutSlowIn;
      var tween = Tween(begin: begin, end: end);
      var curveAnmation=CurvedAnimation(parent: animation, curve: curve);
      return  SlideTransition(position: tween.animate(curveAnmation),child: child,);
    },
  );
}
