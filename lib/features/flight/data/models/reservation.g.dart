// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservationModel _$ReservationModelFromJson(Map<String, dynamic> json) =>
    ReservationModel(
      id: (json['id'] as num).toInt(),
      flight: FlightModel.fromJson(json['flight'] as Map<String, dynamic>),
      date: json['date'] as String,
      status: json['status'] as String,
      number: json['number'] as String,
      reservationSeats: (json['reservation_seats'] as List<dynamic>)
          .map((e) => ReservationSeatModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReservationModelToJson(ReservationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'flight': instance.flight.toJson(),
      'date': instance.date,
      'status': instance.status,
      'number': instance.number,
      'reservation_seats':
          instance.reservationSeats.map((e) => e.toJson()).toList(),
    };

ReservationSeatModel _$ReservationSeatModelFromJson(
        Map<String, dynamic> json) =>
    ReservationSeatModel(
      id: (json['id'] as num).toInt(),
      passenger:
          PassengerModel.fromJson(json['passenger'] as Map<String, dynamic>),
      seat: SeatDetailsModel.fromJson(json['seat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReservationSeatModelToJson(
        ReservationSeatModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'passenger': instance.passenger,
      'seat': instance.seat,
    };

SeatDetailsModel _$SeatDetailsModelFromJson(Map<String, dynamic> json) =>
    SeatDetailsModel(
      isAvailable: json['is_available'] as bool,
      seatNumber: json['seat_number'] as String,
      seatClass: json['seat_class'] as String,
    );

Map<String, dynamic> _$SeatDetailsModelToJson(SeatDetailsModel instance) =>
    <String, dynamic>{
      'seat_number': instance.seatNumber,
      'seat_class': instance.seatClass,
      'is_available': instance.isAvailable,
    };
