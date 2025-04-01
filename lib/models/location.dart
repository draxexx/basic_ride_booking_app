import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final double latitude;
  final double longitude;
  final String? address;

  const Location({
    required this.latitude,
    required this.longitude,
    this.address,
  });

  Location copyWith({double? latitude, double? longitude, String? address}) {
    return Location(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      address: address ?? this.address,
    );
  }

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
      address: json['address'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'latitude': latitude, 'longitude': longitude, 'address': address};
  }

  @override
  List<Object?> get props => [latitude, longitude, address];

  @override
  String toString() =>
      'Location(latitude: $latitude, longitude: $longitude, address: $address)';
}
