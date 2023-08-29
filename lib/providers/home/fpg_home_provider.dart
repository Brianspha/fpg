import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpg/view_models/home/fpg_home_viewmodel.dart';

import '../../models/home/public_good.dart';
import '../../view_models/home/fpg_home_viewmodel_impl.dart';
import '../projects/fpg_public_goods_provider.dart';

final FutureProvider<FPGHomeViewModel> fpgHomeProvider = FutureProvider<FPGHomeViewModelImpl>((ref) async {
  List<PublicGood>? publicGoods = ref.watch(publicGoodsProvider).value;
  FPGHomeViewModelImpl temp = FPGHomeViewModelImpl();
  temp.updatePublicGoods(publicGoods!);

  ref.listen(publicGoodsProvider, (AsyncValue<List<PublicGood>>? previous, AsyncValue<List<PublicGood>> next) {
    publicGoods = (next.value as List<PublicGood>);
    temp.updatePublicGoods(publicGoods!);
  });

  return temp;
});
