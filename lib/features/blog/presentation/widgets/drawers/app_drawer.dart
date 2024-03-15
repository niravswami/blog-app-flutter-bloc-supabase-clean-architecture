import 'package:blog_bloc_app/core/common/widgets/loader.dart';
import 'package:blog_bloc_app/core/utils/show_snackbar.dart';
import 'package:blog_bloc_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:blog_bloc_app/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthLogoutFailure) {
              showSnackBar(context, state.message);
            } else if (state is AuthLogoutSuccess) {
              Navigator.pushAndRemoveUntil(
                context,
                LoginPage.route(),
                (route) => false,
              );
            }
          },
          builder: (context, state) {
            if (state is AuthLogoutLoading) {
              return const Loader();
            }
            return Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.account_circle),
                  title: const Text("Profile"),
                  onTap: () => {},
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text("Settings"),
                  onTap: () => {},
                ),
                ListTile(
                  leading: const Icon(Icons.logout_outlined),
                  title: const Text("Logout"),
                  onTap: () {
                    context.read<AuthBloc>().add(AuthLogout());
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
    ;
  }
}
