import 'package:fitly/models/category_model/product_model.dart';
import 'package:fitly/screens/market_screen/market_screen/bloc/market_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:input_quantity/input_quantity.dart';

class CardDisplayMarketWidget extends StatelessWidget {
  const CardDisplayMarketWidget({
    super.key,
    required this.product,
    required this.index,
  });
  
  final ProductModel product;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      clipBehavior: .antiAlias,
      elevation: 1,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              alignment: .bottomRight,
              children: [
                SizedBox.expand(
                  child: Image.network(product.image, fit: BoxFit.fill),
                ),
                BlocBuilder<MarketBloc, MarketState>(
                  buildWhen: (context, state) {
                    if (state is MoveToProductPageState) {
                      return false;
                    }
                    if (state is MarketLoaded) {
                      false;
                    }
                    return true;
                  },
                  builder: (context, state) {
                    if (state is MarketLoaded) {
                      if (product.quantity > 0) {
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: InputQty.int(
                            decoration: QtyDecorationProps(
                              btnColor: Colors.green,
                              fillColor: Colors.grey.shade100,
                              isBordered: false,
                              
                            ),
                            qtyFormProps: QtyFormProps(enableTyping: false),
                            maxVal: 100,
                            initVal: product.quantity,
                            minVal: 0,
                            steps: 1,
                            onQtyChanged: (val) {
                              if (val < product.quantity) {
                                context.read<MarketBloc>().add(
                                  DecrementQuantityEvent(
                                    productIndex: index,
                                    product: product,
                                  ),
                                );
                              }
                              if (val > product.quantity) {
                                context.read<MarketBloc>().add(
                                  IncrementQuantityEvent(
                                    productIndex: index,
                                    product: product,
                                  ),
                                );
                              }
                            },
                          ),
                        );
                      }
                      if (product.quantity < 1) {
                        return InkWell(
                          onTap: () {
                            context.read<MarketBloc>().add(
                              IncrementQuantityEvent(
                                productIndex: index,
                                product: product,
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              border: Border.all(color: Colors.grey.shade100),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            width: 35,
                            height: 35,
                            margin: EdgeInsets.all(16),
                            child: Center(child: Icon(Icons.add, size: 15)),
                          ),
                        );
                      }
                    }
                    return SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(color: Colors.white),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: .stretch,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(fontSize: 15, fontWeight: .bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "${product.nutrition.totalCalories} kcal",
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  Spacer(),
                  Text(
                    "${product.price} ${product.currency}",
                    style: TextStyle(fontSize: 16, fontWeight: .bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
