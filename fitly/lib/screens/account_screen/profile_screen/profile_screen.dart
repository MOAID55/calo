import 'package:fitly/screens/account_screen/profile_screen/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';

class ProfileScreen extends HookWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controllerEmail = useTextEditingController();
    final controllerPassword = useTextEditingController(text: "12345678");
    final controllerName = useTextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text("Profile"), centerTitle: true, actions: []),
      body: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          context.loaderOverlay.hide();
          if (state is SaveButtonState) {
            context.pop(true);
          }
          if (state is NameEmpty) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(
                    "Validation Error",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  content: Text("Name cannot be empty"),
                  actions: [
                    TextButton(
                      onPressed: () => context.pop(),
                      child: Text("Ok"),
                    ),
                  ],
                );
              },
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          //this will do loadDataProfileEvery time because always close this page
          child: BlocBuilder<ProfileBloc, ProfileState>(
            buildWhen: (context, state) {
              if (state is LoadDataProfileState) {
                return true;
              }
              if (state is SaveButtonFailState) {
                return false;
              }
              return false;
            },
            builder: (context, state) {
              if (state is LoadDataProfileState) {
                if (controllerName.text != state.name ||
                    controllerEmail.text != state.email) {
                  controllerName.text = state.name;
                  controllerEmail.text = state.email;
                }
              }
              return SingleChildScrollView(
                child: Column(
                  spacing: 5,
                  crossAxisAlignment: .start,
                  children: [
                    Center(
                      child: CircleAvatar(
                        minRadius: 50,
                        maxRadius: 50,
                        backgroundColor: Colors.blueGrey,
                      ),
                    ),

                    Text("Name", style: TextStyle(fontWeight: .bold)),
                    TextFormField(
                      controller: controllerName,

                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                        hintText: "Name",
                      ),
                      onTapOutside: (value) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                    ),

                    Text("Email", style: TextStyle(fontWeight: .bold)),
                    TextFormField(
                      enabled: false,
                      controller: controllerEmail,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        prefixIcon: Icon(Icons.email),
                        hintText: "Email",
                      ),
                    ),
                    Text("Password", style: TextStyle(fontWeight: .bold)),
                    TextFormField(
                      controller: controllerPassword,
                      obscureText: true,
                      enabled: false,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        prefixIcon: Icon(Icons.password),
                        hintText: "Password",
                      ),
                    ),

                    TextButton(
                      onPressed: () {},
                      child: Text("Delete my account"),
                    ),

                    FilledButton(
                      onPressed: () {
                        context.loaderOverlay.show();
                        context.read<ProfileBloc>().add(
                          SaveButtonEvent(
                            email: controllerEmail.text,
                            password: controllerPassword.text,
                            name: controllerName.text,
                          ),
                        );
                      },
                      child: Center(child: Text("Save")),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
