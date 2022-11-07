import 'package:flutter/material.dart';
import 'package:insta_it/models/save_data_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../database/database_helper.dart';
import '../../models/books_model.dart';

class DetailsScreen extends StatefulWidget {
  final VolumeInfo? itemDetails;
  const DetailsScreen({Key? key, required this.itemDetails}) : super(key: key);
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    debugPrint("hhI-->${widget.itemDetails}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Book Details",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        actions: [
          TextButton(
            onPressed: () {
              SaveDataModel saveDataModel = SaveDataModel(
                title: widget.itemDetails!.title,
                authors: widget.itemDetails!.authors,
                categories: widget.itemDetails!.categories,
                description: widget.itemDetails!.description!,
                language: widget.itemDetails!.language,
                pageCount: widget.itemDetails!.pageCount,
                publisher: widget.itemDetails!.publisher,
                publishedDate: widget.itemDetails!.publishedDate,
                previewLink: widget.itemDetails!.previewLink,
                imageLinks: widget.itemDetails!.imageLinks,
              );

              DatabaseHelper.addGiftToCart(saveDataModel);
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => const SearchScreen()));
            },
            child: const Text(
              "Save",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            children: const [
              SizedBox(
                width: 7,
              ),
              Icon(
                Icons.arrow_back_ios_sharp,
                size: 20,
              ),
              Text(
                " Back",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        leadingWidth: w * 0.20,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  "${widget.itemDetails!.imageLinks!.thumbnail}",
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Center(
                child: Text(
                  "${widget.itemDetails!.title}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(thickness: 1.0, color: Colors.grey),
              const Text(
                "Authors",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                "${widget.itemDetails!.authors!.first}",
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 6,
              ),
              const Divider(thickness: 1.0, color: Colors.grey),
              const Text(
                "Publisher",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                "${widget.itemDetails!.publisher}",
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 6,
              ),
              const Divider(thickness: 1.0, color: Colors.grey),
              const Text(
                "Publication Date",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                "${widget.itemDetails!.publishedDate}",
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 6,
              ),
              const Divider(thickness: 1.0, color: Colors.grey),
              const Text(
                "Language and Pages",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                "${widget.itemDetails!.language} / ${widget.itemDetails!.pageCount}",
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 6,
              ),
              const Divider(thickness: 1.0, color: Colors.grey),
              const Text(
                "Categories",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 3,
              ),
              widget.itemDetails!.categories != null
                  ? Text(
                      widget.itemDetails!.categories!.first,
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w400),
                    )
                  : const Text(
                      "",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                    ),
              const SizedBox(
                height: 6,
              ),
              const Divider(thickness: 1.0, color: Colors.grey),
              const Text(
                "ISBN",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 3,
              ),
              const Text(
                "",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 6,
              ),
              const Divider(thickness: 1.0, color: Colors.grey),
              const Text(
                "Description",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                "${widget.itemDetails!.description}",
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 6,
              ),
              const Divider(thickness: 1.0, color: Colors.grey),
              Center(
                child: TextButton(
                  onPressed: () async {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const SearchScreen()));
                    debugPrint(
                        "widget.itemDetails!.previewLink!-->${widget.itemDetails!.previewLink!}");
                    await _launchUrl(url: widget.itemDetails!.previewLink!);
                  },
                  child: const Text(
                    "Preview On Google Books",
                    style: TextStyle(
                        color: Colors.indigoAccent,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const Divider(thickness: 1.0, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl({required String url}) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }
}
