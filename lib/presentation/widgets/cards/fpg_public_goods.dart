import 'package:flutter/material.dart';
import 'package:fpg/presentation/utils/fpg_app_colors.dart';

import '../../utils/size_config.dart';

class FPGPublicGoods extends StatelessWidget {
  const FPGPublicGoods(
      {super.key,
      this.onSupport,
      required this.onTap,
      required this.cardOpacityColor,
      required this.borderColor,
      required this.textUpper,
      required this.textColor,
      required this.splashColor,
      required this.isSupporting,
      required this.fundsRaised});
  final Color cardOpacityColor, borderColor, textColor, splashColor;
  final String textUpper;
  final String fundsRaised;
  final void Function()? onTap, onSupport;
  final bool isSupporting;

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
                    padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 2),
                    child:
                        Text(textUpper, style: TextStyle(color: textColor, fontSize: SizeConfig.textScaleFactor * 15)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: SizeConfig.safeBlockVertical * 2, left: SizeConfig.safeBlockHorizontal * 2),
                    child: Text(fundsRaised,
                        style: TextStyle(color: textColor, fontSize: SizeConfig.textScaleFactor * 15)),
                  ),
                  if (!isSupporting)
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: SizeConfig.safeBlockHorizontal * 2),
                          child: ElevatedButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: FPGAppColors.white.withOpacity(0.1),
                                  side: BorderSide(
                                    color: FPGAppColors.goldenYellow,
                                    width: SizeConfig.safeBlockHorizontal * 0.1,
                                  ),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.elliptical(30, 120)))),
                              onPressed: onSupport,
                              child: Text("Support",
                                  style: TextStyle(color: textColor, fontSize: SizeConfig.textScaleFactor * 10))),
                        )
                      ],
                    ))
                ],
              )
            ],
          )),
    );
  }
}
