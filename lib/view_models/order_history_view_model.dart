import 'package:get/get.dart';
import 'package:jewelry_ai/models/order.dart';

class OrderHistoryViewModel extends GetxController {
  final orders = <Order>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadOrders();
  }

  void loadOrders() {
    // Mock data matching the screenshot + additional items to demonstrate ListView
    orders.value = [
      Order(
        id: '1',
        productName: 'Floral Diamond Ring',
        orderId: '#ORD-9281',
        date: 'Today, 10:30 AM',
        status: OrderStatus.quotationReceived,
        imageUrl: 'assets/images/product_diamond_ring.jpg',
      ),
      Order(
        id: '2',
        productName: 'Royal Sapphire Pendant',
        orderId: '#ORD-8823',
        date: 'Oct 22, 2023',
        status: OrderStatus.inProduction,
        imageUrl: 'assets/images/product_sapphire_earrings.jpg',
      ),
      Order(
        id: '3',
        productName: 'Vintage Emerald Studs',
        orderId: '#ORD-7712',
        date: 'Oct 10, 2023',
        status: OrderStatus.delivered,
        imageUrl: 'assets/images/product_emerald_ring.jpg',
      ),
      Order(
        id: '4',
        productName: 'Rose Gold Cuff',
        orderId: '#REQ-2910',
        date: 'Oct 05, 2023',
        status: OrderStatus.quotationPending,
        imageUrl: 'assets/images/product_gold_necklace.jpg',
      ),
      Order(
        id: '5',
        productName: 'Custom Signet Ring',
        orderId: '#ORD-5541',
        date: 'Sep 28, 2023',
        status: OrderStatus.delivered,
        imageUrl: 'assets/images/product_diamond_ring.jpg',
      ),
      // Additional items
      Order(
        id: '6',
        productName: 'Pearl Drop Earrings',
        orderId: '#ORD-4432',
        date: 'Sep 15, 2023',
        status: OrderStatus.delivered,
        imageUrl: 'assets/images/product_sapphire_earrings.jpg',
      ),
      Order(
        id: '7',
        productName: 'Ruby Heart Necklace',
        orderId: '#REQ-2100',
        date: 'Aug 30, 2023',
        status: OrderStatus.quotationPending,
        imageUrl: 'assets/images/product_floral_pendant.jpg',
      ),
      Order(
        id: '8',
        productName: 'Platinum Wedding Band',
        orderId: '#ORD-1120',
        date: 'Aug 12, 2023',
        status: OrderStatus.delivered,
        imageUrl: 'assets/images/product_diamond_ring.jpg',
      ),
      Order(
        id: '9',
        productName: 'Amethyst Bracelet',
        orderId: '#ORD-0988',
        date: 'Jul 25, 2023',
        status: OrderStatus.inProduction,
        imageUrl: 'assets/images/product_gold_necklace.jpg',
      ),
      Order(
        id: '10',
        productName: 'Topaz Statement Ring',
        orderId: '#ORD-0554',
        date: 'Jul 10, 2023',
        status: OrderStatus.quotationReceived,
        imageUrl: 'assets/images/product_diamond_ring.jpg',
      ),
    ];
  }
}
