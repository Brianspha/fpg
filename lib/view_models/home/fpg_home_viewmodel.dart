import 'package:pedometer/pedometer.dart';

import '../../models/home/fpg_home.dart';
import '../../models/home/public_good.dart';

abstract class FPGHomeViewModel {
  FPGHome get fpgHome;
  void onPedestrianStatusChanged(PedestrianStatus event);

  void onPedestrianStatusError(error);

  void onStepCountError(error);
  void updatePublicGoods(List<PublicGood> publicGoods);
  void initPlatformState();
  void onStepCount(StepCount event);
}
