import 'package:flutter/material.dart';

class SingleRowCounter extends StatefulWidget {
  const SingleRowCounter({Key? key, this.title, this.value}) : super(key: key);

  final String? title;
  final int? value;
  @override
  SingleRowCounterState createState() => SingleRowCounterState();
}

class SingleRowCounterState extends State<SingleRowCounter> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          '${widget.title}',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.remove_circle_outline,
                color: (widget.value ?? 0) > 0 ? Colors.blue : Colors.grey,
                size: 30,
              ),
            ),
            SizedBox(
              width: 60,
              child: Center(
                  child: Text(
                '${widget.value}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              )),
            ),
            GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.add_circle_outline,
                color: (widget.value ?? 0) < 99 ? Colors.blue : Colors.grey,
                size: 30,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
