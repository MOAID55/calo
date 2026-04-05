import 'package:fitly/routes/route_key.dart';
import 'package:fitly/screens/market_screen/market_screen/bloc/market_bloc.dart';
import 'package:fitly/widgets/market_screen_widgets/card_display_market_widget.dart';
import 'package:fitly/widgets/market_screen_widgets/container_category_widget.dart';
import 'package:fitly/widgets/customer_service_widgets/customer_service_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MarketScreen extends StatelessWidget {
  MarketScreen({super.key});
  final ItemScrollController itemScrollController = ItemScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Market"),
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
        ],
      ),
      bottomNavigationBar: BlocBuilder<MarketBloc, MarketState>(
        buildWhen: (context, state) => state is MarketLoaded,
        builder: (context, state) {
          if (state is MarketLoaded && state.totalPrice > 0) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FilledButton(
                  onPressed: () {
                    context.push(
                      RouteKey.cartSummaryScreen,
                      extra: state.cartItems,
                    );
                  },
                  child: Text("Total ${state.totalPrice} SAR"),
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
      body: BlocListener<MarketBloc, MarketState>(
        listener: (context, state) {
          if (state is MoveToProductPageState) {
            context.push(RouteKey.productScreen, extra: state.product);
          }
        },
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              height: 170,
              color: Colors.white,
              child: Column(
                spacing: 10,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  BlocBuilder<MarketBloc, MarketState>(
                    buildWhen: (context, state) {
                      if (state is MoveToProductPageState) {
                        return false;
                      }
                      return true;
                    },
                    builder: (context, state) {
                      if (state is MarketInitial) {
                        return Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      }
                      if (state is MarketLoaded) {
                        return SizedBox(
                          height: 60,
                          child: ListView.builder(
                            padding: const EdgeInsets.all(4.0),
                            scrollDirection: .horizontal,
                            itemCount: state.categoryList.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  itemScrollController.scrollTo(
                                    index: index,
                                    duration: Duration(milliseconds: 400),
                                    curve: Curves.easeInOut,
                                  );
                                },
                                child: Row(
                                  children: [
                                    Gap(5),
                                    ContainerCategoryWidget(
                                      title: state.categoryList[index].name,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      }
                      return SizedBox.shrink();
                    },
                  ),
                ],
              ),
            ),
            Gap(10),
            Expanded( // take remaining space
              child: BlocBuilder<MarketBloc, MarketState>(
                buildWhen: (context, state) {
                  if (state is MoveToProductPageState) {
                    return false;
                  }
                  return true;
                },
                builder: (context, state) {
                  if (state is MarketInitial) {
                    return Center(child: CircularProgressIndicator.adaptive());
                  }
                  if (state is MarketLoaded) {
                    return Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewPadding.bottom + 16,
                      ),
                      child: ScrollablePositionedList.builder(
                        itemScrollController: itemScrollController,
                        itemCount: state.categoryList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.categoryList[index].name,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Gap(10),
                                GridView.builder(
                                  shrinkWrap: true, // don't take space
                                  physics: NeverScrollableScrollPhysics(), //disable scrolling
                                  itemCount:
                                      state.categoryList[index].products.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 9,
                                        mainAxisSpacing: 9,
                                        childAspectRatio: 0.75,
                                       
                                      ),
                                  itemBuilder: (context, productIndex) {
                                    final product = state
                                        .categoryList[index]
                                        .products[productIndex];
                                    return InkWell(
                                      onTap: () {
                                        context.read<MarketBloc>().add(
                                          MoveToProductPageEvent(
                                            product: product,
                                          ),
                                        );
                                      },
                                      child: CardDisplayMarketWidget(
                                        product: product,
                                        index: productIndex,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  }
                  return SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
