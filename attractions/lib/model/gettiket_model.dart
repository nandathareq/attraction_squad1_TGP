class GetTiketModel {
  final String bookingCode;
  final String placeName;
  final String ticketCode;
  final String attractionDate;

  GetTiketModel({
    required this.bookingCode,
    required this.placeName,
    required this.ticketCode,
    required this.attractionDate,
  });
}

class GetUserModel {
  final String userName;
  final String userEmail;
  final String userMobileNumber;

  GetUserModel({
    required this.userName,
    required this.userEmail,
    required this.userMobileNumber,
  });
}
