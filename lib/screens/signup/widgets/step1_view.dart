import 'package:flutter/material.dart';
import 'package:rewards_app/screens/signup/signup_bloc.dart';
import 'package:rewards_app/shared_widgets/custom_button_widget.dart';
import 'package:rewards_app/shared_widgets/custom_textfield_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Step1View extends StatelessWidget {
  final SignUpBloc bloc;

  const Step1View({required this.bloc, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: bloc.fullNameController,
          hintText: AppLocalizations.of(context)!.name_hint,
          keyboardType: TextInputType.name,
          prefixIcon: const Icon(Icons.person),
          onChange: (value) => bloc.validateFields(),
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: bloc.dateOfBirthController,
          hintText: AppLocalizations.of(context)!.dateofBirth,
          keyboardType: TextInputType.datetime,
          prefixIcon: const Icon(Icons.date_range),
          onChange: (value) => bloc.validateFields(),
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: bloc.nationalityController,
          hintText: AppLocalizations.of(context)!.nationality,
          keyboardType: TextInputType.name,
          prefixIcon: const Icon(Icons.nature_outlined),
          onChange: (value) => bloc.validateFields(),
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: bloc.genderController,
          hintText: AppLocalizations.of(context)!.gender,
          keyboardType: TextInputType.name,
          prefixIcon: const Icon(Icons.type_specimen),
          onChange: (value) => bloc.validateFields(),
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: bloc.addressController,
          hintText: AppLocalizations.of(context)!.address,
          keyboardType: TextInputType.name,
          prefixIcon: const Icon(Icons.location_city),
          onChange: (value) => bloc.validateFields(),
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: bloc.usedLanguageController,
          hintText: AppLocalizations.of(context)!.usedlanguagewiththeclientathome,
          keyboardType: TextInputType.name,
          prefixIcon: const Icon(Icons.language),
          onChange: (value) => bloc.validateFields(),
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: bloc.mobileNumberController,
          hintText: AppLocalizations.of(context)!.mobileNumber,
          keyboardType: TextInputType.phone,
          prefixIcon: const Icon(Icons.phone),
          onChange: (value) => bloc.validateFields(),
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: bloc.parentOcupationController,
          hintText: AppLocalizations.of(context)!.parentsoccupation,
          keyboardType: TextInputType.name,
          prefixIcon: const Icon(Icons.person),
          onChange: (value) => bloc.validateFields(),
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: bloc.hisrankController,
          hintText: AppLocalizations.of(context)!.siblingsandhisrank,
          keyboardType: TextInputType.name,
          prefixIcon: const Icon(Icons.percent),
          onChange: (value) => bloc.validateFields(),
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: bloc.kinshipController,
          hintText: AppLocalizations.of(context)!.isthereanykinshipbetweenparents,
          keyboardType: TextInputType.name,
          prefixIcon: const Icon(Icons.arrow_circle_down_sharp),
          onChange: (value) => bloc.validateFields(),
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: bloc.foundCountactController,
          hintText: AppLocalizations.of(context)!.youfoundcontactusvia,
          keyboardType: TextInputType.text,
          prefixIcon: const Icon(Icons.contact_page),
          onChange: (value) => bloc.validateFields(),
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: bloc.emailController,
          hintText: AppLocalizations.of(context)!.email_hint,
          keyboardType: TextInputType.emailAddress,
          prefixIcon: const Icon(Icons.email),
          onChange: (value) => bloc.validateFields(),
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: bloc.passwordController,
          hintText: AppLocalizations.of(context)!.password,
          keyboardType: TextInputType.name,
          prefixIcon: const Icon(Icons.password),
          onChange: (value) => bloc.validateFields(),
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: bloc.repasswordController,
          hintText: AppLocalizations.of(context)!.repassword,
          keyboardType: TextInputType.name,
          prefixIcon: const Icon(Icons.password),
          onChange: (value) => bloc.validateFields(),
        ),
        const SizedBox(height: 16),
        CustomButtonWidget(
          title: AppLocalizations.of(context)!.next,
          isButtonRounded: true,
          backgroundColor: const Color(0xff419aff),
          onPress: () {
            bloc.stepNumberNotifier.value = bloc.stepNumberNotifier.value + 1;
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
