import 'package:flutter/material.dart';

Widget defultText({
  required String text,
  int? maxLines,
  TextOverflow? textOverflow,
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
  bool isUpperCase = false,
}) =>
    Text(
      isUpperCase ? text.toUpperCase() : text,
      maxLines: maxLines,
      overflow: textOverflow,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );

void navigateTo(BuildContext context, Widget widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateToAndRemoveAll(BuildContext context, Widget widget) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (route) => false,
    );

Widget defultTextButton({
  required Function onPressed,
  required String text,
  int? maxLines,
  TextOverflow? textOverflow,
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
  bool isUpperCase = false,
}) =>
    TextButton(
      onPressed: () {
        onPressed();
      },
      child: defultText(
        text: text,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        maxLines: maxLines,
        textOverflow: textOverflow,
      ),
    );

Widget defultTextFormField({
  required TextEditingController controller,
  Function? onChanged,
  Function? onFieldSubmitted,
  bool obscureText = false,
  TextInputType? textInputType,
  String? labelText,
  required String validText,
  String? hintText,
  IconData? prefixIcon,
  IconData? suffixIcon,
  Function? suffixIconOnPressed,
  double border = 15,
}) =>
    TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: (value) {
        if (value!.isEmpty) {
          return validText;
        }
        return null;
      },
      keyboardType: textInputType,
      decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          prefixIcon: Icon(
            prefixIcon,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              suffixIconOnPressed!();
            },
            icon: Icon(
              suffixIcon,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(border),
          )),
    );

Widget defultMaterialButton({
  required Function onPressed,
  double width = double.infinity,
  Color? color,
  Color? backgroundColor,
  double border = 15,
  required String text,
  int? maxLines,
  TextOverflow? textOverflow,
  double? fontSize,
  FontWeight? fontWeight,
  bool isUpperCase = false,
}) =>
    Container(
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(border),
      ),
      child: MaterialButton(
        onPressed: () {
          onPressed();
        },
        child: defultText(
          text: text,
          isUpperCase: isUpperCase,
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ),
      ),
    );
