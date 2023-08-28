import 'package:pedometer/pedometer.dart';

class FPGHome {
  final Stream<StepCount> stepCountStream;
  final Stream<PedestrianStatus> pedestrianStatusStream;
  final String steps;
  final String status;
  FPGHome({
    required this.stepCountStream,
    required this.pedestrianStatusStream,
    required this.steps,
    required this.status,
  });

  FPGHome copyWith(
      {Stream<StepCount>? stepCountStream,
      Stream<PedestrianStatus>? pedestrianStatusStream,
      String? steps,
      String? status}) {
    return FPGHome(
      steps: steps ?? this.steps,
      status: status ?? this.status,
      stepCountStream: stepCountStream ?? this.stepCountStream,
      pedestrianStatusStream: pedestrianStatusStream ?? this.pedestrianStatusStream,
    );
  }

  factory FPGHome.empty() {
    return FPGHome(
      status: '?',
      steps: '0',
      stepCountStream: const Stream.empty(),
      pedestrianStatusStream: const Stream.empty(),
    );
  }
}
