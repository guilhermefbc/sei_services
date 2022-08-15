import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sei_services/src/modules/private/product/presentation/controller/product/product_controller.dart';
import 'package:sei_services/src/modules/private/product/presentation/widgets/items/product_item.dart';
import 'package:sei_services/src/modules/private/transaction/domain/entities/transaction_entity.dart';
import 'package:sei_services/src/modules/private/product/domain/repositories/products_repository.dart';
import 'package:sei_services/src/shared/presentation/widgets/default_header_widget.dart';
import 'package:sei_services/src/shared/util/monetary/monetary_formatter_util.dart';

class ProductOverviewScreen extends StatefulWidget {
  final TransactionEntity transaction;

  const ProductOverviewScreen({Key? key, required this.transaction})
      : super(key: key);

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  final ProductsRepository _products = Modular.get<ProductsRepository>();
  final ProductController _controller = Modular.get<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DefaultHeaderWidget(
          amount: widget.transaction.transactionAmount,
          taxes: widget.transaction.totalTaxes,
        ),
        centerTitle: true,
        toolbarHeight: 100.h,
      ),
      body: FutureBuilder(
          future: _products.getAllProducts(),
          builder: (ctx, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Observer(
              builder: (context) {
                _controller.addAllProducts(
                    _products.getProductsByTransactionId(
                        widget.transaction.transactionId
                    )
                );
                return ListView(
                  padding: const EdgeInsets.only(top: 10, bottom: 35).r,
                  children: _controller.products
                      .map<Widget>((product) => ProductItem(
                            transaction: widget.transaction,
                            product: product,
                          ))
                      .toList(),
                );
              },
            );
          }),
    );
  }
}
