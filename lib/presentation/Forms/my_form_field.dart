import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomFormField extends StatefulWidget {
  CustomFormField({
    Key? key,
    required this.controller,
    required this.lableText,
    this.iconssuffix,
    required this.prefixIcon,
    required this.obscureText,
    required this.inputType,
    this.maxlength,
    this.prefixtext,
    this.suffixicon,
    required this.formkey,
    this.validator,
    this.length,
    this.textCap,
  }) : super(key: key);

  final String lableText;
  final TextEditingController controller;
  Widget? iconssuffix;
  IconData? prefixIcon;
  bool obscureText;
  final TextInputType inputType;
  final int? maxlength;
  final String? prefixtext;
  int? length;

  Widget? suffixicon;
  final String? Function(String?)? validator;
  GlobalKey<FormState> formkey;
  final double borderR = 8;

  final TextCapitalization? textCap;

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    const double borderR = 8;

    return TextFormField(
      textCapitalization: widget.textCap ?? TextCapitalization.words,
      style: const TextStyle(
        fontSize: 12,
      ),
      maxLength: widget.length ?? 50,
      keyboardType: widget.inputType,
      validator: widget.validator,
      controller: widget.controller,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        fillColor: Colors.grey[200],
        filled: true,
        counterText: "",
        // prefixText: widget.prefixtext,
        enabled: true,
        isDense: true,
        contentPadding: const EdgeInsets.all(10),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderR),
          borderSide: BorderSide(
            color: Colors.red[700]!,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderR),
          borderSide: BorderSide(
            color: Colors.red[700]!,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderR),
          borderSide: BorderSide(
            color: Colors.grey[200]!,
            width: 0.1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderR),
          borderSide: BorderSide(
            color: Colors.grey[200]!,
            width: 0.00000001,
          ),
        ),
        prefixIcon: Icon(
          widget.prefixIcon,
          color: Colors.grey[400],
          size: 18,
        ),
        suffixIcon: widget.suffixicon,

        // suffix: widget.iconssuffix,
        hintText: widget.lableText,
        // labelText: widget.lableText,
        errorStyle: TextStyle(
          color: Colors.red[700],
          fontSize: 9,
        ),
        hintStyle: TextStyle(
          color: Colors.grey[400],
          fontSize: 12,
        ),
      ),
    );
  }
}
