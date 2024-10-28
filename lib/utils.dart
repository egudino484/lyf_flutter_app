enum MembershipType {
  Gold('Gold'),
  Silver('Silver'),
  Bronze('Bronze');

  final String value;

  const MembershipType(this.value);
  
  // Método para convertir de string a enum
  static MembershipType fromString(String value) {
    return MembershipType.values.firstWhere(
      (membershipType) => membershipType.value == value,
      orElse: () => throw ArgumentError('Invalid membership type: $value'),
    );
  }

  // Método para convertir de enum a string
  @override
  String toString() => value;
}


double convertUsdToEther(double usdAmount) {
   double fixedEtherPrice = 2521.99; // call api
  return usdAmount / fixedEtherPrice;
}