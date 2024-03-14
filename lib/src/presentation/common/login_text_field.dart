// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class LoginTextField extends StatefulWidget {
  String hintText;
  void Function(String?) onChanged;
  void Function()? onTap;
  String Function(String?)? validator;
  TextInputType? keyboardType;
  bool? showObscureText;
  LoginTextField({
    super.key,
    this.showObscureText,
    required this.hintText,
    required this.onChanged,
    this.validator,
    this.keyboardType,
    this.onTap,
  });

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  bool obscureText = true;
  late double deviceHeight,deviceWidth;
  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 55,
      width: deviceWidth*0.8,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      child: Center(
        child: Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(30),
          child: TextFormField(
            onChanged: widget.onChanged,
            onTap: widget.onTap,
            keyboardType: widget.keyboardType ?? TextInputType.text,
            validator: widget.validator,
            textAlignVertical: TextAlignVertical.center,
            obscureText:
                (widget.showObscureText ?? false) ? obscureText : false,
            // textAlign: ,

            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              suffixIcon: (widget.showObscureText ?? false)
                  ? GestureDetector(
                      child: (obscureText)
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                      // padding: EdgeInsets.zero,
                      onTap: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                    )
                  : null,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(30),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(30),
              ),
              hintText: widget.hintText,
            ),
          ),
        ),
      ),
    );
  }
}
