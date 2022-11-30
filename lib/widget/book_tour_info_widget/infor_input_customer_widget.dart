import 'package:flutter/material.dart';

import '../custom_switch.dart';

class PhoneCodeWidget extends StatelessWidget {
  const PhoneCodeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          flex: 1,
          child: Center(
            child: Text(
              '+84',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Colors.blue,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                  labelText: 'Số điện thoại *',
                ),
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                    return "Enter Correct Email Address";
                  } else {
                    return null;
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DotWidget extends StatelessWidget {
  const DotWidget({
    Key? key,
    this.totalWidth = 300,
    this.dashWidth = 10,
    this.emptyWidth = 5,
    this.dashHeight = 2,
    this.dashColor = Colors.black,
  }) : super(key: key);
  final double totalWidth, dashWidth, emptyWidth, dashHeight;

  final Color dashColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          totalWidth ~/ (dashWidth + emptyWidth),
          (_) => Container(
            width: dashWidth,
            height: dashHeight,
            color: dashColor,
            margin:
                EdgeInsets.only(left: emptyWidth / 2, right: emptyWidth / 2),
          ),
        ),
      ),
    );
  }
}

class TextFormWidget extends StatelessWidget {
  const TextFormWidget({
    Key? key,
    this.labelText,
    this.hintText,
    this.value,
    this.actionText,
  }) : super(key: key);

  final String? labelText;
  final String? hintText;
  final String? value;
  final TextInputAction? actionText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: TextFormField(
        textInputAction: actionText,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 15,
            color: Colors.grey,
          ),
          hintText: hintText ?? '',
          labelText: '$labelText *',
        ),
        // onChanged: (_) => FocusScope.of(context).nextFocus(),
        onSaved: (String? value) {
          // This optional block of code can be used to run
          // code when the user saves the form.
        },
        validator: (String? value) {
          return (value != null && value.contains('@'))
              ? 'Do not use the @ char.'
              : null;
        },
      ),
    );
  }
}

class NationalTextWidget extends StatelessWidget {
  const NationalTextWidget({
    Key? key,
    this.labelText,
    this.hintText,
    this.value,
    this.actionText,
  }) : super(key: key);

  final String? labelText;
  final String? hintText;
  final String? value;
  final TextInputAction? actionText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: TextFormField(
        textInputAction: actionText,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 15,
            color: Colors.grey,
          ),
          hintText: hintText ?? '',
          labelText: '$labelText *',
        ),
        // onChanged: (_) => FocusScope.of(context).nextFocus(),
        onSaved: (String? value) {
          // This optional block of code can be used to run
          // code when the user saves the form.
        },
        validator: (String? value) {
          return (value != null && value.contains('@'))
              ? 'Do not use the @ char.'
              : null;
        },
      ),
    );
  }
}

class RadioButtonWidget extends StatefulWidget {
  const RadioButtonWidget({
    Key? key,
  }) : super(key: key);
  @override
  State<RadioButtonWidget> createState() => _RadioButtonWidgetState();
}

enum Gender { male, female }

class _RadioButtonWidgetState extends State<RadioButtonWidget> {
  Gender? _gender = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 5, 0, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Expanded(
            flex: 3,
            child: Text(
              'Giới tính',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Radio<Gender>(
                  value: Gender.male,
                  groupValue: _gender,
                  onChanged: (Gender? value) {
                    setState(() {
                      _gender = value;
                    });
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white, // Text Color
                  ),
                  onPressed: () {
                    setState(() {
                      _gender = Gender.male;
                    });
                  },
                  child: const Text(
                    'Nam',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Radio<Gender>(
                  value: Gender.female,
                  groupValue: _gender,
                  onChanged: (Gender? value) {
                    setState(() {
                      _gender = value;
                    });
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white, // Text Color
                  ),
                  onPressed: () {
                    setState(() {
                      _gender = Gender.female;
                    });
                  },
                  child: const Text(
                    'Nữ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DiscountCodeWidget extends StatelessWidget {
  const DiscountCodeWidget({Key? key, this.text}) : super(key: key);
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.discount_outlined,
                color: Colors.green,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                '$text',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          TextButton(
              onPressed: () {},
              child: const Text(
                'Nhập mã',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.blue,
                ),
              ))
        ],
      ),
    );
  }
}

class UseCoinWidget extends StatefulWidget {
  const UseCoinWidget({Key? key, this.text, this.coinUse, this.moneyCoin})
      : super(key: key);
  final String? text;
  final int? coinUse;
  final double? moneyCoin;

  @override
  State<UseCoinWidget> createState() => _UseCoinWidgetState();
}

class _UseCoinWidgetState extends State<UseCoinWidget> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.generating_tokens,
                color: Colors.yellow,
                size: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' Dùng ${widget.coinUse ?? ''} Xu',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            const TextSpan(
                              text: ' để thanh toán.',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                      children: <TextSpan>[
                        const TextSpan(
                          text: '(Tương ứng với',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: '  ${widget.coinUse ?? ''} đ)',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.info_outline,
                        size: 20,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    CustomSwitch(
                      activeColor: Colors.pinkAccent,
                      value: status,
                      onChanged: (value) {
                        // print("VALUE : $value");
                        setState(() {
                          status = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
