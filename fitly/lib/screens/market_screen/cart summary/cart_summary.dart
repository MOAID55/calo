import 'package:fitly/models/cart_model/cart_model.dart';
import 'package:fitly/widgets/customer_service_widgets/customer_service_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:input_quantity/input_quantity.dart';

class CartSummary extends StatelessWidget {
  const CartSummary({super.key, required this.cart});
  final List<CartModel> cart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 8,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: .bottomEnd,
            end: .bottomStart,
            colors: [Colors.green, Colors.white],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: .center,
            mainAxisAlignment: .spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: .bold,
                  ),
                  children: [
                    TextSpan(
                      text:
                          "${(cart.fold(0.0, (sum, price) => sum + price.product.price)).toStringAsFixed(2)} ${cart[0].product.currency} \n",
                    ),
                    TextSpan(text: "VAT inclusive"),
                  ],
                ),
              ),
              FilledButton(
                style: FilledButton.styleFrom(fixedSize: Size(200, 70)),
                onPressed: () {},
                child: Text("Continue"),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("My Cart"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              child: IconButton(
                icon: Icon(Icons.headset_mic_outlined),
                onPressed: () {
                  CustomerServiceWidget.show(context);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              child: IconButton(
                icon: Icon(Icons.cancel),
                onPressed: () {
                  context.pop();
                },
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          scrollDirection: .vertical,
          itemCount: cart.length,
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemBuilder: (context, index) {
            final carts = cart[index].product;
            return ListTile(
              leading: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300, width: 2),
                ),
                child: Image.network(carts.image, fit: .fill),
              ),
              title: Text(
                carts.name,
                style: TextStyle(fontWeight: .bold),
                maxLines: 1,
                overflow: .ellipsis,
              ),
              subtitle: Text("${carts.price} ${carts.currency}"),
              trailing: InputQty.int(
                decoration: QtyDecorationProps(
                  borderShape: BorderShapeBtn.circle,
                  btnColor: Colors.green,
                  fillColor: Colors.white,
                  isBordered: false,
                ),
                initVal: carts.quantity,
                qtyFormProps: QtyFormProps(enableTyping: false),

                steps: 0,
              ),
            );
          },
        ),
      ),
    );
  }
}
