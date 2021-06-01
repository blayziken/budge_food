import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dialog_widget.dart';

class Dialogs {
  ///[titleStyle] can be used to change the dialog title style
  static const TextStyle titleStyle =
      const TextStyle(fontWeight: FontWeight.bold, fontSize: 16);

  ///[bcgColor] background default value
  static const Color bcgColor = const Color(0xfffefefe);

  ///[holder] holder for the custom view
  static const Widget holder = const SizedBox(
    height: 0,
  );

  /// [dialogShape] dialog outer shape
  static const ShapeBorder dialogShape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)));

  /// [BottomSheetShape] bottom dialog outer shape
  static const ShapeBorder BottomSheetShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16), topRight: Radius.circular(16)));

  /// Displays normal Material dialog above the current contents of the app
  /// [context] your parent widget context
  /// [color] dialog background color

  /// [title] your dialog title
  /// [titleStyle] your dialog title style
  /// [msg] your dialog description message
  /// [msgStyle] your dialog description style

  /// [actions] Widgets to display a row of buttons after the [msg] widget.

  /// [animation] JSON Lottie animation file
  /// [animationFrameRate] framerate of animation
  /// [animationRepeat] should the animation repeat?
  /// [animationAnimate] should the animation animate?
  /// [animationReverse] should the animation be reversed?
  /// [barrierDismissible] dismiss the dialog when click outside ?

  static Future<void> materialDialog({
    @required BuildContext context,
    String title,
    String msg,
    List<Widget> actions,
    Widget customView = holder,
    String animation,
    double animationFrameRate,
    bool animationRepeat,
    bool animationAnimate,
    bool animationReverse,
    bool barrierDismissible = true,
    ShapeBorder dialogShape = dialogShape,
    TextStyle titleStyle = titleStyle,
    TextStyle msgStyle,
    Color color = bcgColor,
  }) async {
    await showDialog<String>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return Dialog(
          backgroundColor: color,
          shape: dialogShape,
          child: DialogWidget(
            title: title,
            msg: msg,
            actions: actions,
            animation: animation,
            animationFrameRate: animationFrameRate != null
                ? FrameRate(animationFrameRate)
                : FrameRate.composition,
            customView: customView,
            animationRepeat: animationRepeat,
            animationAnimate: animationAnimate,
            animationReverse: animationReverse,
            titleStyle: titleStyle,
            msgStyle: msgStyle,
            color: color,
          ),
        );
      },
    );
  }

  /// Displays bottom sheet Material dialog above the current contents of the app
  static void bottomMaterialDialog({
    @required BuildContext context,
    String title,
    String msg,
    List<Widget> actions,
    Widget customView = holder,
    String animation,
    double animationFrameRate,
    bool animationRepeat,
    bool animationAnimate,
    bool animationReverse,
    bool barrierDismissible = true,
    ShapeBorder dialogShape = BottomSheetShape,
    TextStyle titleStyle = titleStyle,
    TextStyle msgStyle,
    Color color = bcgColor,
  }) {
    showModalBottomSheet(
      context: context,
      shape: dialogShape,
      backgroundColor: color,
      isDismissible: barrierDismissible,
      builder: (context) => DialogWidget(
        title: title,
        msg: msg,
        actions: actions,
        animation: animation,
        animationFrameRate: animationFrameRate != null
            ? FrameRate(animationFrameRate)
            : FrameRate.composition,
        customView: customView,
        animationRepeat: animationRepeat,
        animationAnimate: animationAnimate,
        animationReverse: animationReverse,
        titleStyle: titleStyle,
        msgStyle: msgStyle,
        color: color,
      ),
    );
  }
}
