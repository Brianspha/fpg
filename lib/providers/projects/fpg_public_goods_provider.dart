import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpg/models/home/public_good.dart';

final publicGoodsProvider = FutureProvider<List<PublicGood>>((ref) async {
  final List<PublicGood> publicGoods = [
    PublicGood(
      name: 'Community Park',
      currentFunding: 50000.0,
      address: '123 Main St',
    ),
    PublicGood(
      name: 'Public Library',
      currentFunding: 75000.0,
      address: '456 Elm St',
    )
  ];
  await Future.delayed(const Duration(seconds: 5), () {
    debugPrint("Done delaying :XD");
  });
  return publicGoods;
});
