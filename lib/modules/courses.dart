import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_learning_app/consent.dart';
import 'package:online_learning_app/modules/show_video.dart';
import 'package:video_player/video_player.dart';

class Courses extends StatefulWidget {
  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  double sliderValue = .4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Icon(Icons.arrow_back)),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/vue 7.png',
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Vue.Learn Vue.js In Arabic #01 - Intro And What Is Vue.js ?',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.aBeeZee(
                        textStyle: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Row(
                      children: [
                        Text(
                          'Hassan Mohamed',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.adamina(
                            textStyle: TextStyle(fontSize: 12, height: 1.5),
                          ),
                        ),
                        Spacer(),
                        Text(
                          '1500 hours',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.adamina(
                            textStyle: TextStyle(
                              fontSize: 12,
                              height: 1.7,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '33K views • 2 years ago',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.adamina(
                            textStyle: TextStyle(fontSize: 12, height: 1.5),
                          ),
                        ),
                        Spacer(),
                        Text(
                          '22/7/2022',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.adamina(
                            textStyle: TextStyle(
                              fontSize: 12,
                              height: 1.7,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    RatingBar.builder(
                      initialRating: 3.5,
                      minRating: 1,
                      itemSize: 30,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Slider(
                      value: sliderValue,
                      activeColor: defaultColor,
                      onChanged: (v) {
                        setState(() {
                          sliderValue = v;
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: ListTile(
                        leading: Icon(
                          Icons.remove_shopping_cart,
                          color: Colors.white,
                        ),
                        title: Text(
                          'Remove From Cart',
                          style: GoogleFonts.alef(color: Colors.white),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(backgroundColor: defaultColor),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Description',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.alef(
                        textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: defaultColor),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(10),
                        child:Text( 'The broken, overgrown cityscapes Joel and Ellie pass through are haunting and beautiful,'
                            ' and the mushroom zombies impressively repulsive and far scarier than that description would suggest. '
                            'The broken, overgrown cityscapes Joel and Ellie pass through are haunting and beautiful, and the mushroom zombies '
                            'impressively repulsive and far scarier than that description would suggest.',)
                    ),
                    SizedBox(height: 15,),
                    Text(
                      'Videos(15)',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.alef(
                        textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: defaultColor),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(height: 2,width: double.infinity,color: defaultColor,),
                    SizedBox(height: 15,),
                    ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context,index)=> Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                child: Image.asset(
                                  'assets/vue 7.png',
                                  width: 130,
                                  height: 135,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(width: 7,),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Vue.Learn Vue.js In Arabic #01 - Intro And What Is Vue.js ?',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.aBeeZee(
                                        textStyle: TextStyle(
                                          fontSize: 12,
                                        ),

                                      ),
                                    ),
                                    SizedBox(height: 7,),
                                    Text(
                                      '33K views • 2 years ago',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.adamina(
                                        textStyle: TextStyle(fontSize: 11, height: 1.5),
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Text(
                                      '15:03 minutes',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.adamina(
                                        textStyle: TextStyle(fontSize: 11, height: 1.5),
                                      ),
                                    ),
                                    SizedBox(height: 7,),
                                    Row(
                                      children: [
                                        Text(
                                          '22/7/2022',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.adamina(
                                            textStyle: TextStyle(fontSize: 11, height: 1.5),
                                          ),
                                        ),
                                        Spacer(),
                                        MaterialButton(
                                          color: defaultColor,
                                          onPressed: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowVideo()));
                                          }, child:Text('View',
                                          style: GoogleFonts.adamina(
                                            textStyle: TextStyle(fontSize: 13, color: Colors.white),
                                          ),
                                        ), )
                                      ],
                                    ),
                                    SizedBox(height: 7,),
                                    RatingBar.builder(
                                      initialRating: 3.5,
                                      minRating: 1,
                                      itemSize: 20,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],),
                        ),
                        separatorBuilder: (context,index)=>Container(height: 2,width: double.infinity,color:defaultColor), itemCount: 5)
                  ],
                  ),
            ),
    )
    ),
    ]
    )


      /*CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/vue 7.png',
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Vue.Learn Vue.js In Arabic #01 - Intro And What Is Vue.js ?',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.aBeeZee(
                      textStyle: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: [
                      Text(
                        'Hassan Mohamed',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.adamina(
                          textStyle: TextStyle(fontSize: 12, height: 1.5),
                        ),
                      ),
                      Spacer(),
                      Text(
                        '1500 hours',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.adamina(
                          textStyle: TextStyle(
                            fontSize: 12,
                            height: 1.7,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '33K views • 2 years ago',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.adamina(
                          textStyle: TextStyle(fontSize: 12, height: 1.5),
                        ),
                      ),
                      Spacer(),
                      Text(
                        '22/7/2022',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.adamina(
                          textStyle: TextStyle(
                            fontSize: 12,
                            height: 1.7,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  RatingBar.builder(
                    initialRating: 3.5,
                    minRating: 1,
                    itemSize: 30,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Slider(
                    value: sliderValue,
                    activeColor: defaultColor,
                    onChanged: (v) {
                      setState(() {
                        sliderValue = v;
                      });
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: ListTile(
                      leading: Icon(
                        Icons.remove_shopping_cart,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Remove From Cart',
                        style: GoogleFonts.alef(color: Colors.white),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(backgroundColor: defaultColor),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Description',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.alef(
                      textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: defaultColor),
                    ),
                  ),
                  Expanded(
                      child: Container(
                          padding: EdgeInsets.all(10),
                          child:Text( 'The broken, overgrown cityscapes Joel and Ellie pass through are haunting and beautiful,'
                              ' and the mushroom zombies impressively repulsive and far scarier than that description would suggest. '
                              'The broken, overgrown cityscapes Joel and Ellie pass through are haunting and beautiful, and the mushroom zombies '
                              'impressively repulsive and far scarier than that description would suggest.',)
                      )),
                  SizedBox(height: 15,),
                  Text(
                    'Videos(15)',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.alef(
                      textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: defaultColor),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(height: 2,width: double.infinity,color: defaultColor,),
                  SizedBox(height: 15,),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: Image.asset(
                            'assets/vue 7.png',
                            width: 130,
                            height: 135,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(width: 7,),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Vue.Learn Vue.js In Arabic #01 - Intro And What Is Vue.js ?',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.aBeeZee(
                                  textStyle: TextStyle(
                                    fontSize: 12,
                                  ),

                                ),
                              ),
                              SizedBox(height: 7,),
                              Text(
                                '33K views • 2 years ago',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.adamina(
                                  textStyle: TextStyle(fontSize: 11, height: 1.5),
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                '15:03 minutes',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.adamina(
                                  textStyle: TextStyle(fontSize: 11, height: 1.5),
                                ),
                              ),
                              SizedBox(height: 7,),
                              Text(
                                '22/7/2022',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.adamina(
                                  textStyle: TextStyle(fontSize: 11, height: 1.5),
                                ),
                              ),
                              SizedBox(height: 7,),
                              RatingBar.builder(
                                initialRating: 3.5,
                                minRating: 1,
                                itemSize: 20,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 150,
                      child: ListView.separated(
                          itemBuilder: (context,index)=>   Container(width: 100,height: 100,color: Colors.black,),
                          separatorBuilder:(context,index)=>  Container(height: 2,width: double.infinity,color: defaultColor,),
                          itemCount: 5),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],

      )*/
    );
  }
}
