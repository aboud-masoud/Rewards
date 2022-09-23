import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rewards_app/screens/signup/signup_bloc.dart';
import 'package:rewards_app/shared_widgets/custom_button_widget.dart';
import 'package:rewards_app/shared_widgets/custom_textfield_dropdown_widget.dart';
import 'package:rewards_app/shared_widgets/custom_textfield_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rewards_app/utils/custom_text_style.dart';
import 'package:rewards_app/utils/global_value.dart';

class Step1View extends StatefulWidget {
  final SignUpBloc bloc;

  const Step1View({required this.bloc, Key? key}) : super(key: key);

  @override
  State<Step1View> createState() => _Step1ViewState();
}

class _Step1ViewState extends State<Step1View> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),

        CustomTextField(
          controller: widget.bloc.fullNameController,
          hintText: AppLocalizations.of(context)!.name_hint,
          keyboardType: TextInputType.name,
          prefixIcon: const Icon(Icons.person),
          onChange: (value) => widget.bloc.validateFields(),
        ),
        const SizedBox(height: 16),
        CustomTextField(
            controller: widget.bloc.dateOfBirthController,
            readOnly: true,
            hintText: AppLocalizations.of(context)!.dateofBirth,
            keyboardType: TextInputType.datetime,
            prefixIcon: const Icon(Icons.date_range),
            onChange: (value) => widget.bloc.validateFields(),
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime(2101));
              if (pickedDate != null) {
                String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                setState(() {
                  widget.bloc.dateOfBirthController.text = formattedDate; //set output date to TextField value.
                });
              } else {
                print("Date is not selected");
              }
            }),
        const SizedBox(height: 16),
        ValueListenableBuilder(
            valueListenable: widget.bloc.nationalityValue,
            builder: (context, snapshot, child) {
              return CustomTextFieldWithDropDown(
                prefixIcon: const Icon(Icons.nature_outlined),
                hintMessage: AppLocalizations.of(context)!.nationality,
                value: widget.bloc.nationalityValue.value,
                items: nationality,
                onChanged: (value) {
                  widget.bloc.nationalityValue.value = value!;
                  widget.bloc.validateFields();
                },
              );
            }),
        const SizedBox(height: 16),
        ValueListenableBuilder(
            valueListenable: widget.bloc.genderValue,
            builder: (context, snapshot, child) {
              return CustomTextFieldWithDropDown(
                prefixIcon: const Icon(Icons.type_specimen),
                hintMessage: AppLocalizations.of(context)!.gender,
                value: widget.bloc.genderValue.value,
                items: gender,
                onChanged: (value) {
                  widget.bloc.genderValue.value = value!;
                  widget.bloc.validateFields();
                },
              );
            }),
        const SizedBox(height: 16),
        CustomTextField(
          controller: widget.bloc.addressController,
          hintText: AppLocalizations.of(context)!.address,
          keyboardType: TextInputType.name,
          prefixIcon: const Icon(Icons.location_city),
          onChange: (value) => widget.bloc.validateFields(),
        ),
        const SizedBox(height: 16),
        ValueListenableBuilder(
            valueListenable: widget.bloc.usedLanguageValue,
            builder: (context, snapshot, child) {
              return CustomTextFieldWithDropDown(
                prefixIcon: const Icon(Icons.language),
                hintMessage: AppLocalizations.of(context)!.usedlanguagewiththeclientathome,
                value: widget.bloc.usedLanguageValue.value,
                items: usedLanguage,
                onChanged: (value) {
                  widget.bloc.usedLanguageValue.value = value!;
                  widget.bloc.validateFields();
                },
              );
            }),
        const SizedBox(height: 16),
        CustomTextField(
          controller: widget.bloc.mobileNumberController,
          hintText: AppLocalizations.of(context)!.mobileNumber,
          keyboardType: TextInputType.phone,
          prefixIcon: const Icon(Icons.phone),
          onChange: (value) => widget.bloc.validateFields(),
        ),
        const SizedBox(height: 16),
        ValueListenableBuilder(
            valueListenable: widget.bloc.parentOcupationValue,
            builder: (context, snapshot, child) {
              return CustomTextFieldWithDropDown(
                prefixIcon: const Icon(Icons.person),
                hintMessage: AppLocalizations.of(context)!.parentsoccupation,
                value: widget.bloc.parentOcupationValue.value,
                items: parentOcupation,
                onChanged: (value) {
                  widget.bloc.parentOcupationValue.value = value!;
                  widget.bloc.validateFields();
                },
              );
            }),
        const SizedBox(height: 16),
        CustomTextField(
          controller: widget.bloc.hisrankController,
          hintText: AppLocalizations.of(context)!.siblingsandhisrank,
          keyboardType: TextInputType.name,
          prefixIcon: const Icon(Icons.percent),
          onChange: (value) => widget.bloc.validateFields(),
        ),
        // const SizedBox(height: 16),
        // ValueListenableBuilder(
        //     valueListenable: widget.bloc.kinshipValue,
        //     builder: (context, snapshot, child) {
        //       return CustomTextFieldWithDropDown(
        //         prefixIcon: const Icon(Icons.arrow_circle_down_sharp),
        //         hintMessage: AppLocalizations.of(context)!.isthereanykinshipbetweenparents,
        //         value: widget.bloc.kinshipValue.value,
        //         items: kinship,
        //         onChanged: (value) {
        //           widget.bloc.kinshipValue.value = value!;
        //           widget.bloc.validateFields();
        //         },
        //       );
        //     }),
        // const SizedBox(height: 16),
        // ValueListenableBuilder(
        //     valueListenable: widget.bloc.foundCountactValue,
        //     builder: (context, snapshot, child) {
        //       return CustomTextFieldWithDropDown(
        //         prefixIcon: const Icon(Icons.contact_page),
        //         hintMessage: AppLocalizations.of(context)!.youfoundcontactusvia,
        //         value: widget.bloc.foundCountactValue.value,
        //         items: foundCountact,
        //         onChanged: (value) {
        //           widget.bloc.foundCountactValue.value = value!;
        //           widget.bloc.validateFields();
        //         },
        //       );
        //     }),
        const SizedBox(height: 16),
        CustomTextField(
          controller: widget.bloc.emailController,
          hintText: AppLocalizations.of(context)!.email_hint,
          keyboardType: TextInputType.emailAddress,
          prefixIcon: const Icon(Icons.email),
          onChange: (value) => widget.bloc.validateFields(),
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: widget.bloc.passwordController,
          hintText: AppLocalizations.of(context)!.password,
          keyboardType: TextInputType.name,
          prefixIcon: const Icon(Icons.password),
          onChange: (value) => widget.bloc.validateFields(),
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: widget.bloc.repasswordController,
          hintText: AppLocalizations.of(context)!.repassword,
          keyboardType: TextInputType.name,
          prefixIcon: const Icon(Icons.password),
          onChange: (value) => widget.bloc.validateFields(),
        ),
        const SizedBox(height: 16),
        ValueListenableBuilder<bool>(
            valueListenable: widget.bloc.fieldsValidation,
            builder: (context, snapshot, child) {
              return CustomButtonWidget(
                title: AppLocalizations.of(context)!.next,
                isButtonRounded: true,
                enable: snapshot,
                backgroundColor: const Color(0xff419aff),
                onPress: () {
                  widget.bloc.stepNumberNotifier.value = widget.bloc.stepNumberNotifier.value + 1;
                },
              );
            }),
        const SizedBox(height: 20),
        ValueListenableBuilder<SignUpStatusEnum>(
            valueListenable: widget.bloc.signupStatus,
            builder: (context, snapshot, child) {
              if (snapshot == SignUpStatusEnum.faild) {
                return Text(AppLocalizations.of(context)!.errorInEmailOrPassword,
                    style: CustomTextStyle().regular(color: Colors.red, size: 18));
              } else if (snapshot == SignUpStatusEnum.inProgress) {
                return const CircularProgressIndicator();
              } else {
                return Container();
              }
            }),
        const SizedBox(height: 20),
      ],
    );
  }
}
