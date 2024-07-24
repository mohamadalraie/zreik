import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/my_colors.dart';
import '../../constants/strings.dart';

Widget MyDropButton(
    {required List<String> items,
    required String? selectedValue,
    required void Function(String? value) onChange}) {
  return Expanded(
    child: DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        hint: const Text(
          "اختر محافظة",
          style: TextStyle(
              color: MyColors.myYellow,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: "cairo"),
        ),
        isExpanded: true,
        items: items
            .map(
              (String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                        color: MyColors.myYellow,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: "cairo"),
                  )),
            )
            .toList(),
        value: selectedValue,
        onChanged: onChange,
        buttonStyleData: ButtonStyleData(
          height: 50,
          padding: const EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: Colors.black26,
            ),
            color: MyColors.myGrey,
          ),
          elevation: 2,
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_forward_ios_outlined,
            color: MyColors.myYellow,
          ),
          iconSize: 14,
          iconEnabledColor: MyColors.myYellow,
          iconDisabledColor: Colors.grey,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: MyColors.myGrey,
          ),
          offset: const Offset(-20, 0),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: WidgetStateProperty.all<double>(6),
            thumbVisibility: WidgetStateProperty.all<bool>(true),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    ),
  );
}
