import 'package:burningbros_product/core/enumeration/input_state.dart';
import 'package:burningbros_product/core/enumeration/text_input_variant.dart';
import 'package:burningbros_product/core/extension/font_size.dart';
import 'package:burningbros_product/core/style/color.dart';
import 'package:burningbros_product/core/style/text_style.dart';
import 'package:flutter/material.dart';

class AppTextInput extends StatefulWidget {
  const AppTextInput({
    required this.textInputType,
    required this.state,
    this.variant = TextInputVariant.normal,
    this.labelText,
    this.placeholder,
    this.initialValue,
    this.foregroundColor,
    this.prefixIcon,
    this.minLines,
    this.maxLines,
    this.controller,
    this.validator,
    this.autoFocus,
    this.onChanged,
    this.onTap,
    this.onTapOutside,
    this.onEditingComplete,
    super.key,
  });

  final TextEditingController? controller;
  final TextInputType textInputType;
  final String? labelText;
  final String? placeholder;
  final String? initialValue;
  final Color? foregroundColor;
  final Widget? prefixIcon;
  final int? minLines;
  final int? maxLines;
  final InputState state;
  final TextInputVariant variant;
  final bool? autoFocus;

  final String? Function(String?)? validator;

  final void Function(String)? onChanged;
  final void Function()? onTap;
  final void Function(PointerDownEvent)? onTapOutside;
  final void Function()? onEditingComplete;

  @override
  State<AppTextInput> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<AppTextInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onEditingComplete: widget.onEditingComplete,
      onTap: widget.onTap,
      onTapOutside: widget.onTapOutside,
      onChanged: widget.onChanged,
      enabled: widget.state != InputState.disabled,
      initialValue: widget.initialValue,
      controller: widget.controller,
      validator: widget.validator,
      style: AppTextStyle.text(
        color: widget.foregroundColor ?? setTextColor(),
      ),
      keyboardType: widget.textInputType,
      autofocus: widget.autoFocus ?? false,
      decoration: InputDecoration(
        contentPadding: buildContentPadding(),
        label: Text(
          widget.labelText ?? '',
          style: AppTextStyle.smallText(
            color: setTextColor(),
          ),
        ),
        labelStyle: AppTextStyle.smallText(
          color: setTextColor(),
        ),
        hintText: widget.placeholder,
        hintStyle: AppTextStyle.text(
          color: widget.foregroundColor ?? setTextColor(),
        ),
        prefixIcon: widget.prefixIcon,
        focusColor: setFocusColor(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: setEnabledBorderColor(),
            style: setEnabledBorderStyle(),
          ),
          borderRadius: BorderRadius.circular(18.sf),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: setFocusedBorderColor(),
            style: setFocusedBorderStyle(),
          ),
          borderRadius: BorderRadius.circular(18.sf),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColor.accentRed,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(18.sf),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColor.accentRed,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(18.sf),
        ),
        errorStyle: AppTextStyle.smallText(color: AppColor.accentRed),
        filled: true,
        fillColor: setFilledBackgroundColor(),
      ),
      minLines: widget.minLines,
      maxLines: widget.maxLines,
    );
  }

  setTextColor() {
    switch (widget.variant) {
      case TextInputVariant.normal:
        return AppColor.text;
      case TextInputVariant.unstyled:
        return AppColor.primary;
    }
  }

  setFocusColor() {
    switch (widget.variant) {
      case TextInputVariant.normal:
        return AppColor.text;
      case TextInputVariant.unstyled:
        return AppColor.primary;
    }
  }

  Color setEnabledBorderColor() {
    switch (widget.variant) {
      case TextInputVariant.normal:
        return AppColor.neutralGray;
      case TextInputVariant.unstyled:
        return Colors.transparent;
    }
  }

  setFocusedBorderColor() {
    switch (widget.variant) {
      case TextInputVariant.normal:
        return AppColor.accent;
      case TextInputVariant.unstyled:
        return Colors.transparent;
    }
  }

  setFilledBackgroundColor() {
    switch (widget.variant) {
      case TextInputVariant.normal:
        return AppColor.primary;
      case TextInputVariant.unstyled:
        return Colors.transparent;
    }
  }

  buildContentPadding() {
    switch (widget.variant) {
      case TextInputVariant.normal:
        return EdgeInsets.all(12.sf);
      case TextInputVariant.unstyled:
        return const EdgeInsets.all(0);
    }
  }

  setEnabledBorderStyle() {
    switch (widget.variant) {
      case TextInputVariant.normal:
        return BorderStyle.solid;
      case TextInputVariant.unstyled:
        return BorderStyle.none;
    }
  }

  setFocusedBorderStyle() {
    switch (widget.variant) {
      case TextInputVariant.normal:
        return BorderStyle.solid;
      case TextInputVariant.unstyled:
        return BorderStyle.none;
    }
  }
}
