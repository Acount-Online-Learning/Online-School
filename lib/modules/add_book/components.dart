import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:githubproject/modules/books_detail/books_detail.dart';

import '../../model/books_model.dart';
import '../../shared/cubit/cubit.dart';

TextEditingController bookName = TextEditingController();
TextEditingController bookImage = TextEditingController();
TextEditingController bookDesc = TextEditingController();
TextEditingController bookMaker = TextEditingController();
TextEditingController bookPages = TextEditingController();
TextEditingController bookRating = TextEditingController();
TextEditingController bookView = TextEditingController();

Widget buildFallBackList() => Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.add_to_photos,
              size: 300,
              color: Colors.indigo,
            ),
            Text(
              'Add Books',
              style: TextStyle(
                  color: Colors.black45,
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
            )
          ],
        ),
      ),
    );

Widget buildBookList(EducationCubit cubit,context) {
  return Container(
    //color: Colors.grey[300],
    child: GridView.count(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 5.0,
      mainAxisSpacing: 5.0,
      childAspectRatio: MediaQuery.of(context).size.aspectRatio/0.78,
      children: List.generate(
        cubit.addBookList.length,
        (index) => buildBookItem(cubit.addBookList[index], EducationCubit(),context),
      ),
    ),
  );
}

Future<dynamic> buildShowDialogBook(BuildContext context, EducationCubit cubit) {
  return showDialog(
    context: context,
    builder: (context) => SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: AlertDialog(
        title: const Text('Add your book'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildShowDialogTextFormField(),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: Colors.blue,
              onPressed: () {},
              child: Row(
                children: const [
                  Icon(
                    Icons.photo,
                    color: Colors.white,
                  ),
                  Text(
                    'Gallery',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Colors.blue,
              onPressed: () {},
              child: Row(
                children: const [
                  Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                  ),
                  Text(
                    'Camera',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [

          TextButton(
            onPressed: () {
              cubit.addBook(
                  bookId: 1,
                  bookName: bookName.text,
                  bookDesc: bookDesc.text,
                  bookImage: 'assets/images/book.png',
                  bookMaker: bookMaker.text,
                  bookPages: int.fromEnvironment(bookPages.text),
                  bookRating: double.parse(bookRating.text),
                  bookViews: 500,
                  bookHistory: DateTime.now());
              Navigator.pop(context);
            },
            child: const Text('Confirm'),
          ),
          SizedBox(width: MediaQuery.of(context).size.width/2.8,),
          IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.exit_to_app,color: Colors.red,)
          ),

        ],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
  );
}

Widget buildShowDialogTextFormField() {
  return Column(
            children: [
              TextFormField(
                controller: bookName,
                decoration: const InputDecoration(
                  label: Text('Enter your book name'),
                ),
              ),
              const SizedBox(height: 20,),
              TextFormField(
                controller: bookDesc,
                decoration: const InputDecoration(
                  label: Text('Enter the description'),
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: bookMaker,
                decoration: const InputDecoration(
                  label: Text('Enter book maker'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: bookPages,
                decoration: const InputDecoration(
                  label: Text('Enter book pages'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: bookRating,
                decoration: const InputDecoration(
                  label: Text('Enter book rating'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          );
}

Widget buildBookItem(BooksModel model, EducationCubit cubit,context) => GestureDetector(
  onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context) => BooksDetail(model: model)));
  },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                //blurRadius: 1,
                offset: const Offset(0.98, 0.98),
                //spreadRadius: 2
              )
            ],
          ),
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                child: Image(
                  image: AssetImage(model.bookImage),
                  height: MediaQuery.of(context).size.height/4,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 100,
                    child: Text(
                      model.bookName,
                      style:  TextStyle(
                          fontSize: 17.sp, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '1250',
                        style: TextStyle(color: Colors.black45,fontSize: 13.sp),
                      ),
                      Icon(Icons.android_sharp, color: Colors.black45,size: 15,)
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
