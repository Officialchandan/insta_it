import 'package:flutter/material.dart';
import 'package:insta_it/theme/theme.dart';
import 'package:insta_it/ui/home/tab_screen/author_page.dart';
import 'package:insta_it/ui/home/tab_screen/titile_page.dart';
import 'package:insta_it/ui/search_screens/search_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabControllers;

  @override
  void initState() {
    super.initState();
    _tabControllers = TabController(length: 2, vsync: this);
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
              onPressed: () {},
              icon: const Icon(
                Icons.grid_view_outlined,
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
            children: const [
              TitlePage(),
              AuthorPage(),
            ]));
  }
}
