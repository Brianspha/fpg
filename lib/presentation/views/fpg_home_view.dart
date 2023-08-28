import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpg/presentation/utils/fpg_app_colors.dart';
import 'package:fpg/presentation/utils/fpg_padding.dart';
import 'package:ionicons/ionicons.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../providers/home/fpg_home_provider.dart';
import '../../view_models/home/fpg_home_viewmodel.dart';
import '../utils/size_config.dart';
import '../widgets/buttons/fpg_button_circle.dart';
import '../widgets/cards/fpg_card.dart';
import '../widgets/containers/base_container.dart';

class FPGHomeView extends ConsumerWidget {
  const FPGHomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    FPGHomeViewModel fpgHome = ref.watch(fpgHomeProvider);
    SizeConfig().init(context);
    return ContainerWithPadding(
        padding: FPGPaddings.mainHorizontalPadding,
        color: FPGAppColors.transparent,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: SizeConfig.safeBlockHorizontal * 5),
              child: SizedBox(
                width: SizeConfig.safeBlockHorizontal * 100,
                height: SizeConfig.safeBlockVertical * 40,
                child: CircularPercentIndicator(
                  animationDuration: 5000,
                  radius: 120.0,
                  lineWidth: SizeConfig.textScaleFactor * 15,
                  percent: Random().nextDouble(),
                  center: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: SizeConfig.safeBlockVertical * 3, top: SizeConfig.safeBlockVertical * 2),
                        child: Icon(
                          Ionicons.footsteps,
                          size: SizeConfig.safeBlockVertical * 10,
                          color: FPGAppColors.primaryColor,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: SizeConfig.safeBlockHorizontal * 2),
                        child: Text(
                          "Public Good Name",
                          style: TextStyle(color: FPGAppColors.primaryColor, fontSize: SizeConfig.textScaleFactor * 15),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: SizeConfig.safeBlockHorizontal * 2),
                        child: Text(
                          "${Random().nextInt(500)}/${Random().nextInt(1000)} steps completed",
                          style: TextStyle(color: FPGAppColors.primaryColor, fontSize: SizeConfig.textScaleFactor * 15),
                        ),
                      ),
                    ],
                  ),
                  progressColor: FPGAppColors.primaryColor,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: SizeConfig.safeBlockVertical * 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 1),
                    child: FPGButtonCircle(
                      onTap: () {},
                      color: FPGAppColors.transparent,
                      widget: Icon(
                        Icons.currency_bitcoin_outlined,
                        size: SizeConfig.safeBlockVertical * 5,
                        color: FPGAppColors.primaryColor,
                      ),
                      splashColor: FPGAppColors.goldenYellow.withOpacity(0.2),
                      width: SizeConfig.safeBlockHorizontal * 20,
                      height: SizeConfig.safeBlockVertical * 4,
                      fontColor: FPGAppColors.primaryColor,
                      title: "My Coins",
                      fontSize: SizeConfig.textScaleFactor * 15,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 1),
                    child: FPGButtonCircle(
                      onTap: () {},
                      color: FPGAppColors.transparent,
                      widget: Icon(
                        Icons.support,
                        size: SizeConfig.safeBlockVertical * 5,
                        color: FPGAppColors.primaryColor,
                      ),
                      splashColor: FPGAppColors.goldenYellow.withOpacity(0.2),
                      width: SizeConfig.safeBlockHorizontal * 20,
                      height: SizeConfig.safeBlockVertical * 4,
                      fontColor: FPGAppColors.primaryColor,
                      title: "Projects",
                      fontSize: SizeConfig.textScaleFactor * 15,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 1),
                    child: FPGButtonCircle(
                      onTap: () {},
                      color: FPGAppColors.transparent,
                      widget: Icon(
                        Icons.run_circle,
                        size: SizeConfig.safeBlockVertical * 5,
                        color: FPGAppColors.primaryColor,
                      ),
                      splashColor: FPGAppColors.goldenYellow.withOpacity(0.2),
                      width: SizeConfig.safeBlockHorizontal * 20,
                      height: SizeConfig.safeBlockVertical * 4,
                      fontColor: FPGAppColors.primaryColor,
                      title: "Past Steps",
                      fontSize: SizeConfig.textScaleFactor * 15,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: SizeConfig.safeBlockVertical * 5),
              child: SizedBox(
                width: SizeConfig.safeBlockHorizontal * 100,
                height: SizeConfig.safeBlockHorizontal * 100,
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 1),
                        child: FPGCard(
                          onTap: () {},
                          textColor: FPGAppColors.primaryColor,
                          cardOpacityColor: FPGAppColors.white.withOpacity(0.5),
                          borderColor: FPGAppColors.goldenYellow.withOpacity(0.5),
                          textUpper: "Gitcoin Project $index",
                          steps: fpgHome.fpgHome.steps,
                          completed: Random().nextBool(),
                          splashColor: FPGAppColors.goldenYellow,
                        ),
                      );
                    }),
              ),
            )
          ],
        ));
  }
}
