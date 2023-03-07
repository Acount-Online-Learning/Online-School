import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:online_learning_app/Bloc/cubit.dart';
import 'package:online_learning_app/Bloc/states.dart';
import 'package:pie_chart/pie_chart.dart';
import '../../constants/constants.dart';

class HomeParent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return BlocProvider(create: (context)=>EducationCubit(),
    child: BlocConsumer<EducationCubit,EducationStates>(
      builder: (context,state){
        EducationCubit cubit=EducationCubit.getCubitInstance(context);
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                    width: width(context, 1),
                    height: height(context, .15),
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) => Container(
                          width: width(context, .9),
                          height: height(context, .15),
                          decoration: BoxDecoration(
                              color: HexColor('#EEF2FF'),
                              borderRadius: BorderRadius.circular(20)),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 35,
                                backgroundImage: AssetImage('assets/image.jpg'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Hassan Mohamed',
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.aBeeZee(
                                          textStyle: TextStyle(fontSize: 15))),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('30101092200537',
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.cabin(
                                          textStyle: TextStyle(fontSize: 15))),
                                ],
                              ),
                              Checkbox(
                                  value: true,
                                  activeColor: defaultColor,
                                  shape: CircleBorder(),
                                  onChanged: (c) {})
                            ],
                          ),
                        ),
                        separatorBuilder: (context, index) => SizedBox(
                          width: 10,
                        ),
                        itemCount: 4),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Container(
                    height: 50,
                    child: Row(
                      children: [
                        Text(
                          'Statistics',
                          style: GoogleFonts.cabin(fontSize: 18, color: defaultColor),
                        ),
                        Spacer(),
                        DropdownButton<String>(
                          value: cubit.dropdownParent,
                          style: TextStyle(color: defaultColor),
                          dropdownColor: HexColor('#EEF2FF'),
                          items: <String>['Marks of all Material', 'Total Score', 'Absence','Rating']
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
                           cubit.changeDropHomeParent(newValue);
                          },
                        ),

                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  homeParent(context)[cubit.currendIndex],
                ]),
              )),
        );
      },
      listener: (context,state){},
    ),
    );
  }
  List<Widget>homeParent(context)=>[
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
                      'Total marks',
                      style: GoogleFonts.acme(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'For child',
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
        PieChart(
          dataMap: {'Total Score':85,},
          animationDuration: Duration(seconds: 1),
          chartLegendSpacing: 15,
          totalValue: 100.0,
          baseChartColor: Colors.red,
          chartRadius:MediaQuery.of(context).size.width/2.2,
          colorList: [Colors.green,Colors.red],
          initialAngleInDegree: 0,
          chartType: ChartType.disc,
          legendOptions: LegendOptions(
            showLegendsInRow: false,
            legendPosition: LegendPosition.bottom,
            legendTextStyle: GoogleFonts.aBeeZee(fontSize: 16),
          ),
          chartValuesOptions: ChartValuesOptions(
            chartValueStyle: GoogleFonts.aBeeZee(fontSize: 16,color:Colors.white
            ),
              showChartValueBackground: false,
             showChartValuesInPercentage: true,
          ),
          // gradientList: ---To add gradient colors---
          // emptyColorGradient: ---Empty Color gradient---
        )
      ],
    ),
  ];

}
