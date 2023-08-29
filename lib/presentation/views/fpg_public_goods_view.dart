import 'dart:math';

import 'package:animation_list/animation_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpg/models/home/public_good.dart';
import 'package:fpg/presentation/utils/fpg_app_colors.dart';
import 'package:fpg/presentation/utils/fpg_padding.dart';
import 'package:fpg/providers/projects/fpg_projects_provider.dart';

import '../utils/size_config.dart';
import '../widgets/cards/fpg_card.dart';
import '../widgets/containers/base_container.dart';

class FPGProjectsView extends ConsumerWidget {
  const FPGProjectsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<PublicGood>> publicGoodsModelAsync = ref.watch(publicGoodsProvider);
    SizeConfig().init(context);
    return publicGoodsModelAsync.when(
        data: (List<PublicGood> data) => _buildProjectsView(context, data),
        error: (Object error, StackTrace stack) => _buildProjectsView(context, []),
        loading: () => _buildProjectsView(context, []));
  }
}

Widget _buildProjectsView(BuildContext context, List<PublicGood> publicGoods) {
  return ContainerWithPadding(
    padding: FPGPaddings.mainHorizontalPadding,
    color: FPGAppColors.primaryColor,
    child: Padding(
      padding: EdgeInsets.only(bottom: SizeConfig.safeBlockVertical * 5),
      child: SizedBox(
        width: SizeConfig.safeBlockHorizontal * 100,
        height: SizeConfig.safeBlockHorizontal * 100,
        child: publicGoods.isEmpty
            ? Center(
                child: Text(
                  "No Public Goods found",
                  style: TextStyle(color: FPGAppColors.primaryColor, fontSize: SizeConfig.textScaleFactor * 15),
                ),
              )
            : AnimationList(
                duration: 1000,
                reBounceDepth: 10.0,
                children: [
                  for (int index = 0; index < publicGoods.length; index++)
                    Padding(
                      padding: EdgeInsets.only(top: SizeConfig.safeBlockVertical * 1),
                      child: FPGCard(
                        onTap: () {},
                        textColor: FPGAppColors.primaryColor,
                        cardOpacityColor: FPGAppColors.white.withOpacity(0.5),
                        borderColor: FPGAppColors.goldenYellow.withOpacity(0.5),
                        textUpper: "Gitcoin Project $index",
                        steps: index.toString(),
                        completed: Random().nextBool(),
                        splashColor: FPGAppColors.goldenYellow,
                        onPressed: () {},
                      ),
                    )
                ],
              ),
      ),
    ),
  );
}
