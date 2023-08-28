import 'package:flutter/cupertino.dart';
import 'package:fpg/models/home/fpg_home.dart';
import 'package:fpg/view_models/home/fpg_home_viewmodel.dart';
import 'package:pedometer/pedometer.dart';

class FPGHomeViewModelImpl extends FPGHomeViewModel {
  final FPGHome _fpgHome = FPGHome.empty();
  @override
  void initPlatformState() {
    _fpgHome.copyWith(pedestrianStatusStream: Pedometer.pedestrianStatusStream);
    _fpgHome.pedestrianStatusStream.listen(onPedestrianStatusChanged).onError(onPedestrianStatusError);
    _fpgHome.copyWith(stepCountStream: Pedometer.stepCountStream);

    _fpgHome.stepCountStream.listen(onStepCount).onError(onStepCountError);
  }

  @override
  void onPedestrianStatusChanged(PedestrianStatus event) {
    _fpgHome.copyWith(status: event.status);
  }

  @override
  void onPedestrianStatusError(error) {
    _fpgHome.copyWith(status: 'Pedestrian Status not available');
  }

  @override
  void onStepCountError(error) {
    _fpgHome.copyWith(steps: 'Step Count not available');
  }

  @override
  void onStepCount(StepCount event) {
    debugPrint(event as String?);
    _fpgHome.copyWith(steps: event.steps.toString());
  }

  @override
  FPGHome get fpgHome => _fpgHome;
}
