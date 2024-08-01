// ignore_for_file: public_member_api_docs, sort_constructors_first
class Venue {
  String name;
  String id;
  String postalCode;
  String parkingDetail;
  String city;
  String address;

  Venue({
    required this.name,
    required this.id,
    required this.postalCode,
    required this.parkingDetail,
    required this.city,
    required this.address,
  });

  @override
  String toString() {
    return 'Venue(name: $name, id: $id, postalCode: $postalCode, parkingDetail: $parkingDetail, city: $city, address: $address)';
  }
}
