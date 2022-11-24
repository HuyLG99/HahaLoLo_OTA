import 'package:flutter/material.dart';

import 'bottom_sheet_search_bar_widget.dart';

/// This is search text field class.
class AppTextField extends StatefulWidget {
  DropDown dropDown;
  Function(String) onTextChanged;
  VoidCallback onClearTap;

  AppTextField(
      {required this.dropDown,
      required this.onTextChanged,
      required this.onClearTap,
      Key? key})
      : super(key: key);

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        controller: widget.dropDown.searchController,
        cursorColor: Colors.black,
        onChanged: (value) {
          widget.onTextChanged(value);
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.dropDown.searchBackgroundColor,
          contentPadding:
              const EdgeInsets.only(left: 0, bottom: 0, top: 0, right: 15),
          hintText: widget.dropDown.searchHintText,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          prefixIcon: const IconButton(
            icon: Icon(Icons.search),
            onPressed: null,
          ),
          suffixIcon: GestureDetector(
            onTap: widget.onClearTap,
            child: const Icon(
              Icons.cancel,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
