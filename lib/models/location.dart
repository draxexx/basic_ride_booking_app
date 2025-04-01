import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final double latitude;
  final double longitude;

  const Location({required this.latitude, required this.longitude});

  Location copyWith({double? latitude, double? longitude}) {
    return Location(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    return {'latitude': latitude, 'longitude': longitude};
  }

  @override
  List<Object?> get props => [latitude, longitude];

  @override
  String toString() => 'Location(latitude: $latitude, longitude: $longitude)';
}
