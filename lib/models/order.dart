enum OrderStatus {
  quotationReceived,
  inProduction,
  delivered,
  quotationPending,
}

class Order {
  final String id;
  final String productName;
  final String orderId;
  final String date;
  final OrderStatus status;
  final String imageUrl;

  Order({
    required this.id,
    required this.productName,
    required this.orderId,
    required this.date,
    required this.status,
    required this.imageUrl,
  });
}
