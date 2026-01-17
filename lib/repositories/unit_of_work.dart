import 'package:injectable/injectable.dart';
import 'package:user_manager/repositories/category_repository.dart';
import 'package:user_manager/repositories/order_repository.dart';
import 'package:user_manager/repositories/product_repository.dart';

@LazySingleton()
class UnitOfWork {
  final CategoryRepository categoryRepository;
  final ProductRepository productRepository;
  final OrderRepository orderRepository;

  UnitOfWork({
    required this.categoryRepository,
    required this.productRepository,
    required this.orderRepository,
  });
}
