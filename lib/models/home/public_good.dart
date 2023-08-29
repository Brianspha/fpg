class PublicGood {
  final String name;
  final double currentFunding;
  final String address;

  PublicGood({
    required this.name,
    required this.currentFunding,
    required this.address,
  });

  // Factory method to create an instance with default/empty values
  factory PublicGood.empty() {
    return PublicGood(
      name: '',
      currentFunding: 0.0,
      address: '',
    );
  }

  // CopyWith method to create a new instance with updated values
  PublicGood copyWith({
    String? name,
    double? currentFunding,
    String? address,
  }) {
    return PublicGood(
      name: name ?? this.name,
      currentFunding: currentFunding ?? this.currentFunding,
      address: address ?? this.address,
    );
  }

  @override
  String toString() {
    return 'PublicGood(name: $name, currentFunding: $currentFunding, address: $address)';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PublicGood &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          currentFunding == other.currentFunding &&
          address == other.address;

  @override
  int get hashCode => name.hashCode ^ currentFunding.hashCode ^ address.hashCode;
}
