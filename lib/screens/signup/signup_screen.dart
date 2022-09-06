import 'package:flutter/material.dart';
import 'package:rewards_app/screens/mainContainer/main_container.dart';
import 'package:rewards_app/screens/signup/signup_bloc.dart';
import 'package:rewards_app/shared_widgets/custom_button_widget.dart';
import 'package:rewards_app/shared_widgets/custom_textfield_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rewards_app/utils/custom_text_style.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final _bloc = SignUpBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Signup"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            CustomTextField(
              controller: _bloc.emailController,
              hintText: AppLocalizations.of(context)!.email_hint,
              keyboardType: TextInputType.emailAddress,
              errorMessage: "",
              prefixIcon: const Icon(Icons.email),
              onChange: (value) => _bloc.validateFields(),
            ),
            CustomTextField(
              controller: _bloc.fullNameController,
              hintText: AppLocalizations.of(context)!.name_hint,
              keyboardType: TextInputType.emailAddress,
              errorMessage: "",
              prefixIcon: const Icon(Icons.email),
              onChange: (value) => _bloc.validateFields(),
            ),
            CustomTextField(
              controller: _bloc.passwordController,
              hintText: AppLocalizations.of(context)!.password,
              errorMessage: "",
              prefixIcon: const Icon(Icons.password),
              onChange: (value) => _bloc.validateFields(),
            ),
            CustomTextField(
              controller: _bloc.repasswordController,
              hintText: AppLocalizations.of(context)!.repassword,
              keyboardType: TextInputType.emailAddress,
              errorMessage: "",
              prefixIcon: const Icon(Icons.password),
              onChange: (value) => _bloc.validateFields(),
            ),
            ValueListenableBuilder<bool>(
                valueListenable: _bloc.fieldsValidation,
                builder: (context, snapshot, child) {
                  return CustomButtonWidget(
                    title: "Submit",
                    enable: snapshot,
                    onPress: () async {
                      await _bloc.signUp().then((value) {
                        if (value) {
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx) {
                            return MainContainer();
                          }), (route) => false);
                        }
                      });
                    },
                  );
                }),
            ValueListenableBuilder<signUpStatusEnum>(
                valueListenable: _bloc.signupStatus,
                builder: (context, snapshot, child) {
                  if (snapshot == signUpStatusEnum.faild) {
                    return Text("Error in Email or password", style: CustomTextStyle().regular(color: Colors.red, size: 18));
                  } else if (snapshot == signUpStatusEnum.inProgress) {
                    return const CircularProgressIndicator();
                  } else {
                    return Container();
                  }
                }),
          ],
        ),
      ),
    );
  }
}
