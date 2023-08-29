import 'package:fpg/models/home/public_good.dart';
import 'package:pedometer/pedometer.dart';

class FPGHome {
  final Stream<StepCount> stepCountStream;
  final Stream<PedestrianStatus> pedestrianStatusStream;
  final List<PublicGood> publicGoods;
  final String steps;
  final String status;
  FPGHome({
    required this.stepCountStream,
    required this.pedestrianStatusStream,
    required this.steps,
    required this.status,
    required this.publicGoods,
  });

  FPGHome copyWith(
      {Stream<StepCount>? stepCountStream,
      Stream<PedestrianStatus>? pedestrianStatusStream,
      String? steps,
      String? status,
      List<PublicGood>? publicGoods}) {
    return FPGHome(
      publicGoods: publicGoods ?? this.publicGoods,
      steps: steps ?? this.steps,
      status: status ?? this.status,
      stepCountStream: stepCountStream ?? this.stepCountStream,
      pedestrianStatusStream: pedestrianStatusStream ?? this.pedestrianStatusStream,
    );
  }

  factory FPGHome.empty() {
    return FPGHome(
      publicGoods: [],
      status: '?',
      steps: '0',
      stepCountStream: const Stream.empty(),
      pedestrianStatusStream: const Stream.empty(),
    );
  }
}
