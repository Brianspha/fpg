import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpg/view_models/home/fpg_home_viewmodel.dart';

import '../../view_models/home/fpg_home_viewmodel_impl.dart';

final StateProvider<FPGHomeViewModel> fpgHomeProvider = StateProvider<FPGHomeViewModelImpl>((ref) {
  return FPGHomeViewModelImpl();
});
