import 'package:education_learning/Styles/Color.dart';
import 'package:education_learning/Widget/drawer.dart';
import 'package:flutter/material.dart';

class NoticeScreen extends StatelessWidget {
  const NoticeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Notice'),
        backgroundColor: colorDrawer,

      ),
      drawer: Drawer(
        backgroundColor: colorDrawer,
        width: size.width *0.55 ,
        child: DrawerItem(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.date_range),
                SizedBox(width: 5,),
                Text('3/4/2023'),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context,index)=>NoticeItem(),
                  separatorBuilder: (context,index)=>SizedBox(height: 10,),
                  itemCount: 6
              ),
            )

          ],
        ),
      ),
    );
  }
  Widget NoticeItem(){
    return Container(
      height: 70,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text('Mohamed Morsy passed in Interview to Field Flutter Development '),
    );
  }
}
