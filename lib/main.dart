import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insta_it/api_repository/api_reposotory.dart';
import 'package:insta_it/theme/theme.dart';
import 'package:insta_it/ui/home/home_screen.dart';

BaseOptions baseOptions = BaseOptions(
  baseUrl: 'https://www.googleapis.com/books/v1/volumes?q=',
  receiveTimeout: 60000,
  sendTimeout: 60000,
  responseType: ResponseType.json,
  maxRedirects: 3,
);

Dio dio = Dio(baseOptions);

ApiReposotory apiReposotory = ApiReposotory();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: MyAppColor.primaryColor,
      statusBarIconBrightness: Brightness.light));
  dio.interceptors.add(
    LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        logPrint: (text) {
          log(text.toString());
        }),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Insta IT',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: MyAppColor.primaryColor,
      ),
      home: const HomePage(),
    );
  }
}
