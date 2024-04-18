class BusinessCard {
  String? _businessName;
  String? _cardHolderName;
  String? _cardHolderEmail;
  String? _contactNumber;
  String? _businessAddress;

  String get businessName => _businessName!;

  set businessName(String value) {
    _businessName = value;
  }

  BusinessCard({
    required String businessName,
    required String cardHolderName,
    required String cardHolderEmail,
    required String contactNumber,
    required String businessAddress,
  }) {
    _businessName = businessName;
    _cardHolderName = cardHolderName;
    _cardHolderEmail = cardHolderEmail;
    _contactNumber = contactNumber;
    _businessAddress = businessAddress;
  }

  String get cardHolderName => _cardHolderName!;

  set cardHolderName(String value) {
    _cardHolderName = value;
  }

  String get businessAddress => _businessAddress!;

  set businessAddress(String value) {
    _businessAddress = value;
  }

  String get contactNumber => _contactNumber!;

  set contactNumber(String value) {
    _contactNumber = value;
  }

  String get cardHolderEmail => _cardHolderEmail!;

  set cardHolderEmail(String value) {
    _cardHolderEmail = value;
  }
}
