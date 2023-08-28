// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:

import '../../utils/size_config.dart';

class ContainerWithPadding extends StatelessWidget {
  const ContainerWithPadding(
      {Key? key, required this.child, required this.padding, this.allowBackPress = false, required this.color})
      : super(key: key);
  final Widget child;
  final EdgeInsets padding;
  final bool allowBackPress;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: Container(
                color: color,
                width: SizeConfig.safeBlockHorizontal * 100,
                height: SizeConfig.safeBlockVertical * 100,
                child: Padding(
                    padding: padding,
                    child: SingleChildScrollView(
                      padding: EdgeInsets.zero,
                      physics: const RangeMaintainingScrollPhysics(),
                      child: child,
                    ))),
          )),
      onWillPop: () {
        return Future.value(allowBackPress); // if true allow back else block it
      },
    );
  }
}
