import 'package:equatable/equatable.dart';

import 'location.dart';

class BookRide extends Equatable {
  final Location pickup;
  final Location destination;
  final int passengers;
  final DateTime date;

  const BookRide({
    required this.pickup,
    required this.destination,
    required this.passengers,
    required this.date,
  });

  BookRide copyWith({
    Location? pickup,
    Location? destination,
    int? passengers,
    DateTime? date,
  }) {
    return BookRide(
      pickup: pickup ?? this.pickup,
      destination: destination ?? this.destination,
      passengers: passengers ?? this.passengers,
      date: date ?? this.date,
    );
  }

  factory BookRide.fromJson(Map<String, dynamic> json) {
    return BookRide(
      pickup: Location.fromJson(json['pickup']),
      destination: Location.fromJson(json['destination']),
      passengers: json['passengers'] as int,
      date: DateTime.parse(json['date'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pickup': pickup.toJson(),
      'destination': destination.toJson(),
      'passengers': passengers,
      'date': date.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [pickup, destination, passengers, date];

  @override
  String toString() =>
      'BookRide(pickup: $pickup, destination: $destination, passengers: $passengers, date: $date)';
}
