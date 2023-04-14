import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../model/books_model.dart';

class BooksDetail extends StatelessWidget {
  BooksDetail({Key? key, required this.model}) : super(key: key);

  BooksModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  Image(
                    image: AssetImage(model.bookImage),
                    height: 350.h,
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: const Image(
                        image: AssetImage('assets/images/cancel.png'),
                      height: 40,
                      width: 40,
                    ),
                  ),
                  // IconButton(
                  //   onPressed: () {
                  //     Navigator.pop(context);
                  //   },
                  //   icon: const Icon(FontAwesomeIcons.circleXmark,size: 35,color: Colors.red,),
                  // )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                model.bookName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 18),
              Text(
                model.bookDescription,
                style: const TextStyle(
                  color: Color.fromRGBO(134, 134, 134, 1),
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  const Icon(Icons.person),
                  const SizedBox(
                    width: 6,
                  ),
                  const Text('Created by : ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red),),
                  Text(
                    model.bookMaker,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.visibility_outlined),
                      const SizedBox(
                        width: 6,
                      ),
                      Text('${model.bookViews} Views')
                    ],
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
                ],
              ),
              Text(DateFormat().add_MMMMEEEEd().format(model.bookHistory)),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    color: const Color.fromRGBO(0, 178, 255, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    onPressed: () {},
                    child: Row(
                      children: const [
                        Icon(
                          Icons.book_outlined,
                          color: Colors.white,
                        ),
                        Text(
                          'Read',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    color: const Color.fromRGBO(70, 187, 110, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    onPressed: () {},
                    child: Row(
                      children: const[
                        Icon(
                          Icons.download,
                          color: Colors.white,
                        ),
                        Text(
                          'Download',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
