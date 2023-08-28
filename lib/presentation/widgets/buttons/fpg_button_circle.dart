import 'package:flutter/material.dart';
import 'package:fpg/presentation/utils/size_config.dart';

class FPGButtonCircle extends StatelessWidget {
  const FPGButtonCircle(
      {super.key,
      required this.color,
      this.onTap,
      required this.widget,
      required this.splashColor,
      required this.width,
      required this.height,
      required this.title,
      required this.fontSize,
      required this.fontColor});

  final Color color, splashColor, fontColor;
  final void Function()? onTap;
  final Widget widget;
  final double width, height, fontSize;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Material(
        color: color, // Button color
        child: InkWell(
          splashColor: splashColor, // Splash color
          onTap: onTap,
          child: Column(
            children: [
              SizedBox(
                  width: width,
                  height: height,
                  child: TextButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
                        if (states.contains(MaterialState.focused)) {
                          return color;
                        }
                        return null; // Defer to the widget's default.
                      }),
                    ),
                    onPressed: onTap,
                    child: widget,
                  )),
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 2),
                child: Text(
                  title,
                  style: TextStyle(color: fontColor, fontSize: fontSize),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
