import 'package:burningbros_product/core/extension/font_size.dart';
import 'package:burningbros_product/core/style/color.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold({
    required this.appBar,
    required this.body,
    this.bottomNavigationBar,
    this.backgroundColor,
    this.bodyExtendedBehindAppBar = false,
    this.resizeToAvoidBottomInset,
    this.bodyPadding,
    this.bodyBgColor,
    super.key,
  });

  final Widget appBar;
  final Widget body;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;
  final bool? bodyExtendedBehindAppBar;
  final bool? resizeToAvoidBottomInset;
  final EdgeInsets? bodyPadding;
  final Color? bodyBgColor;

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: widget.backgroundColor ?? AppColor.primary,
        resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
        extendBodyBehindAppBar: widget.bodyExtendedBehindAppBar!,
        extendBody: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight.sf),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.sf,
                vertical: 8.sf,
              ),
              child: widget.appBar,
            ),
          ),
        ),
        body: Container(
          height: double.infinity,
          padding: widget.bodyPadding ??
              EdgeInsets.symmetric(
                horizontal: 12.sf,
                vertical: 15.sf,
              ),
          margin: EdgeInsets.only(top: 3.sf),
          decoration: BoxDecoration(
            color: widget.bodyBgColor ?? AppColor.primary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18.sf),
              topRight: Radius.circular(18.sf),
            ),
          ),
          child: widget.body,
        ),
        bottomNavigationBar: widget.bottomNavigationBar,
      ),
    );
  }
}
