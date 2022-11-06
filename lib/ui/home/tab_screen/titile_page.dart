import 'package:flutter/material.dart';

class TitlePage extends StatefulWidget {
  const TitlePage({Key? key}) : super(key: key);

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
        itemCount: 10,
        itemBuilder: (context, index) => ItemTile(h: h),
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

class ItemTile extends StatelessWidget {
  final double h;
  const ItemTile({super.key, required this.h});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 150.0,
          child: Image.network(
              'https://static.remove.bg/remove-bg-web/ea3c274e1b7f6fbbfe93fad8b2b13d7ef352f09c/assets/start_remove-c851bdf8d3127a24e2d137a55b1b427378cd17385b01aec6e59d5d4b5f39d2ec.png',
              fit: BoxFit.cover),
        ),
        const Text(
          "My Library",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
        ),
        const Text(
          "My Library",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        const Text(
          "My Library",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
