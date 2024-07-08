class Contact {
  final String id;
  final String name;
  final String phone;
  final String email;
  final String address;

  const Contact({
    required this.id, 
    required this.name, 
    required this.phone,
    required this.email,
    required this.address
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'address': address,
    };
  }

  Contact.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        phone = map['phone'],
        email = map['email'],
        address = map['address'];
}
