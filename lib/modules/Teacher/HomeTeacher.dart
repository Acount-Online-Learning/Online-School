import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_learning_app/constants/constants.dart';

import 'DrawerTeacher.dart';

class HomeTeacher extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home',style:TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.white)),

        ),
        drawer: Drawer(
          backgroundColor: defaultColor,
          width: MediaQuery.of(context).size.width *0.55 ,
          child: DrawerItem(),
        ),

        body:SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start ,
              children: [
                Container(
                  height:100,
                 // width: 150,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context,index)=>CartRow(),
                      separatorBuilder: (context,index)=>SizedBox(width: 20,),
                      itemCount: 9
                  ),
                ),
                SizedBox(height: 20,),
                Text('Statistic',style: TextStyle(color: Colors.grey),),
                SizedBox(height: 20,),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: TabBar(
                          indicator: BoxDecoration(
                            color: defaultColor,
                            borderRadius: BorderRadius.circular(10),

                          ),
                          tabs: [
                            Tab(
                              text: 'Top School',
                            ),
                            Tab(
                              text: 'Top Student',
                            ),

                          ]
                      ),
                    ),
                    SizedBox(
                      child: TabBarView(
                          children: [
                            OnTabOne(),
                            OnTabTwo()
                          ]
                      ),
                    )

                  ],
                )
            ]
                )




            ),
        ),

      ),
    );
  }
  Widget CartRow(){
    return Container(
      height:100 ,
      width: 200,
      child: Card(
        elevation: 20,

        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(child: Icon(Icons.bookmark,size: 50,color: defaultColor,)),
              Spacer(),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Books',style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey )),
                    SizedBox(height: 10,),
                    Text('200',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );

  }
  Widget RowItem(){
    return Row(
      children: [
       Expanded(
         child: CircleAvatar(
           radius: 30,
           backgroundImage: AssetImage('assets/images/img.jpeg'),
         ),
       ),
        SizedBox(width: 10,),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start ,
            children: [
              Text('High School',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20 )),
              SizedBox(height: 10,),
              Text('16 Student',style: TextStyle(color: Colors.grey),),
            ],
          ),
        ),
      //  Spacer(),
        Expanded(
          child: Row(
            children: [
              Text(
                '156',
                style: TextStyle(color: Colors.grey),
              ),
              Icon(Icons.bookmark)
            ],
          ),
        )
      ],
    );
  }
  Widget OnTabOne(){
    return               Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20)
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(children: [
            Row(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Top Schools',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  SizedBox(height:5 ,),
                  Text('140 student ',style: TextStyle(color: Colors.grey,))
                ],
              ),
              Spacer(),
              Icon(Icons.bookmark)
            ],),
            SizedBox(height: 15,),
            ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context,index)=>RowItem(),
                separatorBuilder: (context,index)=>SizedBox(height: 15,),
                itemCount: 8
            ),
          ],),
        ),
      ),
    );

  }
  Widget OnTabTwo(){
    return               Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20)
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(children: [
            Row(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Top Student',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  SizedBox(height:5 ,),
                  Text('140 student ',style: TextStyle(color: Colors.grey,))
                ],
              ),
              Spacer(),
              Icon(Icons.bookmark)
            ],),
            SizedBox(height: 15,),
            ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context,index)=>RowItem(),
                separatorBuilder: (context,index)=>SizedBox(height: 15,),
                itemCount: 8
            ),
          ],),
        ),
      ),
    );

  }
}
