import 'package:flutter/material.dart';
import 'package:hahaloloapp/models/customer_information_model.dart';
import 'package:hahaloloapp/widget/book_tour_info_widget/single_radio_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
import 'dropdown_search_widget/bottom_sheet_search_bar_widget.dart';

import 'infor_input_customer_widget.dart';

CustomerInformationModel textInputValue = CustomerInformationModel();

class FormValidation2 extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  const FormValidation2({super.key, this.labelText, this.hintText});

  @override
  State<FormValidation2> createState() => FormValidation2State();
}

class FormValidation2State extends State<FormValidation2> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
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

  CustomerInformationModel textInputValue = CustomerInformationModel();

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

  void loadData() async {
    setState(() {});
    final SharedPreferences prefs = await _prefs;
    firstNameController2.text = prefs.getString('firstName') ?? '';
    lastNameController2.text = prefs.getString('lastName') ?? '';
    emailController2.text = prefs.getString('email') ?? '';
    phoneController2.text = prefs.getString('phone') ?? '';
    addressController2.text = prefs.getString('address') ?? '';

    // prefs.remove('firstName');
  }

  void unLoadData() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      prefs.remove('firstName');
      prefs.setString('firstName', '');
      prefs.remove('lastName');
      prefs.setString('lastName', '');
      prefs.remove('email');
      prefs.setString('email', '');
      prefs.remove('phone');
      prefs.setString('phone', '');
      prefs.remove('address');
      prefs.setString('address', '');
    });
  }

  bool check = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // unLoadData();
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
          const SingleRadioWidget(
            radioText: 'Sử dụng thông tin người liên hệ',
          ),
          TextFormField(
            textInputAction: TextInputAction.next,
            controller: check == true ? null : firstNameController2,
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
              textInputValue.firstName = value;
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
              textInputValue.lastName = value;
            },
          ),
          const DotWidget(
            dashColor: Colors.grey,
            dashHeight: 1,
            dashWidth: 5,
          ),
          // const RadioButtonWidget(),
          // const DotWidget(
          //   dashColor: Colors.grey,
          //   dashHeight: 1,
          //   dashWidth: 5,
          // ),
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
              textInputValue.email = value;
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
                        textInputValue.phone = value;
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
              textInputValue.address = value;
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
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 30.0,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  check = !check;
                });
                loadData();
                if (formKey2.currentState!.validate()) {
                  // prefs.remove('firstName');
                  loadData();
                  // unLoadData();
                  formKey2.currentState?.save();

                  textInputValue.nation = nationTextEditingController.text;
                  textInputValue.city = cityTextEditingController.text;
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(70, 76, 222, 1),
                textStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              child: const Text('Submit Data'),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: SingleRadioWidget(
              radioText: 'Lưu thông tin thanh toán cho lần sau',
            ),
          ),
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
            textInputValue.nation = value;
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
