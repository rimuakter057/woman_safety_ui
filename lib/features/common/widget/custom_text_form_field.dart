import 'package:flutter/material.dart';

import '../../../../app/utils/text/text_style.dart';




class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller, required this.hintText,
    this.keyboardType, this.validator, this.onChanged,
  });

  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppTextStyles.inputTextStyle(context),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,


    );
  }
}