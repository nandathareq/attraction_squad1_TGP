class ReservationModel {
  final String bookingCode;
  final double total;
  final List<dynamic> items;

  ReservationModel({
    required this.bookingCode,
    required this.total,
    required this.items,
  });
}
