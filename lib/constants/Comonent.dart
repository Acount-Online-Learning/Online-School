import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../Models/books_model.dart';

import '../Models/QuestionModel.dart';
import '../modules/student/books_detail.dart';
//code create by morsy;
List<String>itemone=[
  'your Teacher',
  'Student',
  'School',
];
List<String>itemtwo=[
  'Exams',
  'Successful',
  'Faild',
];
List<QuestionModel> questions=[
  QuestionModel(
    text: 'what is actually electricity',
    options: [
      Options(
          text: 'A flow of water',
          iscorrect: false
      ),
      Options(
          text: 'A flow of air',
          iscorrect: false
      ),
      Options(
          text: 'A flow of electrons',
          iscorrect: true
      ),
      Options(
          text: 'A flow of atom',
          iscorrect: false
      ),

    ],
  ),
  QuestionModel(
    text: 'what is actually electricity',
    options: [
      Options(
          text: 'A flow of water',
          iscorrect: false
      ),
      Options(
          text: 'A flow of air',
          iscorrect: false
      ),
      Options(
          text: 'A flow of electrons',
          iscorrect: true
      ),
      Options(
          text: 'A flow of atom',
          iscorrect: false
      ),

    ],
  ),
  QuestionModel(
    text: 'what is actually electricity',
    options: [
      Options(
          text: 'A flow of water',
          iscorrect: false
      ),
      Options(
          text: 'A flow of air',
          iscorrect: false
      ),
      Options(
          text: 'A flow of electrons',
          iscorrect: true
      ),
      Options(
          text: 'A flow of atom',
          iscorrect: false
      ),

    ],
  ),
  QuestionModel(
    text: 'what is actually electricity',
    options: [
      Options(
          text: 'A flow of water',
          iscorrect: false
      ),
      Options(
          text: 'A flow of air',
          iscorrect: false
      ),
      Options(
          text: 'A flow of electrons',
          iscorrect: true
      ),
      Options(
          text: 'A flow of atom',
          iscorrect: false
      ),

    ],
  ),
  QuestionModel(
    text: 'what is actually electricity',
    options: [
      Options(
          text: 'A flow of water',
          iscorrect: false
      ),
      Options(
          text: 'A flow of air',
          iscorrect: false
      ),
      Options(
          text: 'A flow of electrons',
          iscorrect: true
      ),
      Options(
          text: 'A flow of atom',
          iscorrect: false
      ),

    ],
  ),
  QuestionModel(
    text: 'what is actually electricity',
    options: [
      Options(
          text: 'A flow of water',
          iscorrect: false
      ),
      Options(
          text: 'A flow of air',
          iscorrect: false
      ),
      Options(
          text: 'A flow of electrons',
          iscorrect: true
      ),
      Options(
          text: 'A flow of atom',
          iscorrect: false
      ),

    ],
  ),
  QuestionModel(
    text: 'what is actually electricity',
    options: [
      Options(
          text: 'A flow of water',
          iscorrect: false
      ),
      Options(
          text: 'A flow of air',
          iscorrect: false
      ),
      Options(
          text: 'A flow of electrons',
          iscorrect: true
      ),
      Options(
          text: 'A flow of atom',
          iscorrect: false
      ),

    ],
  ),
  QuestionModel(
    text: 'what is actually electricity',
    options: [
      Options(
          text: 'A flow of water',
          iscorrect: false
      ),
      Options(
          text: 'A flow of air',
          iscorrect: false
      ),
      Options(
          text: 'A flow of electrons',
          iscorrect: true
      ),
      Options(
          text: 'A flow of atom',
          iscorrect: false
      ),

    ],
  ),
  QuestionModel(
    text: 'what is actually electricity',
    options: [
      Options(
          text: 'A flow of water',
          iscorrect: false
      ),
      Options(
          text: 'A flow of air',
          iscorrect: false
      ),
      Options(
          text: 'A flow of electrons',
          iscorrect: true
      ),
      Options(
          text: 'A flow of atom',
          iscorrect: false
      ),

    ],
  ),
  QuestionModel(
    text: 'what is actually electricity',
    options: [
      Options(
          text: 'A flow of water',
          iscorrect: false
      ),
      Options(
          text: 'A flow of air',
          iscorrect: false
      ),
      Options(
          text: 'A flow of electrons',
          iscorrect: true
      ),
      Options(
          text: 'A flow of atom',
          iscorrect: false
      ),

    ],
  ),


];

//code create by Osama;
Widget buildBooksList(context) {
  return GridView.count(
    shrinkWrap: true,
    physics: const BouncingScrollPhysics(),
    crossAxisCount: 2,
    crossAxisSpacing: 5.0,
    mainAxisSpacing: 5.0,
    childAspectRatio: 1 / 1.8,
    children: List.generate(
      booksList.length,
          (index) => buildBooksItem(booksList[index],context),
    ),
  );
}

Widget buildBooksItem(BooksModel model,context) => GestureDetector(
  onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>BooksDetail(model: model,)));
  },
  child: Container(
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(image: AssetImage(model.bookImage),height: 145,width:180,),
          const SizedBox(
            height: 8,
          ),
          Text(model.bookName,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          const SizedBox(
            height: 7,
          ),
          RatingBar.builder(
            itemSize: 20,
            initialRating: model.bookRating,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          const SizedBox(height: 5,),
          Row(
            children: [
              Icon(Icons.person),
              Text(model.bookMaker,style: const TextStyle(fontWeight: FontWeight.bold),),
            ],
          ),
          MaterialButton(
            shape: Border.all(color: const Color.fromRGBO(108, 92, 231, 1)),
            color: Colors.white,
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(Icons.shopping_cart,color: Color.fromRGBO(108, 92, 231, 1),),
                Text('Add to cart')
              ],
            ),
          )
        ],
      ),
    ),
  ),
);