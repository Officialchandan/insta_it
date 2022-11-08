import 'package:flutter/material.dart';
import '../../../models/save_data_model.dart';

class TitlePageForListView extends StatefulWidget {
  List<SaveDataModel> booksList;
  TitlePageForListView({Key? key, required this.booksList}) : super(key: key);

  @override
  State<TitlePageForListView> createState() => _TitlePageForListViewState();
}

class _TitlePageForListViewState extends State<TitlePageForListView> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: ListView.builder(
        itemCount: widget.booksList.length,
        itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          width: w,
          child: Row(
            children: [
              Container(
                height: 70.0,
                child: Image.network('${widget.booksList[index].thumbnail}',
                    fit: BoxFit.cover),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    child: Text(
                      widget.booksList[index].title!.length > 34
                          ? widget.booksList[index].title
                              .toString()
                              .substring(0, 35)
                              .toString()
                          : widget.booksList[index].title!,
                      maxLines: 1,
                      softWrap: false,
                      overflow: TextOverflow.clip,
                      style: const TextStyle(
                          overflow: TextOverflow.clip,
                          fontSize: 18,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  Text(
                    "${widget.booksList[index].authors}",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "${widget.booksList[index].publisher}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
