import 'package:flutter/material.dart';
import 'package:insta_it/models/books_model.dart';
import 'package:insta_it/ui/search_screens/datatile.dart';

import '../../main.dart';
import '../../theme/theme.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabControllers;

  TextEditingController searchController = TextEditingController();
  List<Item>? bookItem;
  BooksData? response;
  String isTitle = "Enter A Title Name";
  int valueByIndex = 0;

  @override
  void initState() {
    super.initState();
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
    return Scaffold(
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
                child: TextField(
                  controller: searchController,
                  onChanged: (value) async {
                    if (value.isNotEmpty && value.length > 3) {
                      if (valueByIndex == 0) {
                        response = await apiReposotory.getBooksData(
                            title: value, queryIn: 'intitle');
                      }
                      if (valueByIndex == 1) {
                        response = await apiReposotory.getBooksData(
                            title: value, queryIn: 'inauthor');
                      }
                      if (valueByIndex == 2) {
                        response = await apiReposotory.getBooksData(
                            title: value, queryIn: 'inpublisher');
                      }
                      if (valueByIndex == 3) {
                        response = await apiReposotory.getBooksData(
                            title: value, queryIn: 'ISBN_10');
                      }
                      print("yee__>${response!.items}");
                      if (response != null) {
                        bookItem = response!.items;
                      }
                    }
                    setState(() {});
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
                    hintText: "$isTitle",
                    suffixIcon: InkWell(
                      onTap: () {
                        searchController.clear();
                      },
                      child: const Icon(
                        Icons.clear,
                        size: 25,
                      ),
                    ),
                  ),
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
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: TabBar(
                    controller: _tabControllers,
                    onTap: (value) {
                      valueByIndex = value;
                      print("ONTAP__>$value");
                      if (valueByIndex == 0) {
                        isTitle = "Enter A Title Name";
                      }
                      if (valueByIndex == 1) {
                        isTitle = "Enter A Author Name";
                      }
                      if (valueByIndex == 2) {
                        isTitle = "Enter A Publisher Name";
                      }
                      if (valueByIndex == 3) {
                        isTitle = "Enter ISBN Number";
                      }
                      setState(() {});
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
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabControllers,
        children: [
          ShowDataTile(bookItem: bookItem ?? []),
          ShowDataTile(bookItem: bookItem ?? []),
          ShowDataTile(bookItem: bookItem ?? []),
          ShowDataTile(bookItem: bookItem ?? []),
        ],
      ),
    );
  }
}
