import 'package:flutter/material.dart';

class PageRoutes extends StatelessWidget {
  PageRoutes({
    Key? key,
    required this.text,
    required this.widget,
    this.orientation,
    this.size,
    this.height,
    this.width,
  }) : super(key: key);

  var orientation, size, height, width;

  final String text;
  final Widget widget;

  elevatedButton(context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return SizedBox(
      height: size.height / 15,
      width: size.width / 1.2,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => widget,
            ),
          );
        },
        child: Text(
          text,
          textAlign: TextAlign.start,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: elevatedButton(context),
    );
  }
}
