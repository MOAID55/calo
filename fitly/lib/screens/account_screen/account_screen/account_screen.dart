import 'package:fitly/routes/route_key.dart';
import 'package:fitly/screens/account_screen/account_screen/bloc/account_bloc.dart';
import 'package:fitly/widgets/account_screen_widget/container_account_widget.dart';
import 'package:fitly/widgets/customer_service_widgets/customer_service_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account"),

        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              child: IconButton(
                icon: Icon(Icons.settings_outlined),
                onPressed: () {},
              ),
            ),
          ),
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
      body: BlocListener<AccountBloc, AccountState>(
        listener: (context, state) {
          if (state is SignOutState) {
            context.go(RouteKey.loginScreen);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 25,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: kElevationToShadow[0.9],
                  border: Border.all(width: 2, color: Colors.grey.shade300),
                ),
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: Center(
                  child: ListTile(
                    onTap: () async {
                      final bloc = context.read<AccountBloc>();  // here i save to bloc avoid maybe dispose this page
                      final result = await context.push(RouteKey.profileScreen);
                      if (result == true) {
                        bloc.add(LoadedDataEvent());
                      }
                    },
                    leading: CircleAvatar(minRadius: 30, maxRadius: 30),
                    title: BlocBuilder<AccountBloc, AccountState>(
                      builder: (context, state) {
                        if (state is LoadDataState) {
                          return Text(state.name);
                        }
                        return SizedBox.shrink();
                      },
                    ),
                    subtitle: Text("24"),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                  ),
                ),
              ),
              ContainerAccountWidget(
                icon: Icon(Icons.notifications_none_rounded),
                title: "Notification Settings",
              ),
              ContainerAccountWidget(
                icon: Icon(Icons.settings),
                title: "Account Settings",
              ),
              ContainerAccountWidget(
                icon: Icon(Icons.privacy_tip_outlined),
                title: "About App",
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  fixedSize: Size.fromHeight(50),
                  elevation: 5,
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(8),
                  ),
                ),
                onPressed: () {
                  context.read<AccountBloc>().add(SignOutEvent());
                },
                child: Center(
                  child: Text(
                    "LOG OUT",
                    style: Theme.of(context).textTheme.titleSmall,
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
