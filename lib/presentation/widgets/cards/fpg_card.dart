import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../utils/fpg_app_colors.dart';
import '../../utils/size_config.dart';

class FPGCard extends StatelessWidget {
  const FPGCard({
    super.key,
    required this.cardOpacityColor,
    required this.borderColor,
    required this.textUpper,
    required this.steps,
    required this.completed,
    required this.textColor,
    required this.splashColor,
    required this.onTap,
  });
  final Color cardOpacityColor, borderColor, textColor, splashColor;
  final String textUpper;
  final String steps;
  final bool completed;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: splashColor,
      onTap: onTap,
      child: Container(
          width: SizeConfig.safeBlockHorizontal * 15,
          height: SizeConfig.safeBlockVertical * 10,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: cardOpacityColor.withOpacity(0.9),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            border: Border.all(
              color: borderColor,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: SizeConfig.safeBlockHorizontal * 60, left: SizeConfig.safeBlockHorizontal * 2),
                    child:
                        Text(textUpper, style: TextStyle(color: textColor, fontSize: SizeConfig.textScaleFactor * 15)),
                  ),
                  Icon(
                    completed ? Ionicons.checkmark_circle_outline : Ionicons.warning_outline,
                    color: completed ? FPGAppColors.green : FPGAppColors.red,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: SizeConfig.safeBlockVertical * 2, left: SizeConfig.safeBlockHorizontal * 2),
                    child: Text("$steps steps",
                        style: TextStyle(color: textColor, fontSize: SizeConfig.textScaleFactor * 15)),
                  )
                ],
              )
            ],
          )),
    );
  }
}
