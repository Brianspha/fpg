import 'package:pedometer/pedometer.dart';

import '../../models/home/fpg_home.dart';

abstract class FPGHomeViewModel {
  FPGHome get fpgHome;
  void onPedestrianStatusChanged(PedestrianStatus event);

  void onPedestrianStatusError(error);

  void onStepCountError(error);

  void initPlatformState();
  void onStepCount(StepCount event);
}
