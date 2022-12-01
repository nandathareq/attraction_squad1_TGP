class InvoiceModel {
  final int id;
  final int grandInvoiceId;
  final double total;
  final String bookingCode;
  final String raisedDate;
  final String status;

  InvoiceModel({
    required this.id,
    required this.grandInvoiceId,
    required this.total,
    required this.bookingCode,
    required this.raisedDate,
    required this.status,
  });
}
