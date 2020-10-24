import 'package:flutter/cupertino.dart';

class Review extends StatelessWidget {
  final String name;
  final DateTime time;
  final String description;

  Review(this.name, this.time, this.description);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(name),
            Text("2days ago"),
          ],
        ),
        Text(

          description,
        )
      ],
    );
  }
}
