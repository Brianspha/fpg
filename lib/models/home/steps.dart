class Steps {
  final int tokensReceived;
  final String projectName;

  Steps({
    required this.tokensReceived,
    required this.projectName,
  });

  factory Steps.empty() {
    return Steps(
      tokensReceived: 0,
      projectName: '',
    );
  }

  Steps copyWith({
    int? tokensReceived,
    String? projectName,
  }) {
    return Steps(
      tokensReceived: tokensReceived ?? this.tokensReceived,
      projectName: projectName ?? this.projectName,
    );
  }

  @override
  String toString() {
    return 'Steps(tokensReceived: $tokensReceived, projectName: $projectName)';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Steps &&
          runtimeType == other.runtimeType &&
          tokensReceived == other.tokensReceived &&
          projectName == other.projectName;

  @override
  int get hashCode => tokensReceived.hashCode ^ projectName.hashCode;
}
