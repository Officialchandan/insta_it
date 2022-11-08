import 'package:flutter/material.dart';
import 'package:insta_it/theme/theme.dart';
import 'package:insta_it/ui/home/tab_screen/author_page.dart';
import 'package:insta_it/ui/home/tab_screen/titile_page.dart';
import 'package:insta_it/ui/search_screens/search_screen.dart';

import '../../database/database_helper.dart';
import '../../models/save_data_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabControllers;
  List<SaveDataModel> booksList = [];
  bool isTrueIcon = false;

  @override
  void initState() {
    super.initState();
    getBookData();
    _tabControllers = TabController(length: 2, vsync: this);
  }

  getBookData() async {
    booksList = await DatabaseHelper.getBooks();
    if (!mounted) return;
    setState(() {});
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
            "My Library",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchScreen()));
                },
                icon: const Icon(
                  Icons.add,
                  size: 30,
                )),
          ],
          leading: IconButton(
              onPressed: () {
                isTrueIcon = !isTrueIcon;
                setState(() {});
              },
              icon: Icon(
                isTrueIcon ? Icons.grid_view_outlined : Icons.list,
                size: 25,
              )),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(70.0),
            child: Container(
              height: 70.0,
              color: MyAppColor.primaryColor,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(7.0),
                ),
                height: 35.0,
                width: w,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: TabBar(
                  controller: _tabControllers,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(7), // Creates border
                      color: Colors.white),
                  labelColor: MyAppColor.primaryColor,
                  unselectedLabelColor: Colors.black,
                  onTap: (value) async {
                    booksList = await DatabaseHelper.getBooks();
                    setState(() {});
                  },
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
                  ],
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabControllers,
            children: [
              isTrueIcon
                  ? booksList.isNotEmpty
                      ? TitlePage(booksList: booksList)
                      : contentWidget()
                  : booksList.isNotEmpty
                      ? TitlePageForListView(booksList: booksList)
                      : contentWidget(),
              isTrueIcon
                  ? booksList.isNotEmpty
                      ? TitlePage(booksList: booksList)
                      : contentWidget()
                  : booksList.isNotEmpty
                      ? TitlePageForListView(booksList: booksList)
                      : contentWidget(),
            ]));
  }

  Widget contentWidget() {
    return Container(
        child: Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Add book with the ",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              "+",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              " icon to",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 6,
        ),
        const Text(
          "your book list",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    ));
  }
}
