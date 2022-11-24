import 'package:flutter/material.dart';

class SingleRadioWidget extends StatefulWidget {
  const SingleRadioWidget({Key? key, this.radioText}) : super(key: key);
  final String? radioText;

  @override
  State<SingleRadioWidget> createState() => _SingleRadioWidgetState();
}

enum SingleChoice { noChoice, choice }

class _SingleRadioWidgetState extends State<SingleRadioWidget> {
  SingleChoice? singleChoice = SingleChoice.noChoice;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: SingleChoice.choice,
          groupValue: singleChoice,
          onChanged: (SingleChoice? value) {
            setState(() {
              singleChoice = value;

              // showModalBottomSheet(
              //     context: context,
              //     builder: (context) {
              //       return Column(
              //         mainAxisSize: MainAxisSize.min,
              //         children: <Widget>[
              //           ListTile(
              //             leading: new Icon(Icons.photo),
              //             title: new Text('Photo'),
              //             onTap: () {
              //               Navigator.pop(context);
              //             },
              //           ),
              //         ],
              //       );
              //     });
            });
          },
        ),
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white, // Text Color
          ),
          onPressed: () {
            setState(() {
              singleChoice = SingleChoice.choice;

              // showModalBottomSheet(
              //     context: context,
              //     builder: (context) {
              //       return Column(
              //         mainAxisSize: MainAxisSize.min,
              //         children: <Widget>[
              //           ListTile(
              //             title: const Text('Sử dụng thông tin người liên hệ'),
              //             onTap: () {
              //               Navigator.pop(context);
              //             },
              //           ),
              //           ListTile(
              //             title: const Text('Data'),
              //             onTap: () {
              //               Navigator.pop(context);
              //             },
              //           ),
              //         ],
              //       );
              //     });
            });
          },
          child: Text(
            '${widget.radioText}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
