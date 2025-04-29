import 'package:json_annotation/json_annotation.dart';

import '../../../profile/data/models/passenger.dart';
import '../../../search/data/models/flight.dart';
import '../../domain/entities/reservation.dart';

part 'reservation.g.dart';

@JsonSerializable(explicitToJson: true)
class ReservationModel {
  final int id;
  final FlightModel flight;
  final String date;
  final String status;
  final String number;
  @JsonKey(name: 'reservation_seats')
  final List<ReservationSeatModel> reservationSeats;

  ReservationModel({
    required this.id,
    required this.flight,
    required this.date,
    required this.status,
    required this.number,
    required this.reservationSeats,
  });

  factory ReservationModel.fromJson(Map<String, dynamic> json) =>
      _$ReservationModelFromJson(json);

  ReservationEntity toReservationEntity() => ReservationEntity(
        id: id,
        flight: flight.toFlightEntity(),
        date: date,
        status: status,
        reservationSeats: reservationSeats
            .map((reservationSeat) => reservationSeat.toReservationSeatEntity())
            .toList(),
        number: number,
      );
}

@JsonSerializable()
class ReservationSeatModel {
  final int id;
  final PassengerModel passenger;
  final SeatDetailsModel seat;

  ReservationSeatModel({
    required this.id,
    required this.passenger,
    required this.seat,
  });

  factory ReservationSeatModel.fromJson(Map<String, dynamic> json) =>
      _$ReservationSeatModelFromJson(json);
  Map<String, dynamic> toJson() => _$ReservationSeatModelToJson(this);

  ReservationSeatEntity toReservationSeatEntity() => ReservationSeatEntity(
      id: id,
      passenger: passenger.toPassengerEntity(),
      seat: seat.toSeatDetailsEntity());
}

@JsonSerializable()
class SeatDetailsModel {
  @JsonKey(name: 'seat_number')
  final String seatNumber;
  @JsonKey(name: 'seat_class')
  final String seatClass;
  @JsonKey(name: 'is_available')
  final bool isAvailable;

  SeatDetailsModel({
    required this.isAvailable,
    required this.seatNumber,
    required this.seatClass,
  });

  factory SeatDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$SeatDetailsModelFromJson(json);

  SeatDetailsEntity toSeatDetailsEntity() => SeatDetailsEntity(
        seatNumber: seatNumber,
        seatClass: seatClass,
        isAvailable: isAvailable,
      );
}
