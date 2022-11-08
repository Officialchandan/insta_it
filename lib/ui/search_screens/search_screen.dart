import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_it/models/books_model.dart';
import 'package:insta_it/ui/bloc_ui/search_bloc.dart';
import 'package:insta_it/ui/bloc_ui/search_event.dart';
import 'package:insta_it/ui/search_screens/datatile.dart';
import 'package:insta_it/utility/utiliy.dart';

import '../../api_repository/network.dart';
import '../../main.dart';
import '../../theme/theme.dart';
import 'package:rxdart/rxdart.dart';

import '../bloc_ui/search_state.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabControllers;
  List<Item> booksDataList = [];
  StreamController<List<Item>> searchStream = StreamController.broadcast();
  DateTime? currentDate;
  String day = "";
  final subject = BehaviorSubject<String>();
  TextEditingController searchController = TextEditingController();
  HomeBloc homeBloc = HomeBloc();
  // List<Item>? bookItem;
  BooksData? response;
  String isTitle = "Enter A Title Name";
  int valueByIndex = 0;

  @override
  void initState() {
    super.initState();
    subject.stream
        .debounce(
            (event) => TimerStream(event, const Duration(milliseconds: 1000)))
        .listen((query) async {
      debugPrint("query--->$query");
      booksDataList.clear();
      if (await Network.isConnected()) {
        if (valueByIndex == 0) {
          response = await apiReposotory.getBooksData(
              title: query, queryIn: 'intitle');
        }
        if (valueByIndex == 1) {
          response = await apiReposotory.getBooksData(
              title: query, queryIn: 'inauthor');
        }
        if (valueByIndex == 2) {
          response = await apiReposotory.getBooksData(
              title: query, queryIn: 'inpublisher');
        }
        if (valueByIndex == 3) {
          response = await apiReposotory.getBooksData(
              title: query, queryIn: 'ISBN_10');
        }
        print("yee__>${response!.items}");
        if (response!.items != null) {
          booksDataList = response!.items!;
          searchStream.sink.add(response!.items!);
          homeBloc.add(SearchEvent(
              bookItem: response!.items!, searchStream: searchStream));
        } else {
          Utility.myToast(messages: "Please Enter Valid Search");
        }
      } else {
        Utility.myToast(messages: "Check Your Internet Connection");
      }
    });
    _tabControllers = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabControllers.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (BuildContext context) => HomeBloc(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Search Online",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Cancel",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400),
                )),
          ],
          leading: const Text(""),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(120.0),
            child: Column(
              children: [
                Container(
                  height: 45,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(12, 0, 0, 3),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: MyAppColor.textFieldColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state is ChangeHintTextState) {
                        isTitle = state.hintText;
                      }
                      return TextField(
                        controller: searchController,
                        onChanged: (value) async {
                          if (value.isNotEmpty && value.length > 2) {
                            if (valueByIndex == 0) {
                              booksDataList.clear();
                              subject.add(value);
                            }
                            if (valueByIndex == 1) {
                              booksDataList.clear();
                              subject.add(value);
                            }
                            if (valueByIndex == 2) {
                              booksDataList.clear();
                              subject.add(value);
                            }
                            if (valueByIndex == 3) {
                              booksDataList.clear();
                              subject.add(value);
                            }
                            setState(() {});
                            // homeBloc.add(SearchEvent());
                            print("HHHHH");
                          }
                        },
                        maxLength: 51,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          counterText: "",
                          fillColor: Colors.transparent,
                          border: InputBorder.none,
                          filled: true,
                          hintText: isTitle,
                          suffixIcon: InkWell(
                            onTap: () {
                              if (searchController.text.trim().isNotEmpty) {
                                searchController.clear();
                                booksDataList.clear();
                                searchStream.sink.addError(
                                    "Enter Name or mobile number to search retailer");
                              }
                            },
                            child: const Icon(
                              Icons.clear,
                              size: 25,
                            ),
                          ),
                        ),
                      );
                    },
                    bloc: homeBloc,
                  ),
                ),
                Container(
                  height: 65.0,
                  color: MyAppColor.primaryColor,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    height: 35.0,
                    width: w,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    child: TabBar(
                      controller: _tabControllers,
                      onTap: (value) {
                        searchController.clear();
                        valueByIndex = value;
                        print("ONTAP__>$value");
                        if (valueByIndex == 0) {
                          homeBloc.add(ChangeHintTextEvent(
                              hintText: "Enter A Title Name"));
                        }
                        if (valueByIndex == 1) {
                          homeBloc.add(ChangeHintTextEvent(
                              hintText: "Enter A Author Name"));
                        }
                        if (valueByIndex == 2) {
                          homeBloc.add(ChangeHintTextEvent(
                              hintText: "Enter A Publisher Name"));
                        }
                        if (valueByIndex == 3) {
                          homeBloc.add(ChangeHintTextEvent(
                              hintText: "Enter ISBN Number"));
                        }
                      },
                      indicator: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(7), // Creates border
                          color: Colors.white),
                      labelColor: MyAppColor.primaryColor,
                      unselectedLabelColor: Colors.black,
                      tabs: const <Widget>[
                        Tab(
                          child: Text(
                            "Title",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Author",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "publisher",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "ISBN",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            print("YESSS");
            if (state is SearchState) {
              print("DDDDD");
              return TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabControllers,
                children: [
                  ShowDataTile(
                      bookItem: booksDataList ?? [],
                      searchStream: searchStream),
                  ShowDataTile(
                      bookItem: booksDataList ?? [],
                      searchStream: searchStream),
                  ShowDataTile(
                      bookItem: booksDataList ?? [],
                      searchStream: searchStream),
                  ShowDataTile(
                      bookItem: booksDataList ?? [],
                      searchStream: searchStream),
                ],
              );
            } else {
              print("MMMMSS");
              return TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabControllers,
                children: [
                  Container(),
                  Container(),
                  Container(),
                  Container(),
                ],
              );
            }
          },
          bloc: homeBloc,
        ),
      ),
    );
  }
}
