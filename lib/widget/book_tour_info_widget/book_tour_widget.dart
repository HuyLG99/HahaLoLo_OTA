import 'package:flutter/material.dart';

import '../custom_switch.dart';

class BookTourInfoWidget extends StatelessWidget {
  const BookTourInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Column(
        children: [
          // TextFormWidget(
          //   labelText: 'Họ',
          //   actionText: TextInputAction.next,
          //   value: 'dsad',
          // ),
          // DotWidget(
          //   dashColor: Colors.grey,
          //   dashHeight: 1,
          //   dashWidth: 5,
          // ),
          // TextFormWidget(
          //   labelText: 'Tên đệm và tên',
          //   actionText: TextInputAction.next,
          // ),
          // DotWidget(
          //   dashColor: Colors.grey,
          //   dashHeight: 1,
          //   dashWidth: 5,
          // ),
          // RadioButtonWidget(),
          // DotWidget(
          //   dashColor: Colors.grey,
          //   dashHeight: 1,
          //   dashWidth: 5,
          // ),
          // TextFormWidget(
          //   labelText: 'Email',
          //   actionText: TextInputAction.next,
          // ),
          // DotWidget(
          //   dashColor: Colors.grey,
          //   dashHeight: 1,
          //   dashWidth: 5,
          // ),
          // PhoneCodeWidget(),
          // DotWidget(
          //   dashColor: Colors.grey,
          //   dashHeight: 1,
          //   dashWidth: 5,
          // ),
          // TextFormWidget(
          //   labelText: 'Địa chỉ',
          //   actionText: TextInputAction.next,
          // ),
          // DotWidget(
          //   dashColor: Colors.grey,
          //   dashHeight: 1,
          //   dashWidth: 5,
          // ),
          // TextFormWidget(
          //   labelText: 'Tỉnh/Thành phố',
          //   actionText: TextInputAction.next,
          // ),
          // DotWidget(
          //   dashColor: Colors.grey,
          //   dashHeight: 1,
          //   dashWidth: 5,
          // ),
          // NationalTextWidget(
          //   labelText: 'Quốc tịch',
          //   actionText: TextInputAction.done,
          // ),
          // DotWidget(
          //   dashColor: Colors.grey,
          //   dashHeight: 1,
          //   dashWidth: 5,
          // ),
          FormValidation(),
        ],
      ),
    );
  }
}

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

class FormValidation extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  FormValidation({super.key}); //key for form
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.always,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: 'Họ *',
              border: InputBorder.none,
              labelStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
            validator: (value) {
              if (value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                //allow upper and lower case alphabets and space
                return "Enter Correct Name";
              } else {
                return null;
              }
            },
          ),
          const DotWidget(
            dashColor: Colors.grey,
            dashHeight: 1,
            dashWidth: 5,
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.always,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: 'Tên đệm và tên *',
              border: InputBorder.none,
              labelStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
            validator: (value) {
              if (value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                //allow upper and lower case alphabets and space
                return "Enter Correct Name";
              } else {
                return null;
              }
            },
          ),
          const DotWidget(
            dashColor: Colors.grey,
            dashHeight: 1,
            dashWidth: 5,
          ),
          const RadioButtonWidget(),
          const DotWidget(
            dashColor: Colors.grey,
            dashHeight: 1,
            dashWidth: 5,
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.always,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: 'Email * ',
              border: InputBorder.none,
              labelStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: Colors.grey,
              ),
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
          const DotWidget(
            dashColor: Colors.grey,
            dashHeight: 1,
            dashWidth: 5,
          ),
          Row(
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
                      autovalidateMode: AutovalidateMode.always,
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
                            !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                                .hasMatch(value)) {
                          return "Enter Correct Phone Number";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          const DotWidget(
            dashColor: Colors.grey,
            dashHeight: 1,
            dashWidth: 5,
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.always,
            textInputAction: TextInputAction.done,
            decoration: const InputDecoration(
              labelText: 'Địa chỉ * ',
              border: InputBorder.none,
              labelStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
            validator: (value) {
              if (value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                //allow upper and lower case alphabets and space
                return "Enter Correct Address";
              } else {
                return null;
              }
            },
          ),
          const DotWidget(
            dashColor: Colors.grey,
            dashHeight: 1,
            dashWidth: 5,
          ),
          // ElevatedButton(
          //     onPressed: () {
          //       if (formKey.currentState!.validate()) {
          //         //check if form data are valid,
          //         // your process task ahed if all data are valid
          //       }
          //     },
          //     child: Text("Submit Data"))
        ],
      ),
    );
  }
}

class FormValidation2 extends StatelessWidget {
  final formKey2 = GlobalKey<FormState>();
  final String? labelText;
  final String? hintText;
  FormValidation2({super.key, this.labelText, this.hintText}); //key for form
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey2,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            TextFormField(
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Họ *',
                border: InputBorder.none,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
              validator: (value) {
                if (value!.isEmpty ||
                    !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                  //allow upper and lower case alphabets and space
                  return "Enter Correct Name";
                } else {
                  return null;
                }
              },
            ),
            const DotWidget(
              dashColor: Colors.grey,
              dashHeight: 1,
              dashWidth: 5,
            ),
            TextFormField(
              // autovalidateMode: AutovalidateMode.always,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Tên đệm và tên *',
                border: InputBorder.none,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
              validator: (value) {
                if (value!.isEmpty ||
                    !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                  //allow upper and lower case alphabets and space
                  return "Enter Correct Name";
                } else {
                  return null;
                }
              },
            ),
            const DotWidget(
              dashColor: Colors.grey,
              dashHeight: 1,
              dashWidth: 5,
            ),
            const RadioButtonWidget(),
            const DotWidget(
              dashColor: Colors.grey,
              dashHeight: 1,
              dashWidth: 5,
            ),
            TextFormField(
              // autovalidateMode: AutovalidateMode.always,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Email * ',
                border: InputBorder.none,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: Colors.grey,
                ),
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
            const DotWidget(
              dashColor: Colors.grey,
              dashHeight: 1,
              dashWidth: 5,
            ),
            Row(
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
                        // autovalidateMode: AutovalidateMode.always,
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
                              !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                                  .hasMatch(value)) {
                            return "Enter Correct Phone Number";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const DotWidget(
              dashColor: Colors.grey,
              dashHeight: 1,
              dashWidth: 5,
            ),
            TextFormField(
              // autovalidateMode: AutovalidateMode.always,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(
                labelText: 'Địa chỉ * ',
                border: InputBorder.none,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
              validator: (value) {
                if (value!.isEmpty ||
                    !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                  //allow upper and lower case alphabets and space
                  return "Enter Correct Address";
                } else {
                  return null;
                }
              },
            ),
            const DotWidget(
              dashColor: Colors.grey,
              dashHeight: 1,
              dashWidth: 5,
            ),
            TextFormField(
              onTap: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (ctx) {
                      return FractionallySizedBox(
                        heightFactor: 0.9,
                        child: Scaffold(
                          appBar: AppBar(
                            backgroundColor: Colors.white,
                            elevation: 0,
                            leading: Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.close,
                                      color: Colors.black26),
                                  onPressed: () => Navigator.of(context).pop(),
                                ),
                              ],
                            ),
                            title: const Padding(
                              padding: EdgeInsets.fromLTRB(50, 5, 10, 5),
                              child: Text(
                                'Chọn quốc gia',
                                style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          body: Container(
                            height: double.infinity,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              ),
                              color: Colors.white,
                            ),
                            child: const Text('dsadsad'),
                          ),
                        ),
                      );
                    });
              },
              // enabled: false,
              // autovalidateMode: AutovalidateMode.always,
              initialValue: "Việt Nam",
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(
                border: InputBorder.none,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: Colors.grey,
                ),
                labelText: 'Quốc tich',
              ),
              validator: (value) {
                if (value!.isEmpty ||
                    !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                  //allow upper and lower case alphabets and space
                  return "Enter Correct Address";
                } else {
                  return null;
                }
              },
            ),
            const DotWidget(
              dashColor: Colors.grey,
              dashHeight: 1,
              dashWidth: 5,
            ),
            TextFormField(
              onTap: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (ctx) {
                      return FractionallySizedBox(
                        heightFactor: 0.9,
                        child: Scaffold(
                          appBar: AppBar(
                            backgroundColor: Colors.white,
                            elevation: 0,
                            leading: Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.close,
                                      color: Colors.black26),
                                  onPressed: () => Navigator.of(context).pop(),
                                ),
                              ],
                            ),
                            title: const Padding(
                              padding: EdgeInsets.fromLTRB(30, 5, 10, 5),
                              child: Text(
                                'Chọn thành phố/bang',
                                style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          body: Container(
                            height: double.infinity,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              ),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    });
              },
              // autovalidateMode: AutovalidateMode.always,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(
                border: InputBorder.none,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: Colors.grey,
                ),
                labelText: 'Tỉnh/Thành phó *',
              ),
              validator: (value) {
                if (value!.isEmpty ||
                    !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                  //allow upper and lower case alphabets and space
                  return "Enter Correct Address";
                } else {
                  return null;
                }
              },
            ),
            const DotWidget(
              dashColor: Colors.grey,
              dashHeight: 1,
              dashWidth: 5,
            ),

            // ElevatedButton(
            //     onPressed: () {
            //       if (formKey.currentState!.validate()) {
            //         //check if form data are valid,
            //         // your process task ahed if all data are valid
            //       }
            //     },
            //     child: Text("Submit Data"))
          ],
        ),
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

class SingleRadioWidget extends StatefulWidget {
  const SingleRadioWidget({Key? key, this.radioText}) : super(key: key);
  final String? radioText;
  @override
  State<SingleRadioWidget> createState() => _SingleRadioWidgetState();
}

enum SingleChoice { choice, noChoice }

class _SingleRadioWidgetState extends State<SingleRadioWidget> {
  @override
  Widget build(BuildContext context) {
    SingleChoice? singleChoice = SingleChoice.choice;
    return Row(
      children: [
        Radio(
          value: SingleChoice.noChoice,
          groupValue: singleChoice,
          onChanged: (SingleChoice? value) {
            setState(() {
              singleChoice = value;
            });
          },
        ),
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white, // Text Color
          ),
          onPressed: () {
            setState(() {
              singleChoice = SingleChoice.noChoice;
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
