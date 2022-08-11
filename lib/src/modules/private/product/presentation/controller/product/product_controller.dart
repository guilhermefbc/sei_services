import 'package:mobx/mobx.dart';
import 'package:sei_services/src/modules/private/product/domain/entities/product_entity.dart';
part 'product_controller.g.dart';

class ProductController = _ProductController with _$ProductController;

abstract class _ProductController with Store {
  List<ProductEntity> products = ObservableList<ProductEntity>();


  @action
  void addAllProducts(List<ProductEntity> values) {
    products.clear();
    products.addAll(values);
  }

  @action
  void removeProduct(ProductEntity value) {
    products.remove(value);
  }
}