import 'package:equatable/equatable.dart';

import 'location.dart';

class BookRide extends Equatable {
  final Location? pickup;
  final Location? destination;
  final int passengers;
  final DateTime? date;

  const BookRide({
    this.pickup,
    this.destination,
    this.date,
    this.passengers = 0,
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
      pickup: json['pickup'] != null ? Location.fromJson(json['pickup']) : null,
      destination:
          json['destination'] != null
              ? Location.fromJson(json['destination'])
              : null,
      passengers: json['passengers'] as int? ?? 0,
      date: DateTime.tryParse(json['date'] as String? ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pickup': pickup?.toJson(),
      'destination': destination?.toJson(),
      'passengers': passengers,
      'date': date?.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [pickup, destination, passengers, date];

  @override
  String toString() =>
      'BookRide(pickup: $pickup, destination: $destination, passengers: $passengers, date: $date)';
}
