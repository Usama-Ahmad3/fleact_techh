import 'package:fleact_tech/res/colors/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldWidget extends StatefulWidget {
  TextEditingController controller;
  String hintText;
  InputBorder? border;
  Widget? suffix;
  bool enable;
  TextInputType type;
  InputBorder? enableBorder;
  FormFieldValidator? onSubmitted;
  FocusNode? focus;
  InputBorder? focusBorder;
  IconData? suffixIcon;
  bool obscure;
  IconData? hideIcon;
  Color? suffixIconColor;
  Color? fillColor;
  Color? textColor;
  FormFieldValidator? onValidate;
  FormFieldValidator? onChanged;
  VoidCallback? onTap;
  VoidCallback? passTap;

  TextFieldWidget(
      {super.key,
      required this.controller,
      required this.hintText,
      this.onValidate,
      this.onTap,
      this.passTap,
      this.enable = true,
      this.textColor,
      this.suffix,
      this.onChanged,
      this.border,
      this.obscure = false,
      this.enableBorder,
      this.suffixIconColor,
      this.hideIcon,
      this.focusBorder,
      this.type = TextInputType.text,
      this.focus,
      this.onSubmitted,
      this.suffixIcon,
      this.fillColor});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obscure,
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onSubmitted,
        focusNode: widget.focus,
        validator: widget.onValidate,
        enabled: widget.enable,
        onTap: widget.onTap,
        keyboardType: widget.type,
        style: Theme.of(context).textTheme.headline2!.copyWith(
            height: 0.02,
            fontSize: widget.controller.text.length > 8 ? 14 : 16,
            color: AppColors.black),
        cursorColor: AppColors.black,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.sizeOf(context).height * 0.06),
          suffix: widget.suffix,
          hintText: widget.hintText,
          errorStyle: const TextStyle(
              fontSize: 13,
              height: 0.1,
              textBaseline: TextBaseline.ideographic),
          hintStyle: TextStyle(
            color: AppColors.grey,
          ),
          border: widget.border,
          suffixIcon: widget.suffixIcon != null
              ? widget.hideIcon != null
                  ? GestureDetector(
                      onTap: widget.passTap,
                      child: Icon(
                          widget.obscure ? widget.suffixIcon : widget.hideIcon))
                  : Icon(widget.suffixIcon)
              : null,
          suffixIconColor: widget.suffixIconColor ?? AppColors.grey,
          fillColor: widget.fillColor ?? AppColors.white,
          filled: true,
          enabledBorder: widget.border,
          focusedBorder: widget.focusBorder,
          disabledBorder: widget.border,
        ),
      ),
    );
  }
}

class TextFieldMultiWidget extends StatefulWidget {
  TextEditingController controller;
  String hintText;
  InputBorder? border;
  Widget? suffix;
  Widget? prefix;
  bool enable;
  TextInputType type;
  InputBorder? enableBorder;
  FormFieldValidator? onSubmitted;
  FocusNode? focus;
  InputBorder? focusBorder;
  IconData? prefixIcon;
  IconData? suffixIcon;
  Color? prefixIconColor;
  bool obscure;
  IconData? hideIcon;
  Color? suffixIconColor;
  Color? fillColor;
  Color? textColor;
  FormFieldValidator? onValidate;
  FormFieldValidator? onChanged;
  VoidCallback? onTap;
  VoidCallback? passTap;

  TextFieldMultiWidget(
      {super.key,
      required this.controller,
      required this.hintText,
      this.onValidate,
      this.onTap,
      this.passTap,
      this.enable = true,
      this.textColor,
      this.suffix,
      this.prefix,
      this.onChanged,
      this.border,
      this.obscure = false,
      this.enableBorder,
      this.suffixIconColor,
      this.hideIcon,
      this.focusBorder,
      this.type = TextInputType.text,
      this.focus,
      this.onSubmitted,
      this.prefixIcon,
      this.suffixIcon,
      this.prefixIconColor,
      this.fillColor});

  @override
  State<TextFieldMultiWidget> createState() => _TextFieldMultiWidgetState();
}

class _TextFieldMultiWidgetState extends State<TextFieldMultiWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: AppColors.shadowColor.withOpacity(0.17),
                blurStyle: BlurStyle.normal,
                offset: const Offset(1, 1),
                blurRadius: 12,
                spreadRadius: 2)
          ],
        ),
        child: TextFormField(
          controller: widget.controller,
          obscureText: widget.obscure,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onSubmitted,
          focusNode: widget.focus,
          validator: widget.onValidate,
          enabled: widget.enable,
          onTap: widget.onTap,
          keyboardType: widget.type,
          maxLines: 3,
          style: Theme.of(context).textTheme.headline2!.copyWith(
              fontSize: widget.controller.text.length > 8 ? 14 : 16,
              color: AppColors.black),
          cursorColor: AppColors.black,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          textAlign: TextAlign.start,
          decoration: InputDecoration(
              suffix: widget.suffix,
              prefix: widget.prefix,
              hintText: widget.hintText,
              errorStyle: const TextStyle(
                  fontSize: 13,
                  height: 0.1,
                  textBaseline: TextBaseline.ideographic),
              hintStyle: TextStyle(
                color: AppColors.grey,
              ),
              border: widget.border,
              suffixIcon: widget.suffixIcon != null
                  ? widget.hideIcon != null
                      ? GestureDetector(
                          onTap: widget.passTap,
                          child: Icon(widget.obscure
                              ? widget.suffixIcon
                              : widget.hideIcon))
                      : Icon(widget.suffixIcon)
                  : null,
              suffixIconColor: widget.suffixIconColor ?? AppColors.grey,
              prefixIcon:
                  widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
              fillColor: widget.fillColor ?? AppColors.white,
              filled: true,
              enabledBorder: widget.border,
              disabledBorder: widget.border,
              focusedBorder: widget.border,
              prefixIconColor: widget.prefixIconColor ?? AppColors.grey),
        ),
      ),
    );
  }
}
