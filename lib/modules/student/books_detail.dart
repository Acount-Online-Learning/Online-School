import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../Widget/drawer.dart';
import '../../constants/constants.dart';
import '../../Models/books_model.dart';

class BooksDetail extends StatelessWidget {
  BooksDetail({required this.model});

  BooksModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back,size: 35,),
      ),),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Image(
                image: AssetImage(model.bookImage),
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                model.bookName,
                style: GoogleFonts.aBeeZee(fontSize: 20,color: defaultColor)
              ),
              const SizedBox(height: 18),
              Text(
                model.bookDescription,
                style:GoogleFonts.actor(fontSize: 15)
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  const Icon(Icons.person),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    model.bookMaker,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
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
              const SizedBox(height: 10),
              Text(DateFormat().add_MMMMEEEEd().format(model.bookHistory)),
              const SizedBox(height: 18),
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
                      children: [
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
