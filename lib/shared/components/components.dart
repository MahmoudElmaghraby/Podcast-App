import 'package:flutter/material.dart';
import 'package:podcast_app/shared/styles/constants.dart';

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(
  context,
  widget,
) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) => false, //To delete all the last screens
    );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  VoidCallback? validate,
  required String label,
  required IconData prefix,
  Function(String)? onSubmit,
  VoidCallback? onChange,
  VoidCallback? suffixPressed,
  VoidCallback? onTap,
  bool isPassword = false,
  IconData? suffix,
  bool isClickable = true,
  bool isReadOnly = false,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      // onChanged: onChange,
      onFieldSubmitted: onSubmit,
      onTap: onTap,
      //validator: validate,
      enabled: isClickable,
      readOnly: isReadOnly,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.teal,
          ),
        ),
        labelText: label,
        prefix: Icon(prefix),
        suffix: IconButton(
          onPressed: suffixPressed,
          icon: Icon(suffix),
        ),
      ),
    );

Widget defaultButton({
  double wid = double.infinity,
  double r = 10.0,
  required String text,
  bool isUpper = true,
  Color back = Colors.blue,
  required VoidCallback? function,
}) =>
    Container(
      width: wid,
      decoration: BoxDecoration(
        color: back,
        borderRadius: BorderRadius.circular(
          r,
        ),
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpper ? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

Widget defaultTextButton({
  required VoidCallback? function,
  required String text,
}) =>
    TextButton(
      onPressed: function,
      child: Text(
        text.toUpperCase(),
      ),
    );

Widget buildMyTextFormField({
  required IconData iconData,
  required String hintText,
  required String labelText,
  required String errorString,
  bool isPassword = false,
  required TextInputType type,
  IconData? suffixIcon,
  VoidCallback? suffixFunction,
}) {
  return TextFormField(
    style: TextStyle(
      color: textColor,
    ),
    keyboardType: type,
    obscureText: isPassword,
    decoration: InputDecoration(
      labelStyle: TextStyle(color: textColor),
      hintStyle: TextStyle(color: deadColor),
      suffixIcon: IconButton(
        onPressed: suffixFunction,
        icon: Icon(
          suffixIcon,
          color: textColor,
        ),
      ),
      icon: Icon(
        iconData,
        color: textColor,
      ),
      hintText: hintText,
      labelText: labelText,
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return errorString;
      }
      return null;
    },
  );
}

/// use this function to create a custom MaterialColor and set it as the primarySwatch
MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}
