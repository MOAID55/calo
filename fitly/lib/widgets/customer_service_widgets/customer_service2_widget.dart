import 'package:fitly/core/const_color/const_color.dart';
import 'package:fitly/widgets/customer_service_widgets/list_tile_widgets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';


class CustomerService2Widget extends StatelessWidget {
  const CustomerService2Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: .topCenter,
          end: .bottomCenter,
          colors: [Colors.green, ConstColor.containerColor],
        ),
      ),
      height: MediaQuery.of(context).size.height / 1.1,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 10,
            crossAxisAlignment: .start,
            children: [
              Row(
                children: [
                  Text(
                    "CALO",
                    style: TextStyle(
                      fontFamily: "Times New Roman",
                      fontSize: 28,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  CircleAvatar(maxRadius: 20, minRadius: 20),
                  CircleAvatar(maxRadius: 20, minRadius: 20),
                  CircleAvatar(maxRadius: 20, minRadius: 20),
                  IconButton(
                    onPressed: () {
                      context.pop(context);
                    },
                    icon: Icon(Icons.cancel, size: 50),
                  ),
                ],
              ),
              Gap(30),
              Text("Hi Moaid",style: Theme.of(context).textTheme.titleLarge),
              Text("How can we help?", style: Theme.of(context).textTheme.titleLarge),
              Container(
                width: MediaQuery.widthOf(context),
                decoration: BoxDecoration(
                  color: ConstColor.containerColor,
                  borderRadius: .circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Text("Messages", style: TextStyle(fontWeight: .bold)),
                          Icon(Icons.message),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Text("Help", style: TextStyle(fontWeight: .bold)),
                          Icon(Icons.help),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: ConstColor.containerColor,
                  borderRadius: .circular(16),
                ),
                child: ListTile(
                  title: Text(
                    "Send us a message",
                    style: TextStyle(fontWeight: .bold),
                  ),
                  subtitle: Text("We typically reply in a few minutes"),
                  trailing: Icon(Icons.send),
                ),
              ),
              Container(
                width: MediaQuery.widthOf(context),
                decoration: BoxDecoration(
                  color: ConstColor.containerColor,
                  borderRadius: .circular(16),
                ),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.search),
                        hintText: "Search for help",
                        border: OutlineInputBorder(borderRadius: .circular(16)),
                      ),

                      onTapOutside: (value) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                    ),
                    ListTileWidgets(
                      leading: Icon(Icons.abc_sharp),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                      title: "How do I change the app language?",
                    ),
                    ListTileWidgets(
                      leading: Icon(Icons.dining),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                      title: "How can I change my meal?",
                    ),
                    ListTileWidgets(
                      leading: Icon(Icons.night_shelter),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                      title: "Ramadan menu",
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.widthOf(context),
                decoration: BoxDecoration(
                  color: ConstColor.containerColor,
                  borderRadius: .circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    spacing: 5,
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        "Create a Ticket",
                        style: TextStyle(fontWeight: .bold, fontSize: 17),
                      ),
                      Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Text(
                            "Request a Call",
                            style: TextStyle(fontWeight: .bold),
                          ),
                          Icon(Icons.phone),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
