class TransactionHistory{
  int orderId;
  int reservationId;
  int deliveryId;
  int productId;
  int userId;
  int orderDetailsId;


  TransactionHistory({
    required this.orderId,
    required this.reservationId,
    required this.deliveryId,
    required this.productId,
    required this.userId,
    required this.orderDetailsId,});

  factory TransactionHistory.fromJson(Map<String, dynamic> json){
    return switch(json){
      {
      'orderId' : int orderId,
      'reservationId' : int reservationId,
      'deliveryId' : int deliveryId,
      'productId' : int productId,
      'userId' : int userId,
      'orderDetailsId' : int orderDetailsId,
      } =>
          TransactionHistory(
            orderId:  orderId,
            reservationId: reservationId,
            deliveryId: deliveryId,
            productId: productId,
            userId: userId,
            orderDetailsId: orderDetailsId,
          ),
      _ => throw const FormatException('Failed to load products')
    };
  }
}