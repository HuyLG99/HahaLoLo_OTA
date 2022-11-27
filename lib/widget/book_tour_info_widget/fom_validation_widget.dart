import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/customer_information_model.dart';
import 'infor_input_customer_widget.dart';

class FormValidation extends StatefulWidget {
  const FormValidation({
    super.key,
  });

  @override
  State<FormValidation> createState() => FormValidationState();
}

class FormValidationState extends State<FormValidation> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController(text: 'LE');

  final lastNameController = TextEditingController(text: 'HUY');

  final emailController = TextEditingController(text: 'Lehuy154@gmail.com');

  final phoneController = TextEditingController(text: '03899123139');

  final addressController =
      TextEditingController(text: '4000,Ung Van Khiem,Ho Chi Minh');

  CustomerInformationModel textInputValue = CustomerInformationModel();

  void loadDataForm() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      if (formKey.currentState!.validate()) {
        formKey.currentState?.save();
        prefs.setString('firstName', firstNameController.text ?? '');
        prefs.getString('firstName') ?? '';
        prefs.setString('lastName', lastNameController.text ?? '');
        prefs.getString('lastName') ?? '';
        prefs.setString('email', emailController.text ?? '');
        prefs.getString('email') ?? '';
        prefs.setString('phone', phoneController.text ?? '');
        prefs.getString('phone') ?? '';
        prefs.setString('address', addressController.text ?? '');
        prefs.getString('address') ?? '';
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadDataForm();
  }

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
  }

  //key for form
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: firstNameController,
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
            onSaved: (value) async {
              // textInputValue.firstName = value;
            },
          ),
          const DotWidget(
            dashColor: Colors.grey,
            dashHeight: 1,
            dashWidth: 5,
          ),
          TextFormField(
            controller: lastNameController,
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
            onSaved: (value) {
              // textInputValue.lastName = value;
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
            controller: emailController,
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
            onSaved: (value) {
              // textInputValue.email = value;
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
                      controller: phoneController,
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
                      onSaved: (value) {
                        // textInputValue.phone = value;
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
            controller: addressController,
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
              if (value!.isEmpty) {
                return "Enter Correct Address";
              } else {
                return null;
              }
            },
            onSaved: (value) {
              // textInputValue.address = value;
            },
          ),
          const DotWidget(
            dashColor: Colors.grey,
            dashHeight: 1,
            dashWidth: 5,
          ),
          // ElevatedButton(
          //   onPressed: () async {
          //     final SharedPreferences prefs = await _prefs;
          //     setState(() {
          //       if (formKey.currentState!.validate()) {
          //         formKey.currentState?.save();
          //         prefs.setString('firstName', textInputValue.firstName ?? '');
          //         prefs.getString('firstName') ?? '';
          //         prefs.setString('lastName', textInputValue.lastName ?? '');
          //         prefs.getString('lastName') ?? '';
          //         prefs.setString('email', textInputValue.email ?? '');
          //         prefs.getString('email') ?? '';
          //         prefs.setString('phone', textInputValue.phone ?? '');
          //         prefs.getString('phone') ?? '';
          //         prefs.setString('address', textInputValue.address ?? '');
          //         prefs.getString('address') ?? '';
          //       }
          //     });
          //   },
          //   child: const Text("Submit Data"),
          // ),
        ],
      ),
    );
  }
}
