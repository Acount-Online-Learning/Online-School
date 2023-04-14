import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:githubproject/model/books_model.dart';
import 'package:githubproject/shared/cubit/states.dart';
import 'package:image_picker/image_picker.dart';

import '../../model/children_model.dart';

class EducationCubit extends Cubit<EducationStates> {
  EducationCubit() : super(EducationInitialState());

  static EducationCubit get(context) => BlocProvider.of(context);

  List<ChildModel> childList = [];

  void addChild(String childName, File myImage) {
    ChildModel childModel = ChildModel(childName: childName, myImage: myImage,);
    childList.add(childModel);
    emit(EducationChangeFilterState());
  }

   File? image ;

  void pickImage() async {
    emit(EducationGalleryImageLoadingState());
    final ImagePicker picker = ImagePicker();
    var imageFromGallery = await picker.pickImage(source: ImageSource.camera);
    image =File(imageFromGallery!.path);
    emit(EducationGalleryImageState());
  }

  List<BooksModel> addBookList=[];
  void addBook(
      {required int bookId,
      required String bookName,
      required String bookDesc,
      required String bookImage,
      required String bookMaker,
      required int bookViews,
      required int bookPages,
      required double bookRating,
      required DateTime bookHistory}) {

    BooksModel booksModel1 = BooksModel(
      bookId: bookId,
      bookName: bookName,
      bookDescription: bookDesc,
      bookImage: bookImage,
      bookMaker: bookMaker,
      bookViews: bookViews,
      bookPages: bookPages,
      bookRating: bookRating,
      bookHistory: bookHistory,
    );
    addBookList.add(booksModel1);
    emit(EducationAddBookState());
  }
}
