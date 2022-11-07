import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:insta_it/ui/search_screens/details_screens.dart';

import '../../models/books_model.dart';

class ShowDataTile extends StatefulWidget {
  final List<Item>? bookItem;
  final StreamController<List<Item>> searchStream;
  const ShowDataTile(
      {Key? key, required this.bookItem, required this.searchStream})
      : super(key: key);

  @override
  State<ShowDataTile> createState() => _ShowDataTileState();
}

class _ShowDataTileState extends State<ShowDataTile> {
  String publisherName = "";

  @override
  void initState() {
    publisherName = '';
    super.initState();
  }

  @override
  void dispose() {
    publisherName = '';
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: StreamBuilder<List<Item>>(
              stream: widget.searchStream.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data!.isEmpty) {
                  return SizedBox(
                    height: h - 350,
                    width: w,
                    child: const Center(
                      child: Text(
                        "Data Not Found",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                }
                if (snapshot.hasData) {
                  return ListView.separated(
                    itemCount: widget.bookItem!.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      publisherName = '';
                      if (widget.bookItem![index].volumeInfo!.authors != null) {
                        widget.bookItem![index].volumeInfo!.authors!
                            .forEach((element) {
                          publisherName += "$element,";
                        });
                      }
                      print("item___>$publisherName");
                      List<Item>? itemIndex = widget.bookItem!;
                      print("item___>${itemIndex}");
                      log("item--->${itemIndex}");
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                      itemDetails:
                                          widget.bookItem![index].volumeInfo)));
                        },
                        child: Container(
                          child: ListTile(
                            minLeadingWidth: w * 0.13,
                            leading: SizedBox(
                                height: h,
                                width: w * 0.10,
                                child:
                                    itemIndex[index].volumeInfo!.imageLinks !=
                                            null
                                        ? Image.network(
                                            itemIndex[index]
                                                .volumeInfo!
                                                .imageLinks!
                                                .thumbnail!,
                                            fit: BoxFit.cover,
                                          )
                                        : SizedBox(
                                            height: h,
                                            width: w * 0.10,
                                          )),
                            title: Text(
                              itemIndex[index].volumeInfo!.title!,
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                            subtitle: Text(
                              publisherName.toString(),
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(thickness: 1.0, color: Colors.grey),
                  );
                }
                if (snapshot.hasError) {
                  if (snapshot.error.toString() == "loading") {
                    return SizedBox(
                      height: h - 350,
                      width: w,
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  }
                  if (snapshot.error.toString() == "Internal Server Error") {
                    return SizedBox(
                      height: h - 350,
                      width: w,
                      child: const Center(
                          child: Text(
                        "Internal Server Error",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                    );
                  } else {
                    return SizedBox(
                      height: h - 350,
                      width: w,
                      child: const Center(
                          child: Text(
                        "Please Search",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                    );
                  }
                }
                return SizedBox(
                    height: h - 350,
                    width: w,
                    child: const Center(
                        child: Text(
                      "Please Search",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )));
              },
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
