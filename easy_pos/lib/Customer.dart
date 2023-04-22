class Customer {
  final String name;
  final int type;
  final String city;
  final String? district;
  final String phoneNumber;
  final String? address;
  final String email;
  final String taxcode;
  final String idNumber;
  final String? description;

  Customer(
      {required this.name,
      required this.type,
      required this.city,
      this.district,
      required this.phoneNumber,
      this.address,
      required this.email,
      required this.taxcode,
      required this.idNumber,
      this.description});
}
