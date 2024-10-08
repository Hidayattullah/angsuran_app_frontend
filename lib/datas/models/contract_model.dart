class Contract {
  final int id;
  final String contractNumber;
  final String clientName;
  final double otr;
  final double downPayment;
  final double principalDebt;
  final double interestRate;
  final double monthlyInstallment;
  final int durationInMonths;
  final DateTime startDate;
  final DateTime endDate;

  Contract({
    required this.id,
    required this.contractNumber,
    required this.clientName,
    required this.otr,
    required this.downPayment,
    required this.principalDebt,
    required this.interestRate,
    required this.monthlyInstallment,
    required this.durationInMonths,
    required this.startDate,
    required this.endDate,
  });

  factory Contract.fromJson(Map<String, dynamic> json) {
    return Contract(
      id: json['id'],
      contractNumber: json['contractNumber'],
      clientName: json['clientName'],
      otr: _parseDouble(json['otr']),
      downPayment: _parseDouble(json['downPayment']),
      principalDebt: _parseDouble(json['principalDebt']),
      interestRate: _parseDouble(json['interestRate']),
      monthlyInstallment: _parseDouble(json['monthlyInstallment']),
      durationInMonths: json['durationInMonths'] ?? 0, // Default to 0 if null
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
    );
  }

  static double _parseDouble(dynamic value) {
    if (value == null) return 0.0; // Return 0.0 if value is null
    if (value is String) return double.tryParse(value) ?? 0.0; // Try to parse string to double
    return value.toDouble(); // If already double, return it
  }
}
