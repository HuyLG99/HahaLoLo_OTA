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
      {super.key, this.labelText, this.hintText, this.listInformation});
  final List<CustomerInformationModel>? listInformation;
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
  bool _isShown = true;
  void _delete(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('Please Confirm'),
            content: const Text('Are you sure to remove the box?'),
            actions: [
              // The "Yes" button
              TextButton(
                  onPressed: () {
                    // Remove the box
                    setState(() {
                      _isShown = false;
                    });

                    // Close the dialog
                    Navigator.of(context).pop();
                  },
                  child: const Text('Yes')),
              TextButton(
                  onPressed: () {
                    // Close the dialog
                    Navigator.of(context).pop();
                  },
                  child: const Text('No'))
            ],
          );
        });
  }

  void loadData() async {
    setState(() {});
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

  void saveData() async {
    setState(() {});
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
      listValueUpdate?.add(textInputValue);
      final resultsJson = textInputValue.toJson();
      final resultsString = jsonEncode(resultsJson);
      prefs.setString('textInput', resultsString);
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
    prefs.remove('listValueUpdate_key');
  }

  void setNullData() async {
    setState(() {});
    formKey2.currentState?.save();
    firstNameController2.text = '';
    lastNameController2.text = '';
    emailController2.text = '';
    phoneController2.text = '';
    addressController2.text = '';
    nationTextEditingController.text = '';
    cityTextEditingController.text = '';
  }

  bool check = false;
  bool saveCheck = false;
  @override
  void initState() {
    super.initState();
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
            text:
                'Sử dụng thông tin người thanh toán hoặc thông tin người liên hệ',
            callback: () {
              setState(() {
                if (widget.listInformation!.isEmpty) {
                  loadData();
                  listValueUpdate = widget.listInformation;
                } else if (widget.listInformation!.isNotEmpty) {
                  setNullData();
                  listValueUpdate = widget.listInformation;
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
                              itemCount: widget.listInformation!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ListTile(
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              '${widget.listInformation![index].firstName ?? ''}'
                                              ' ${widget.listInformation![index].lastName ?? ''}',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
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
                                                              color:
                                                                  Colors.green,
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
                                                                child:
                                                                    ElevatedButton(
                                                                        onPressed:
                                                                            () {
                                                                          // Remove the box
                                                                          setState(
                                                                              () {
                                                                            _isShown =
                                                                                false;
                                                                            listValueUpdate?.removeAt(index);
                                                                            addDataToList();
                                                                          });
                                                                          // Close the dialog
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                        },
                                                                        child: const Text(
                                                                            'Đồng ý')),
                                                              ),
                                                              Center(
                                                                child:
                                                                    ElevatedButton(
                                                                        onPressed:
                                                                            () {
                                                                          // Close the dialog
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                        },
                                                                        child: const Text(
                                                                            'Bỏ qua')),
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
                                      onTap: () {
                                        setState(() {
                                          check = true;
                                          firstNameController2.text = widget
                                                  .listInformation![index]
                                                  .firstName ??
                                              '';
                                          lastNameController2.text = widget
                                                  .listInformation![index]
                                                  .lastName ??
                                              '';
                                          emailController2.text = widget
                                                  .listInformation![index]
                                                  .email ??
                                              '';
                                          phoneController2.text = widget
                                                  .listInformation![index]
                                                  .phone ??
                                              '';
                                          addressController2.text = widget
                                                  .listInformation![index]
                                                  .address ??
                                              '';
                                          nationTextEditingController.text =
                                              widget.listInformation![index]
                                                      .nation ??
                                                  '';
                                          cityTextEditingController.text =
                                              widget.listInformation![index]
                                                      .city ??
                                                  '';
                                        });
                                        Navigator.pop(context);
                                      },
                                    )
                                  ],
                                );
                              }),
                        );
                      });
                }
              });
            },
          ),
          widget.listInformation!.isNotEmpty &&
                  check == true &&
                  firstNameController2.text.isNotEmpty
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
                                      ListTile(
                                        title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                '${widget.listInformation![index].firstName ?? ''} '
                                                '${widget.listInformation![index].lastName ?? ''}',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Expanded(
                                              child: IconButton(
                                                onPressed: () {
                                                  listValueUpdate
                                                      ?.removeAt(index);
                                                  addDataToList();
                                                },
                                                icon: const Icon(
                                                  Icons.delete,
                                                  color: Colors.redAccent,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        onTap: () {
                                          setState(() {
                                            firstNameController2.text = widget
                                                    .listInformation![index]
                                                    .firstName ??
                                                '';
                                            lastNameController2.text = widget
                                                    .listInformation![index]
                                                    .lastName ??
                                                '';
                                            emailController2.text = widget
                                                    .listInformation![index]
                                                    .email ??
                                                '';
                                            phoneController2.text = widget
                                                    .listInformation![index]
                                                    .phone ??
                                                '';
                                            addressController2.text = widget
                                                    .listInformation![index]
                                                    .address ??
                                                '';
                                            nationTextEditingController.text =
                                                widget.listInformation![index]
                                                        .nation ??
                                                    '';
                                            cityTextEditingController.text =
                                                widget.listInformation![index]
                                                        .city ??
                                                    '';
                                          });
                                          Navigator.pop(context);
                                        },
                                      )
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
            // autovalidateMode: AutovalidateMode.always,
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
          TextFormField(
            // autovalidateMode: AutovalidateMode.always,
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
                      // autovalidateMode: AutovalidateMode.always,
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
            // autovalidateMode: AutovalidateMode.always,
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
          AppTextField(
            textEditingController: nationTextEditingController,
            title: 'Quốc tịch *',
            hint: 'Quốc tịch',
            isCitySelected: true,
            cities: _listOfNation,
          ),
          const DotWidget(
            dashColor: Colors.grey,
            dashHeight: 1,
            dashWidth: 5,
          ),
          AppTextField(
            textEditingController: cityTextEditingController,
            title: 'Thành Phố *',
            hint: 'Thành phố',
            isCitySelected: true,
            cities: _listOfCities,
          ),
          const DotWidget(
            dashColor: Colors.grey,
            dashHeight: 1,
            dashWidth: 5,
          ),
          widget.listInformation!.length < 3
              ? CheckboxFormField(
                  text: 'Lưu thông tin thanh toán cho lần sau',
                  callback: () {
                    saveData();
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
  final List<SelectedListItem>? cities;
  AppTextField({
    required this.textEditingController,
    required this.title,
    required this.hint,
    required this.isCitySelected,
    this.cities,
    Key? key,
  }) : super(key: key);

  @override
  AppTextFieldState createState() => AppTextFieldState();
}

class AppTextFieldState extends State<AppTextField> {
  TextEditingController searchTextEditingController = TextEditingController();

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
        selectedItem: (String selected) {
          setState(() {
            widget.textEditingController.text = selected;
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
              return "Enter Correct Address";
            } else {
              return null;
            }
          },
          onSaved: (value) {
            // textInputValue.nation = value;
          },
          onTap: widget.isCitySelected
              ? () {
                  FocusScope.of(context).unfocus();
                  onTextFieldTap();
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
