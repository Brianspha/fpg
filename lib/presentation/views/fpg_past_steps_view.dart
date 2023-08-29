import 'package:animation_list/animation_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpg/presentation/utils/fpg_app_colors.dart';
import 'package:fpg/presentation/utils/fpg_padding.dart';

import '../../models/home/steps.dart';
import '../../providers/steps/fgp_past_steps_provider.dart';
import '../utils/size_config.dart';
import '../widgets/cards/fpg_public_goods.dart';
import '../widgets/containers/base_container.dart';

class FPGPastStepsView extends ConsumerWidget {
  const FPGPastStepsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<Steps>> publicGoodsModelAsync = ref.watch(stepHistoryProvider);
    SizeConfig().init(context);
    return publicGoodsModelAsync.when(
        data: (List<Steps> data) => _buildPastHistoryView(context, data, false),
        error: (Object error, StackTrace stack) => _buildPastHistoryView(context, [], false),
        loading: () => _buildPastHistoryView(context, [], true));
  }
}

Widget _buildPastHistoryView(BuildContext context, List<Steps> steps, bool isLoading) {
  return ContainerWithPadding(
    allowBackPress: true,
    padding: FPGPaddings.mainHorizontalPadding,
    color: FPGAppColors.white,
    child: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 5, bottom: SizeConfig.safeBlockVertical * 5),
            child: Align(
              alignment: FractionalOffset.topLeft,
              child: Text("Step History,",
                  style: TextStyle(color: FPGAppColors.primaryColor, fontSize: SizeConfig.textScaleFactor * 20)),
            ),
          ),
          SizedBox(
            width: SizeConfig.blockSizeHorizontal * 100,
            height: SizeConfig.safeBlockVertical * 70,
            child: isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: FPGAppColors.primaryColor,
                    ),
                  )
                : steps.isEmpty
                    ? Center(
                        child: Text(
                          "No Step History found",
                          style: TextStyle(color: FPGAppColors.primaryColor, fontSize: SizeConfig.textScaleFactor * 15),
                        ),
                      )
                    : AnimationList(
                        duration: 1000,
                        reBounceDepth: 10.0,
                        children: [
                          for (int index = 0; index < steps.length; index++)
                            Padding(
                              padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 1),
                              child: FPGPublicGoods(
                                textColor: FPGAppColors.primaryColor,
                                cardOpacityColor: FPGAppColors.white.withOpacity(0.5),
                                borderColor: FPGAppColors.goldenYellow.withOpacity(0.5),
                                textUpper: steps[index].projectName,
                                fundsRaised: "${steps[index].tokensReceived} XF received",
                                splashColor: FPGAppColors.goldenYellow,
                                onTap: () {},
                                isSupporting: false,
                              ),
                            )
                        ],
                      ),
          ),
          Padding(
            padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 5),
            child: SizedBox(
              width: SizeConfig.safeBlockHorizontal * 60,
              height: SizeConfig.safeBlockVertical * 6,
              child: ElevatedButton(
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(FPGAppColors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: const BorderRadius.all(Radius.circular(60)),
                          side: BorderSide(color: FPGAppColors.primaryColor)))),
                  onPressed: () => {Navigator.pop(context)},
                  child: Text("Back",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: FPGAppColors.primaryColor,
                          fontSize: SizeConfig.textScaleFactor * 13))),
            ),
          )
        ],
      ),
    ),
  );
}
