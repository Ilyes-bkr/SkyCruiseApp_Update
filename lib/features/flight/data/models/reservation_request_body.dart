import 'package:json_annotation/json_annotation.dart';

part 'reservation_request_body.g.dart';

@JsonSerializable()
class ReservationRequestBody {
  int flight;
  String status;
  @JsonKey(name: 'reservation_seats')
  List<ReservationSeatRequestBody> reservationSeats;

  ReservationRequestBody({
    required this.flight,
    required this.status,
    required this.reservationSeats,
  });

  Map<String, dynamic> toJson() => _$ReservationRequestBodyToJson(this);
}

@JsonSerializable()
class ReservationSeatRequestBody {
  int passenger;
  @JsonKey(name: 'seat_number')
  String seatNumber;
  @JsonKey(name: 'seat_class')
  String seatClass;

  ReservationSeatRequestBody({
    required this.passenger,
    required this.seatNumber,
    required this.seatClass,
  });
  factory ReservationSeatRequestBody.fromJson(Map<String, dynamic> json) =>
      _$ReservationSeatRequestBodyFromJson(json);
  Map<String, dynamic> toJson() => _$ReservationSeatRequestBodyToJson(this);
}
