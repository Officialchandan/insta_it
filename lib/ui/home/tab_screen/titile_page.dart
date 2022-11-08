import 'package:flutter/material.dart';

import '../../../models/save_data_model.dart';
import '../../search_screens/details_screens.dart';

class TitlePage extends StatefulWidget {
  List<SaveDataModel> booksList;
  TitlePage({Key? key, required this.booksList}) : super(key: key);

  @override
  State<TitlePage> createState() => _TitlePageState();
}

class _TitlePageState extends State<TitlePage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: GridView.builder(
        itemCount: widget.booksList.length,
        itemBuilder: (context, index) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150.0,
              child: Image.network('${widget.booksList[index].thumbnail}',
                  fit: BoxFit.cover),
            ),
            Text(
              "${widget.booksList[index].title}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
            ),
            Text(
              "${widget.booksList[index].authors}",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text(
              "${widget.booksList[index].publisher}",
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            // childAspectRatio: 1.0,
            mainAxisExtent: h * 0.250,
            crossAxisSpacing: 14.0,
            mainAxisSpacing: 4.0),
      ),
    );
  }
}
