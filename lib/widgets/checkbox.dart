/*
* @author: zongjian
* @createTime: 2023/6/13 13:36
* @description: 
*/
import 'package:flutter/material.dart';
import 'package:zuzu/themes/app_colors.dart';

class ZzCheckBox extends StatefulWidget {
  const ZzCheckBox({
    Key? key,
    this.isChecked,
    this.checkedWidget,
    this.uncheckedWidget,
    this.checkedColor,
    this.uncheckedColor,
    this.disabledColor,
    this.border,
    this.borderColor,
    this.size,
    this.animationDuration,
    this.isRound = false,
    required this.onTap,
  }) : super(key: key);

  ///Define wether the checkbox is marked or not
  final bool? isChecked;

  ///Define the widget that is shown when Widgets is checked
  final Widget? checkedWidget;

  ///Define the widget that is shown when Widgets is unchecked
  final Widget? uncheckedWidget;

  ///Define the color that is shown when Widgets is checked
  final Color? checkedColor;

  ///Define the color that is shown when Widgets is unchecked
  final Color? uncheckedColor;

  ///Define the color that is shown when Widgets is disabled
  final Color? disabledColor;

  ///Define the border of the widget
  final Border? border;

  ///Define the border color  of the widget
  final Color? borderColor;

  ///Define the size of the checkbox
  final double? size;

  ///Define Function that os executed when user tap on checkbox
  ///If onTap is given a null callack, it will be disabled
  final Function(bool?)? onTap;

  ///Define the duration of the animation. If any
  final Duration? animationDuration;

  final bool isRound;

  @override
  _ZzCheckBoxState createState() => _ZzCheckBoxState();
}

class _ZzCheckBoxState extends State<ZzCheckBox> {
  bool? isChecked;
  late Duration animationDuration;
  double? size;
  Widget? checkedWidget;
  Widget? uncheckedWidget;
  Color? checkedColor;
  Color? uncheckedColor;
  Color? disabledColor;
  late Color borderColor;

  @override
  void initState() {
    isChecked = widget.isChecked ?? false;
    animationDuration = widget.animationDuration ?? const Duration(milliseconds: 500);
    size = widget.size ?? 24.0;
    checkedColor = widget.checkedColor ?? AppColors.primaryColor;
    uncheckedColor = widget.uncheckedColor;
    borderColor = widget.borderColor ?? AppColors.primaryColor;
    checkedWidget =
        widget.checkedWidget ?? const Icon(Icons.check, color: Colors.white, size: 20,);
    uncheckedWidget = widget.uncheckedWidget ?? const SizedBox.shrink();
    super.initState();
  }

  @override
  void didUpdateWidget(ZzCheckBox oldWidget) {
    uncheckedColor =
        widget.uncheckedColor ?? Theme.of(context).scaffoldBackgroundColor;
    if (isChecked != widget.isChecked) {
      isChecked = widget.isChecked ?? false;
    }
    if (animationDuration != widget.animationDuration) {
      animationDuration =
          widget.animationDuration ?? const Duration(milliseconds: 100);
    }
    if (size != widget.size) {
      size = widget.size ?? 24.0;
    }
    if (checkedColor != widget.checkedColor) {
      checkedColor = widget.checkedColor ?? AppColors.primaryColor;
    }
    if (borderColor != widget.borderColor) {
      borderColor = widget.borderColor ?? AppColors.primaryColor;
    }
    if (checkedWidget != widget.checkedWidget) {
      checkedWidget =
          widget.checkedWidget ?? const Icon(Icons.check, color: Colors.white, size: 20,);
    }
    if (uncheckedWidget != widget.uncheckedWidget) {
      uncheckedWidget = widget.uncheckedWidget ?? const SizedBox.shrink();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return widget.onTap != null
        ? GestureDetector(
      onTap: () {
        setState(() => isChecked = !isChecked!);
        widget.onTap!(isChecked);
      },
      child: ClipRRect(
        borderRadius: borderRadius,
        child: AnimatedContainer(
          duration: animationDuration,
          height: size,
          width: size,
          decoration: BoxDecoration(
            color: isChecked! ? checkedColor : uncheckedColor,
            border: widget.border ??
                Border.all(
                  color: borderColor,
                  width: 2
                ),
            borderRadius: borderRadius,
          ),
          child: isChecked! ? checkedWidget : uncheckedWidget,
        ),
      ),
    )
        : ClipRRect(
      borderRadius: borderRadius,
      child: AnimatedContainer(
        duration: animationDuration,
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: widget.disabledColor ?? Theme.of(context).disabledColor,
          border: widget.border ??
              Border.all(
                color: widget.disabledColor ??
                    Theme.of(context).disabledColor,
              ),
          borderRadius: borderRadius,
        ),
        child: isChecked! ? checkedWidget : uncheckedWidget,
      ),
    );
  }

  BorderRadius get borderRadius{
    if(widget.isRound){
      return BorderRadius.circular(size!/2);
    }else{
      return BorderRadius.circular(8);
    }
  }
}
