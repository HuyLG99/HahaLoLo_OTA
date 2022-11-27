import 'package:flutter/material.dart';

class CheckboxFormField extends StatefulWidget {
  final Function callback;
  final String? text;

  const CheckboxFormField({Key? key, required this.callback, this.text})
      : super(key: key);

  @override
  CheckboxFormFieldState createState() => CheckboxFormFieldState();
}

class CheckboxFormFieldState extends State<CheckboxFormField> {
  bool checkboxValue = false;
  @override
  Widget build(BuildContext context) {
    return FormField(
      builder: (state) {
        return Column(
          children: [
            Row(
              children: [
                Checkbox(
                  value: checkboxValue,
                  onChanged: (value) {
                    widget.callback();
                    checkboxValue = value!;
                    state.didChange(value);
                  },
                ),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.callback();
                        checkboxValue = !checkboxValue;
                      });
                    },
                    child: SizedBox(
                      width: 300,
                      child: Text(
                        '${widget.text}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )),
              ],
            ),
            // Text(
            //   state.errorText ?? '',
            //   style: TextStyle(
            //     color: Theme.of(context).errorColor,
            //   ),
            // ),
          ],
        );
      },
      // validator: (value) {
      //   if (!checkboxValue) return 'You must check this box';
      //   return null;
      // },
      // onSaved: (value) {
      //   widget.callback('Check Box', value.toString());
      // },
    );
  }
}

class RadioFormField extends StatefulWidget {
  final Function callback;
  const RadioFormField({Key? key, required this.callback}) : super(key: key);

  @override
  RadioFormFieldState createState() => RadioFormFieldState();
}

class RadioFormFieldState extends State<RadioFormField> {
  String radioValue = 'Top';

  @override
  Widget build(BuildContext context) {
    return FormField(
      builder: (state) {
        return Column(
          children: [
            Radio<String>(
                value: 'Top',
                groupValue: radioValue,
                onChanged: (String? value) {
                  setState(() {
                    radioValue = value!;
                  });
                }),
            Radio<String>(
                value: 'Bottom',
                groupValue: radioValue,
                onChanged: (String? value) {
                  setState(() {
                    radioValue = value!;
                  });
                }),
            Text(
              state.errorText ?? '',
              style: TextStyle(
                color: Theme.of(context).errorColor,
              ),
            ),
          ],
        );
      },
      validator: (value) {
        if (radioValue == 'Bottom') {
          return 'You must choose the top radio button.';
        }
        return null;
      },
      onSaved: (value) {
        widget.callback('Radio', radioValue);
      },
    );
  }
}

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
