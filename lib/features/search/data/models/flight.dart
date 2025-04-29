import 'package:json_annotation/json_annotation.dart';

import '../../../home/data/models/airport.dart';
import '../../domain/entities/flight.dart';
import 'airline.dart';

part 'flight.g.dart';

@JsonSerializable()
class FlightModel {
  final int id;
  @JsonKey(name: 'flight_number')
  final String flightNumber;
  @JsonKey(name: 'flight_status')
  final String flightStatus;
  final AirlineModel airline;
  final FlightDetailsModel departure;
  final FlightDetailsModel arrival;
  final String price;
  @JsonKey(name: 'travel_insurance_price')
  final String travelInsurancePrice;
  @JsonKey(name: 'tax_price')
  final String taxPrice;

  FlightModel({
    required this.id,
    required this.flightNumber,
    required this.flightStatus,
    required this.airline,
    required this.departure,
    required this.arrival,
    required this.price,
    required this.travelInsurancePrice,
    required this.taxPrice,
  });
  factory FlightModel.fromJson(Map<String, dynamic> json) =>
      _$FlightModelFromJson(json);

  Map<String, dynamic> toJson() => _$FlightModelToJson(this);


  FlightEntity toFlightEntity() => FlightEntity(
        id: id,
        flightNumber: flightNumber,
        flightStatus: flightStatus,
        airline: airline.toAirlineEntity(),
        departure: departure.toFlightDetailsEntity(),
        arrival: arrival.toFlightDetailsEntity(),
        price: price,
        travelInsurancePrice: travelInsurancePrice,
        taxPrice: taxPrice,
      );
}

@JsonSerializable()
class FlightDetailsModel {
  final AirportModel airport;
  final String terminal;
  final String gate;
  final DateTime date;

  FlightDetailsModel({
    required this.airport,
    required this.terminal,
    required this.gate,
    required this.date,
  });

  factory FlightDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$FlightDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$FlightDetailsModelToJson(this);

  FlightDetailsEntity toFlightDetailsEntity() => FlightDetailsEntity(
        airport: airport.toAirportEntity(),
        terminal: terminal,
        gate: gate,
        date: date,
      );
}
