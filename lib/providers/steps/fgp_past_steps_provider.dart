import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/home/steps.dart';

final stepHistoryProvider = FutureProvider<List<Steps>>((ref) async {
  final List<Steps> publicGoods = [
    Steps(tokensReceived: Random().nextInt(100), projectName: 'Yay'),
    Steps(tokensReceived: Random().nextInt(100), projectName: 'Yay')
  ];
  await Future.delayed(const Duration(seconds: 5), () {
    debugPrint("Done delaying Steps :XD");
  });
  return publicGoods;
});
