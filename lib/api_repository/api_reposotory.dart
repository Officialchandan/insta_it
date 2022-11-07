import 'package:dio/dio.dart';
import 'package:insta_it/api_repository/server_error_hendler.dart';

import '../main.dart';
import '../models/books_model.dart';

class ApiReposotory {
  static ApiReposotory instance = ApiReposotory.internal();

  ApiReposotory.internal();

  factory ApiReposotory() {
    return instance;
  }

  Future<BooksData?> getBooksData(
      {required String title, required String queryIn}) async {
    try {
      Response res = await dio.get(
          'https://www.googleapis.com/books/v1/volumes?q=$queryIn:$title&maxResults=20');
      BooksData itemList = BooksData.fromJson(res.toString());
      return itemList;
    } catch (error, stacktrace) {
      String message = "";
      if (error is DioError) {
        ServerError e = ServerError.withError(error: error);
        message = e.getErrorMessage();
      } else {
        message = "Something Went wrong";
      }
      return BooksData(kind: '', totalItems: 0);
    }
  }
}
