/*
* @author: zongjian
* @createTime: 2023/6/14 09:24
* @description: 
*/
import 'package:flutter/material.dart';

class AppToast {
  AppToast(
      this.text, {
        this.theme,
        this.milliseconds = 1500,
      }) : assert(_callBack != null, 'AppToast no init') {
    _showToast();
  }

  final String text;
  final int milliseconds;
  final RcToastTheme? theme;

  late OverlayEntry _overlayEntry;
  late OverlayState _overlayState;
  static BuildContext Function()? _callBack;
  static RcToastTheme defaultTheme = RcToastTheme.light();

  RcToastTheme get _theme => theme ?? defaultTheme;

  static void init(
      BuildContext Function() callBack, {
        RcToastTheme? toastTheme,
      }) {
    _callBack = callBack;

    if (toastTheme != null) {
      defaultTheme = toastTheme;
    }
  }

  void _showToast() {
    _overlayState = Overlay.of(_callBack!())!;
    _overlayEntry = OverlayEntry(builder: (BuildContext context) => _buildContent());
    _overlayState.insert(_overlayEntry);
    _close();
  }

  Future<void> _close() async {
    await Future.delayed(Duration(milliseconds: milliseconds));
    _overlayEntry.remove();
  }

  Widget _buildContent() {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          margin: _theme.margin,
          padding: _theme.padding,
          decoration: _theme.decoration,
          child: Text(
            text,
            style: _theme.textStyle,
          ),
        ),
      ),
    );
  }
}

class RcToastTheme {
  const RcToastTheme({
    this.margin,
    this.padding,
    this.textStyle,
    this.decoration,
  });

  factory RcToastTheme.dark() => RcToastTheme(
    textStyle: const TextStyle(
      fontWeight: FontWeight.w500,
    ),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(4),
    ),
    margin: const EdgeInsets.symmetric(horizontal: 50),
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
  );

  factory RcToastTheme.light() => RcToastTheme(
    textStyle: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
    decoration: BoxDecoration(
      color: Colors.black87,
      borderRadius: BorderRadius.circular(4),
    ),
    margin: const EdgeInsets.symmetric(horizontal: 50),
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
  );

  final TextStyle? textStyle;
  final BoxDecoration? decoration;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
}
