abstract class PaymentStatus {
  static const String waiting = "waiting";
  static const String paid = "paid";
  static const String canceled = "canceled";

  static const List<String> paymentStatuses = [
    waiting,
    paid,
    canceled,
  ];
}
