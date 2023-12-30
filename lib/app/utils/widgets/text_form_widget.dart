import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormWidget extends StatelessWidget {
  const TextFormWidget({
    super.key,
    this.onChanged,
    required this.label,
    this.keyboardType,
    this.readOnly = false,
    this.initialValue,
  });

  final void Function(String)? onChanged;
  final String label;
  final TextInputType? keyboardType;
  final bool readOnly;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      autovalidateMode: AutovalidateMode.always,
      onChanged: onChanged,
      // focusNode: FocusScopeNode(canRequestFocus: true),
      inputFormatters: [
        if (keyboardType == TextInputType.number ||
            keyboardType == TextInputType.phone)
          FilteringTextInputFormatter.digitsOnly,
        // LimitRange(5),
      ],
      readOnly: readOnly,
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        label: Text(label),
        // hintText: label,
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
    );
  }
}
