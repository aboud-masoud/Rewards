import 'package:flutter/material.dart';
import 'package:rewards_app/screens/signup/signup_bloc.dart';
import 'package:rewards_app/screens/signup/widgets/header_view.dart';
import 'package:rewards_app/screens/signup/widgets/step1_view.dart';
import 'package:rewards_app/shared_widgets/custom_button_widget.dart';
import 'package:rewards_app/shared_widgets/custom_textfield_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rewards_app/utils/custom_text.dart';
import 'package:rewards_app/utils/custom_text_style.dart';

enum signupStatusEnum { language, stammering }

class SignUpScreen extends StatelessWidget {
  final signupStatusEnum signupStatus;
  SignUpScreen({required this.signupStatus, Key? key}) : super(key: key);

  final _bloc = SignUpBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfff9f9f9),
        appBar: AppBar(
          title: CustomText(
            title: AppLocalizations.of(context)!.signup,
            style: CustomTextStyle().semibold(size: 16, color: const Color(0xff707070)),
          ),
          backgroundColor: const Color(0xfff9f9f9),
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Image.asset(
                  "assets/images/chat.png",
                  width: 20,
                ))
          ],
        ),
        body: ValueListenableBuilder<int>(
            valueListenable: _bloc.stepNumberNotifier,
            builder: (context, snapshot, child) {
              return Column(
                children: [
                  SizedBox(height: 68, child: HeaderView(bloc: _bloc)),
                  Expanded(
                    child: SingleChildScrollView(child: Step1View(bloc: _bloc)),
                  )
                ],
              );
            })

        // SingleChildScrollView(
        //   child: Column(
        //     children: [
        //       const SizedBox(height: 20),
        //       CustomTextField(
        //         controller: _bloc.emailController,
        //         hintText: AppLocalizations.of(context)!.email_hint,
        //         keyboardType: TextInputType.emailAddress,
        //         prefixIcon: const Icon(Icons.email),
        //         onChange: (value) => _bloc.validateFields(),
        //       ),

        //       ValueListenableBuilder<bool>(
        //           valueListenable: _bloc.fieldsValidation,
        //           builder: (context, snapshot, child) {
        //             return CustomButtonWidget(
        //               title: AppLocalizations.of(context)!.submit,
        //               enable: snapshot,
        //               onPress: () async {
        //                 await _bloc.signUp().then((value) {
        //                   if (value) {
        //                     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx) {
        //                       return MainContainer();
        //                     }), (route) => false);
        //                   }
        //                 });
        //               },
        //             );
        //           }),
        //       ValueListenableBuilder<signUpStatusEnum>(
        //           valueListenable: _bloc.signupStatus,
        //           builder: (context, snapshot, child) {
        //             if (snapshot == signUpStatusEnum.faild) {
        //               return Text(AppLocalizations.of(context)!.errorInEmailOrPassword,
        //                   style: CustomTextStyle().regular(color: Colors.red, size: 18));
        //             } else if (snapshot == signUpStatusEnum.inProgress) {
        //               return const CircularProgressIndicator();
        //             } else {
        //               return Container();
        //             }
        //           }),
        //     ],
        //   ),
        // ),
        );
  }
}
