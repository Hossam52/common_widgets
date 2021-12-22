import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  const DefaultTextFormField(
      {Key? key,
      required this.controller,
      required this.hint,
      this.maxLines,
      this.icon,
      this.validator,
      this.isPassword = false,
      this.defaultValidator,
      this.type = TextInputType.text,
      this.valueKey,
      this.width,
      this.backgroundColor})
      : super(key: key);
  final TextEditingController controller;
  final String hint;
  final int? maxLines;
  final Widget? icon;
  final bool isPassword;
  final String? Function(String?)? validator;
  final String? defaultValidator;
  final TextInputType type;
  final ValueKey? valueKey;
  final double? width;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(
            10,
          ),
          border:
              Border.all(color: Theme.of(context).primaryColor, width: 0.1)),
      child: TextFormField(
        maxLines: isPassword ? 1 : maxLines,
        controller: controller,
        style: Theme.of(context).textTheme.bodyText1,
        textAlignVertical: TextAlignVertical.center,
        obscureText: isPassword,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          border: InputBorder.none,
          isDense: true,
          hintText: hint,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: Colors.grey),
          suffixIcon: icon == null
              ? null
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    icon!,
                    const SizedBox(
                      width: 10,
                    )
                  ],
                ),
          //icon:icon ,
          // prefixIconConstraints: BoxConstraints(minWidth: 30, minHeight: 30),
        ),
        validator: validator ??
            (str) {
              return defaultValidator;
            },
        keyboardType: type,
      ),
    );
  }
}
