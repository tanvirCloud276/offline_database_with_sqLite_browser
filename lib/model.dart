class MyData {
  final int id;
  final String name;
  final String email;
  final String address;

  MyData({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
  });

  @override
  String toString() {
    return 'MyData { id: $id, name: $name, email: $email, address: $address }';
  }
}
