import 'package:flutter/material.dart';
import 'package:rewards_app/screens/login/login_bloc.dart';
import 'package:rewards_app/shared_widgets/custom_textfield_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final _bloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Image.asset(
            "assets/images/logo.jpg",
            width: 300,
          ),
          CustomTextField(
            controller: _bloc.emailController,
            hintText: AppLocalizations.of(context)!.email_hint,
            errorMessage: "",
            prefixIcon: const Icon(Icons.email),
          ),
          CustomTextField(
            controller: _bloc.passwordController,
            hintText: AppLocalizations.of(context)!.password,
            obscureText: true,
            errorMessage: "",
            prefixIcon: const Icon(Icons.password),
          ),
        ],
      ),
    ));
  }
}
