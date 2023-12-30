import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class DateTimePickerWidget extends StatelessWidget {
  final Color? iconColor;
  final TextEditingController? controller;
  final void Function(DateTime?)? onSaved;
  final void Function(DateTime?)? onChanged;
  final String? hintText;
  final TextStyle? style;
  final String? Function(DateTime?)? validate;

  DateTimePickerWidget({
    Key? key,
    this.iconColor,
    this.controller,
    required this.onChanged,
    this.hintText,
    this.style,
    this.validate,
    this.onSaved,
  }) : super(key: key);

  final format = DateFormat("yyyy-MM-dd");

  @override
  Widget build(BuildContext context) {
    return DateTimeField(
      key: UniqueKey(),
      style: style,
      textAlign: TextAlign.start,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onSaved: onSaved,
      validator: validate,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        contentPadding: const EdgeInsets.all(20),
        hintText: hintText,
        // hintStyle: Styles.hintStyle,
        suffixIcon: Container(
          margin: const EdgeInsets.only(right: 20),
          child: const Icon(
            Icons.date_range,
            color: Colors.green,
          ),
        ),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(10),
        //   borderSide: const BorderSide(
        //     color: Colors.black,
        //   ),
        // ),
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(10),
        //   borderSide: const BorderSide(
        //     color: Colors.black,
        //   ),
        // ),
        // errorBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(10),
        //   borderSide: const BorderSide(
        //     color: Colors.red,
        //   ),
        // ),
      ),
      format: format,
      controller: controller,
      onChanged: onChanged,
      onShowPicker: (context, currentValue) {
        return showDatePicker(
            context: context,
            firstDate: DateTime(1900),
            initialDate: currentValue ?? DateTime.now(),
            lastDate: DateTime(2100));
      },
    );
  }
}
