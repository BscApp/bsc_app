
class Reservation {
  final String userId;
  final int age;
  final String parentId;
  final String roomNumber;
  final DateTime checkIn;
  final DateTime checkOut;
  final String haubergeId;
  final NatureReservation natureReservation;
  final int restauration;
  final ReservationStatus status;

  Reservation({
    required this.userId,
    required this.age,
    required this.parentId,
    required this.roomNumber,
    required this.checkIn,
    required this.checkOut,
    required this.haubergeId,
    required this.natureReservation,
    required this.restauration,
    required this.status,
  });

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'age': age,
      'parent_ID': parentId,
      'room_number': roomNumber,
      'check_in': checkIn.toIso8601String(),
      'check_out': checkOut.toIso8601String(),
      'haubergeId': haubergeId,
      'nature_reservation': natureReservation.name,
      'restauration': restauration,
      'status': status.name,
    };
  }

  // Create from JSON
  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      userId: json['user_id'],
      age: json['age'],
      parentId: json['parent_ID'],
      roomNumber: json['room_number'],
      checkIn: DateTime.parse(json['check_in']),
      checkOut: DateTime.parse(json['check_out']),
      haubergeId: json['haubergeId'],
      natureReservation: NatureReservation.values.firstWhere(
          (e) => e.name == json['nature_reservation']),
      restauration: json['restauration'],
      status: ReservationStatus.values
          .firstWhere((e) => e.name == json['status']),
    );
  }
}

// Enum for NatureReservation
enum NatureReservation {
  Gratuit,
  Payant,
  Restauration,
}

// Enum for ReservationStatus
enum ReservationStatus {
  enAttente,
  reside,
  termine,
}
