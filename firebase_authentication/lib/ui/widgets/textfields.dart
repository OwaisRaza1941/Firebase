import 'package:flutter/material.dart';

class Textfields extends StatelessWidget {
  final TextEditingController? ctrl;
  final String hintText;
  final Color enabledBorderColor;
  final Color focusedBorderColor;
  final bool isPassword;
  final IconData? icon;
  final VoidCallback? onIconTap;

  const Textfields({
    super.key,
    this.ctrl,
    required this.hintText,
    required this.enabledBorderColor,
    required this.focusedBorderColor,
    this.isPassword = false,
    this.icon,
    this.onIconTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: ctrl,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: isPassword && icon != null
            ? IconButton(onPressed: onIconTap, icon: Icon(icon))
            : null,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: enabledBorderColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: focusedBorderColor),
        ),
      ),
    );
  }
}
