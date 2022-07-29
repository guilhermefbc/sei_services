import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sei_services/src/modules/private/product/presentation/widgets/items/product_item.dart';
import 'package:sei_services/src/shared/domain/entities/transaction_entity.dart';
import 'package:sei_services/src/shared/domain/repositories/products_repository.dart';

class ProductOverviewScreen extends StatefulWidget {
  final TransactionEntity transaction;
  const ProductOverviewScreen({Key? key, required this.transaction}) : super(key: key);

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  final ProductsRepository _products = Modular.get<ProductsRepository>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: _products.getProductsByTransactionId(widget.transaction.transactionId),
          builder: (ctx, snapshot) {
            if(!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator(),);
            }
            List list = snapshot.data as List;
            return ListView(
              padding: const EdgeInsets.only(top: 10, bottom: 35).r,
              children: list.map<Widget>((product) => ProductItem(transaction: widget.transaction, product: product,)).toList(),
            );
          }
      ),
    );
  }
}
