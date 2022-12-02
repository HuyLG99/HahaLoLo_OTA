import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hahaloloapp/models/customer_information_model.dart';
import 'package:hahaloloapp/widget/book_tour_info_widget/single_radio_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/constants.dart';

import 'dropdown_search_widget/bottom_sheet_search_bar_widget.dart';

import 'infor_input_customer_widget.dart';

class FormValidation2 extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  const FormValidation2(
      {super.key,
      this.labelText,
      this.hintText,
      this.listInformation,
      this.isValidateActive});
  final List<CustomerInformationModel>? listInformation;
  final bool? isValidateActive;
  @override
  State<FormValidation2> createState() => FormValidation2State();
}

class FormValidation2State extends State<FormValidation2> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final formKey2 = GlobalKey<FormState>();
  final firstNameController2 = TextEditingController();
  final lastNameController2 = TextEditingController();
  final emailController2 = TextEditingController();
  final phoneController2 = TextEditingController();
  final addressController2 = TextEditingController();
  final TextEditingController nationTextEditingController =
      TextEditingController();
  final TextEditingController cityTextEditingController =
      TextEditingController();

  List<CustomerInformationModel>? listValueUpdate;

  void loadData() async {
    setState(() {
      check = true;
    });
    final SharedPreferences prefs = await _prefs;
    formKey2.currentState?.save();
    firstNameController2.text = prefs.getString('firstName') ?? '';
    lastNameController2.text = prefs.getString('lastName') ?? '';
    emailController2.text = prefs.getString('email') ?? '';
    phoneController2.text = prefs.getString('phone') ?? '';
    addressController2.text = prefs.getString('address') ?? '';
    nationTextEditingController.text = prefs.getString('nation') ?? '';
    cityTextEditingController.text = prefs.getString('city') ?? '';
  }

  void loadDataForm2() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      if (formKey2.currentState!.validate()) {
        formKey2.currentState?.save();
        prefs.setString('firstName2', firstNameController2.text ?? '');
        // prefs.getString('firstName') ?? '';
        prefs.setString('lastName2', lastNameController2.text ?? '');
        // prefs.getString('lastName') ?? '';
        prefs.setString('email2', emailController2.text ?? '');
        // prefs.getString('email') ?? '';
        prefs.setString('phone2', phoneController2.text ?? '');
        // prefs.getString('phone') ?? '';
        prefs.setString('address2', addressController2.text ?? '');
        // prefs.getString('address') ?? '';
      }
    });
  }

  void onTapSetData(int index) {
    setState(() {
      check = true;
      saveCheck = false;
      isActiveCheckBox = true;
      firstNameController2.text =
          widget.listInformation![index].firstName ?? '';
      lastNameController2.text = widget.listInformation![index].lastName ?? '';
      emailController2.text = widget.listInformation![index].email ?? '';
      phoneController2.text = widget.listInformation![index].phone ?? '';
      addressController2.text = widget.listInformation![index].address ?? '';
      nationTextEditingController.text =
          widget.listInformation![index].nation ?? '';
      cityTextEditingController.text =
          widget.listInformation![index].city ?? '';
      saveData();
    });
  }

  void saveData() async {
    setState(() {
      // isValidateActive = true;
    });
    final SharedPreferences prefs = await _prefs;
    if (formKey2.currentState!.validate()) {
      formKey2.currentState?.save();
      CustomerInformationModel textInputValue = CustomerInformationModel(
        firstName: firstNameController2.text,
        lastName: lastNameController2.text,
        email: emailController2.text,
        phone: phoneController2.text,
        address: addressController2.text,
        nation: nationTextEditingController.text,
        city: cityTextEditingController.text,
      );
      // listValueUpdate?.add(textInputValue);
      final resultsJson = textInputValue.toJson();
      final resultsString = jsonEncode(resultsJson);
      prefs.setString('textInput', resultsString);
      prefs.setString('nation2', nationTextEditingController.text);
      prefs.setString('city2', cityTextEditingController.text);

      // final resultDataString = prefs.getString('textInput') ?? '';
      // final resultEndCode = jsonDecode(resultDataString);
      // final resutlObject = CustomerInformationModel.fromJson(resultEndCode);
      // listInformation.add(firstNameController2.text + lastNameController2.text);
    }
  }

  void addDataToList() async {
    final SharedPreferences prefs = await _prefs;
    final String encodedData =
        CustomerInformationModel.encode(listValueUpdate!);
    await prefs.setString('listValueUpdate_key', encodedData);
  }

  void removeKeyValue() async {
    final SharedPreferences prefs = await _prefs;
    prefs.remove('textInput');
  }

  void setNullData() async {
    setState(() {
      if (widget.listInformation!.isEmpty) {
        setState(() {
          check = false;
          saveCheck = false;
          isActiveCheckBox = saveCheck;
          removeKeyValue();
        });
      }
    });
    formKey2.currentState?.save();
    firstNameController2.text = '';
    lastNameController2.text = '';
    emailController2.text = '';
    phoneController2.text = '';
    addressController2.text = '';
    nationTextEditingController.text = '';
    cityTextEditingController.text = '';
  }

  void getCheckUse() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      check = prefs.getBool('checkChoose_key')!;
    });
  }

  // void setCheckUse() async {
  //   final SharedPreferences prefs = await _prefs;
  //   setState(() {
  //     isValidateActive = prefs.setBool('onValidate_key', isValidateActive);
  //   });
  // }
  Future scrollItem() async {
    final context = formKey2.currentContext!;
    await Scrollable.ensureVisible(
      context,
      curve: Curves.ease,
      duration: const Duration(seconds: 1),
    );
  }

  void deleteItem(int index) {
    setState(() {
      listValueUpdate?.removeAt(index);
      addDataToList();
      setNullData();
      saveCheck = false;
      check = false;
    });
  }

  void setCheckFirstNameNull2(bool value, String firstName2) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool('checkFirstNameValidate2_key', value);
    prefs.setString('firstName2', firstName2 ?? '');
  }

  void setCheckLastNameNull2(bool value, String lastName2) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool('checkLastNameValidate2_key', value);
    prefs.setString('lastName2', lastName2 ?? '');
  }

  void setCheckEmailNull2(bool value, String email2) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool('checkEmailValidate2_key', value);
    prefs.setString('email2', email2 ?? '');
  }

  void setCheckPhoneNull2(bool value, String phone2) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool('checkPhoneValidate2_key', value);
    prefs.setString('phone2', phone2 ?? '');
  }

  void setCheckAddressNull2(bool value, String address2) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool('checkAddressValidate2_key', value);
    prefs.setString('address2', address2 ?? '');
  }

  bool check = false;
  bool saveCheck = false;
  bool isActiveCheckBox = false;
  @override
  void initState() {
    super.initState();
    addDataToList();
    setNullData();
    setState(() {
      check = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
    firstNameController2.dispose();
    lastNameController2.dispose();
    emailController2.dispose();
    phoneController2.dispose();
    addressController2.dispose();
    cityTextEditingController.dispose();
    nationTextEditingController.dispose();
  }

  //key for form
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey2,
      child: Column(
        children: [
          CheckboxFormField(
            checkboxValue: check,
            text:
                'Sử dụng thông tin người thanh toán hoặc thông tin người liên hệ',
            callback: () {
              setState(() {
                if (widget.listInformation!.isEmpty) {
                  check == true ? setNullData() : loadData();
                  listValueUpdate = widget.listInformation;
                } else if (widget.listInformation!.isNotEmpty) {
                  setState(() {
                    check = false;
                    isActiveCheckBox = false;
                  });
                  setNullData();
                  listValueUpdate = widget.listInformation;

                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(builder:
                            (BuildContext context, StateSetter setState) {
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.25,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40.0),
                                topRight: Radius.circular(40.0),
                              ),
                            ),
                            child: ListView.builder(
                                itemCount: widget.listInformation!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          onTapSetData(index);
                                          Navigator.pop(context);
                                        },
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 12),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: Text(
                                                  '${widget.listInformation![index].firstName ?? ''}'
                                                  ' ${widget.listInformation![index].lastName ?? ''}',
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Expanded(
                                                child: IconButton(
                                                  onPressed: () {
                                                    showDialog(
                                                        context: context,
                                                        builder:
                                                            (BuildContext ctx) {
                                                          return AlertDialog(
                                                            title: Column(
                                                              children: const [
                                                                Icon(
                                                                  Icons.cancel,
                                                                  color: Colors
                                                                      .green,
                                                                ),
                                                                Text(
                                                                    'Xóa tài khoản thanh toán'),
                                                                Divider(
                                                                  thickness: 2,
                                                                ),
                                                              ],
                                                            ),
                                                            content: SizedBox(
                                                              width: 50,
                                                              height: 150,
                                                              child: Column(
                                                                children: const [
                                                                  Text(
                                                                      'Bạn có chắc muốn xóa tài khoản thanh toán này?\n'
                                                                      '\nTài khoản sẽ không xuất hiện trong mục tài khoản thanh toán nữa'),
                                                                ],
                                                              ),
                                                            ),
                                                            actions: [
                                                              // The "Yes" button
                                                              Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Center(
                                                                    child: ElevatedButton(
                                                                        onPressed: () {
                                                                          // Remove the box
                                                                          setState(
                                                                              () {
                                                                            deleteItem(index);
                                                                          });
                                                                          // Close the dialog

                                                                          Navigator.of(context)
                                                                              .pop();
                                                                        },
                                                                        child: const Text('Đồng ý')),
                                                                  ),
                                                                  Center(
                                                                    child: ElevatedButton(
                                                                        onPressed: () {
                                                                          // Close the dialog
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                        },
                                                                        child: const Text('Bỏ qua')),
                                                                  )
                                                                ],
                                                              ),
                                                            ],
                                                          );
                                                        });

                                                    // removeKeyValue();
                                                  },
                                                  icon: const Icon(
                                                    Icons.delete,
                                                    color: Colors.redAccent,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                          );
                        });
                      });
                }
              });
            },
          ),
          firstNameController2.text.isNotEmpty &&
                  widget.listInformation!.isNotEmpty
              ? GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.25,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40.0),
                                topRight: Radius.circular(40.0),
                              ),
                            ),
                            child: ListView.builder(
                                itemCount: widget.listInformation?.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          onTapSetData(index);

                                          Navigator.pop(context);
                                        },
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 12),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  '${widget.listInformation![index].firstName ?? ''} '
                                                  '${widget.listInformation![index].lastName ?? ''}',
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Expanded(
                                                child: IconButton(
                                                  onPressed: () {
                                                    showDialog(
                                                        context: context,
                                                        builder:
                                                            (BuildContext ctx) {
                                                          return AlertDialog(
                                                            title: Column(
                                                              children: const [
                                                                Icon(
                                                                  Icons.cancel,
                                                                  color: Colors
                                                                      .green,
                                                                ),
                                                                Text(
                                                                    'Xóa tài khoản thanh toán'),
                                                                Divider(
                                                                  thickness: 2,
                                                                ),
                                                              ],
                                                            ),
                                                            content: SizedBox(
                                                              width: 50,
                                                              height: 150,
                                                              child: Column(
                                                                children: const [
                                                                  Text(
                                                                      'Bạn có chắc muốn xóa tài khoản thanh toán này?\n'
                                                                      '\nTài khoản sẽ không xuất hiện trong mục tài khoản thanh toán nữa'),
                                                                ],
                                                              ),
                                                            ),
                                                            actions: [
                                                              // The "Yes" button
                                                              Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Center(
                                                                    child: ElevatedButton(
                                                                        onPressed: () {
                                                                          // Remove the box
                                                                          setState(
                                                                              () {
                                                                            deleteItem(index);
                                                                          });

                                                                          // Close the dialog
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                        },
                                                                        child: const Text('Đồng ý')),
                                                                  ),
                                                                  Center(
                                                                    child: ElevatedButton(
                                                                        onPressed: () {
                                                                          // Close the dialog
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                        },
                                                                        child: const Text('Bỏ qua')),
                                                                  )
                                                                ],
                                                              ),
                                                            ],
                                                          );
                                                        });
                                                  },
                                                  icon: const Icon(
                                                    Icons.delete,
                                                    color: Colors.redAccent,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                          );
                        });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    width: 150,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(color: Colors.blue),
                    ),
                    child: firstNameController2.text.isEmpty
                        ? const Text('')
                        : Center(
                            child: Text(
                            firstNameController2.text +
                                lastNameController2.text,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )),
                  ),
                )
              : const SizedBox(),
          TextFormField(
            autovalidateMode: widget.isValidateActive == false
                ? null
                : AutovalidateMode.always,
            textInputAction: TextInputAction.next,
            controller: firstNameController2,
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
                scrollItem();
                firstNameController2.text = value ?? '';
                setCheckFirstNameNull2(true, value);
                return "Enter Correct Name";
              } else {
                setCheckFirstNameNull2(false, value);
                return null;
              }
            },
            onChanged: (value) async {
              final SharedPreferences prefs = await _prefs;
              setState(() {
                isActiveCheckBox = false;
                prefs.setString('firstName2', firstNameController2.text ?? '');
              });
            },
            onSaved: (value) async {
              firstNameController2.text = value ?? '';
              final SharedPreferences prefs = await _prefs;
              setState(() {
                // isActiveCheckBox = false;
                prefs.setString('firstName2', firstNameController2.text ?? '');
              });
            },
          ),
          const DotWidget(
            dashColor: Colors.grey,
            dashHeight: 1,
            dashWidth: 5,
          ),
          TextFormField(
            autovalidateMode: widget.isValidateActive == false
                ? null
                : AutovalidateMode.always,
            controller: lastNameController2,
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
                scrollItem();
                setCheckLastNameNull2(true, value);
                return "Enter Correct Name";
              } else {
                setCheckLastNameNull2(false, value);
                return null;
              }
            },
            onChanged: (value) async {
              final SharedPreferences prefs = await _prefs;
              setState(() {
                isActiveCheckBox = false;
                prefs.setString('lastName2', lastNameController2.text ?? '');
              });
            },
            onSaved: (value) async {
              lastNameController2.text = value!;
              final SharedPreferences prefs = await _prefs;
              setState(() {
                prefs.setString('lastName2', lastNameController2.text ?? '');
              });
            },
          ),
          const DotWidget(
            dashColor: Colors.grey,
            dashHeight: 1,
            dashWidth: 5,
          ),
          TextFormField(
            autovalidateMode: widget.isValidateActive == false
                ? null
                : AutovalidateMode.always,
            controller: emailController2,
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
                scrollItem();
                setCheckEmailNull2(true, value);
                return "Enter Correct Email Address";
              } else {
                setCheckEmailNull2(false, value);
                return null;
              }
            },
            onChanged: (value) async {
              final SharedPreferences prefs = await _prefs;
              setState(() {
                isActiveCheckBox = false;
                prefs.setString('email2', emailController2.text ?? '');
              });
            },
            onSaved: (value) async {
              emailController2.text = value!;
              final SharedPreferences prefs = await _prefs;
              setState(() {
                prefs.setString('email2', emailController2.text ?? '');
              });
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
                      autovalidateMode: widget.isValidateActive == false
                          ? null
                          : AutovalidateMode.always,
                      controller: phoneController2,
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
                          scrollItem();
                          setCheckPhoneNull2(true, value);
                          return "Enter Correct Phone Number";
                        } else {
                          setCheckPhoneNull2(false, value);
                          return null;
                        }
                      },
                      onChanged: (value) async {
                        final SharedPreferences prefs = await _prefs;
                        setState(() {
                          // isActiveCheckBox = false;
                          prefs.setString(
                              'phone2', phoneController2.text ?? '');
                        });
                      },
                      onSaved: (value) async {
                        phoneController2.text = value!;
                        final SharedPreferences prefs = await _prefs;
                        setState(() {
                          prefs.setString(
                              'phone2', phoneController2.text ?? '');
                        });
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
            autovalidateMode: widget.isValidateActive == false
                ? null
                : AutovalidateMode.always,
            controller: addressController2,
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
                //allow upper and lower case alphabets and space
                scrollItem();
                setCheckAddressNull2(true, value);
                return "Enter Correct Address";
              } else {
                setCheckAddressNull2(false, value);
                return null;
              }
            },
            onChanged: (value) async {
              final SharedPreferences prefs = await _prefs;
              setState(() {
                // isActiveCheckBox = false;
                prefs.setString('address2', addressController2.text ?? '');
              });
            },
            onSaved: (value) async {
              addressController2.text = value!;
              final SharedPreferences prefs = await _prefs;
              setState(() {
                prefs.setString('address2', addressController2.text ?? '');
              });
            },
          ),
          const DotWidget(
            dashColor: Colors.grey,
            dashHeight: 1,
            dashWidth: 5,
          ),
          AppTextField(
            textEditingController: nationTextEditingController,
            title: 'Quốc tịch *',
            hint: 'Quốc tịch',
            isCitySelected: true,
            cities: _listOfNation,
            isValidateActive: widget.isValidateActive ?? false,
          ),
          const DotWidget(
            dashColor: Colors.grey,
            dashHeight: 1,
            dashWidth: 5,
          ),
          AppTextCityField(
            textEditingController: cityTextEditingController,
            title: 'Thành Phố *',
            hint: 'Thành phố',
            isCitySelected: true,
            cities: _listOfCities,
            isValidateActive: widget.isValidateActive ?? false,
          ),
          const DotWidget(
            dashColor: Colors.grey,
            dashHeight: 1,
            dashWidth: 5,
          ),
          // widget.listInformation!.length < 3
          //     ?
          isActiveCheckBox == false
              ? CheckboxSaveUseAfter(
                  checkboxValue: saveCheck,
                  text: 'Lưu thông tin thanh toán cho lần sau',
                  callback: () {
                    setState(() {});
                    saveCheck = !saveCheck;
                    saveCheck == false ? null : saveData();
                    // addDataToList();
                  },
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

//ignore: must_be_immutable
class AppTextField extends StatefulWidget {
  TextEditingController textEditingController = TextEditingController();
  final String title;
  final String hint;
  final bool isCitySelected;

  final bool isValidateActive;
  final List<SelectedListItem>? cities;
  AppTextField({
    required this.textEditingController,
    required this.title,
    required this.hint,
    required this.isCitySelected,
    this.cities,
    required this.isValidateActive,
    Key? key,
  }) : super(key: key);

  @override
  AppTextFieldState createState() => AppTextFieldState();
}

class AppTextFieldState extends State<AppTextField> {
  TextEditingController searchTextEditingController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  /// This is on text changed method which will display on city text field on changed.
  void onTextFieldTap() {
    DropDownState(
      DropDown(
        submitButtonColor: const Color.fromRGBO(70, 76, 222, 1),
        searchHintText: "Quốc gia...",
        bottomSheetTitle: 'Quốc gia',
        searchBackgroundColor: Colors.black12,
        dataList: widget.cities ?? [],
        selectedItems: (List<dynamic> selectedList) {},
        selectedItem: (String selected) async {
          final SharedPreferences prefs = await _prefs;
          setState(() {
            widget.textEditingController.text = selected;
            prefs.setString('nation2', selected);
          });
        },
        enableMultipleSelection: false,
        searchController: searchTextEditingController,
      ),
    ).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          autovalidateMode:
              widget.isValidateActive == false ? null : AutovalidateMode.always,
          controller: widget.textEditingController,
          decoration: InputDecoration(
            labelText: widget.title,
            border: InputBorder.none,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: Colors.grey,
            ),
          ),
          validator: (value) {
            if (value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
              //allow upper and lower case alphabets and space
              return "Enter Correct Nation";
            } else {
              return null;
            }
          },
          onSaved: (value) {
            // textInputValue.nation = value;
          },
          onChanged: (value) async {
            final SharedPreferences prefs = await _prefs;
            setState(() {
              prefs.setString(
                  'nation2', widget.textEditingController.text ?? '');
            });
          },
          onTap: widget.isCitySelected
              ? () async {
                  FocusScope.of(context).unfocus();
                  onTextFieldTap();
                  final SharedPreferences prefs = await _prefs;
                  setState(() {
                    prefs.setString(
                        'nation2', widget.textEditingController.text ?? '');
                  });
                }
              : null,
        ),
      ],
    );
  }
}

//ignore: must_be_immutable
class AppTextCityField extends StatefulWidget {
  TextEditingController textEditingController = TextEditingController();
  final String title;
  final String hint;
  final bool isCitySelected;

  final bool isValidateActive;
  final List<SelectedListItem>? cities;
  AppTextCityField({
    required this.textEditingController,
    required this.title,
    required this.hint,
    required this.isCitySelected,
    this.cities,
    required this.isValidateActive,
    Key? key,
  }) : super(key: key);

  @override
  AppTextCityFieldState createState() => AppTextCityFieldState();
}

class AppTextCityFieldState extends State<AppTextCityField> {
  TextEditingController searchTextEditingController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  /// This is on text changed method which will display on city text field on changed.
  void onTextFieldTap() {
    DropDownState(
      DropDown(
        submitButtonColor: const Color.fromRGBO(70, 76, 222, 1),
        searchHintText: "Thành phố...",
        bottomSheetTitle: 'Thành phố',
        searchBackgroundColor: Colors.black12,
        dataList: widget.cities ?? [],
        selectedItems: (List<dynamic> selectedList) {},
        selectedItem: (String selected) async {
          final SharedPreferences prefs = await _prefs;
          setState(() {
            widget.textEditingController.text = selected;
            prefs.setString('city2', selected);
          });
        },
        enableMultipleSelection: false,
        searchController: searchTextEditingController,
      ),
    ).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          autovalidateMode:
              widget.isValidateActive == false ? null : AutovalidateMode.always,
          controller: widget.textEditingController,
          decoration: InputDecoration(
            labelText: widget.title,
            border: InputBorder.none,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: Colors.grey,
            ),
          ),
          validator: (value) {
            if (value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
              //allow upper and lower case alphabets and space
              return "Enter Correct Nation";
            } else {
              return null;
            }
          },
          onSaved: (value) {
            // textInputValue.nation = value;
          },
          onChanged: (value) async {
            final SharedPreferences prefs = await _prefs;
            setState(() {
              prefs.setString('city2', widget.textEditingController.text ?? '');
            });
          },
          onTap: widget.isCitySelected
              ? () async {
                  FocusScope.of(context).unfocus();
                  onTextFieldTap();
                  final SharedPreferences prefs = await _prefs;
                  setState(() {
                    prefs.setString(
                        'nation2', widget.textEditingController.text ?? '');
                  });
                }
              : null,
        ),
      ],
    );
  }
}

final List<SelectedListItem> _listOfNation = [
  SelectedListItem(false, kTokyo),
  SelectedListItem(false, kNewYork),
  SelectedListItem(false, kLondon),
  SelectedListItem(false, kParis),
  SelectedListItem(false, kMadrid),
  SelectedListItem(false, kDubai),
  SelectedListItem(false, kRome),
  SelectedListItem(false, kBarcelona),
  SelectedListItem(false, kCologne),
  SelectedListItem(false, kMonteCarlo),
  SelectedListItem(false, kPuebla),
  SelectedListItem(false, kFlorence),
];
final List<SelectedListItem> _listOfCities = [
  SelectedListItem(false, kTokyo, value: "TYO"),
  SelectedListItem(false, kNewYork, value: "NY"),
  SelectedListItem(false, kLondon, value: "LDN"),
  SelectedListItem(false, kParis, value: "PR"),
  SelectedListItem(false, kMadrid, value: "MAD"),
  SelectedListItem(false, kDubai, value: "DB"),
  SelectedListItem(false, kRome, value: "RM"),
  SelectedListItem(false, kBarcelona, value: "BL"),
  SelectedListItem(false, kCologne, value: "COLO"),
  SelectedListItem(false, kMonteCarlo, value: "MC"),
  SelectedListItem(false, kPuebla, value: "PL"),
  SelectedListItem(false, kFlorence, value: "FLC"),
];
