import 'package:flutter/material.dart';
import 'package:currenseetest/themes/colors.dart';

Widget customDropDown(List<String> items, String value, void Function(String) onChange) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 18.0),
    decoration: BoxDecoration(
      color: AppColors.darkgrey,
      borderRadius: BorderRadius.circular(12.0),
    ),
    child: DropdownButton<String>(
      value: value,
      onChanged: (String? val) {
        if (val != null) {
          onChange(val); // Call the provided callback function
        }
      },
      items: items.map<DropdownMenuItem<String>>((String val) {
        return DropdownMenuItem(
          value: val,
          child: Text(val),
        );
      }).toList(),
    ),
  );
}
