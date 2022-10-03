import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rewards_app/screens/mainContainer/main_container.dart';
import 'package:rewards_app/screens/signup/signup_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rewards_app/shared_widgets/custom_button_widget.dart';
import 'package:rewards_app/shared_widgets/custom_textfield_dropdown_widget.dart';
import 'package:rewards_app/shared_widgets/custom_textfield_widget.dart';
import 'package:rewards_app/utils/custom_text.dart';
import 'package:rewards_app/utils/custom_text_style.dart';
import 'package:rewards_app/utils/global_value.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

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
      ),
      body: GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16),
              CustomTextField(
                controller: _bloc.fullNameController,
                hintText: AppLocalizations.of(context)!.name_hint,
                keyboardType: TextInputType.name,
                prefixIcon: const Icon(Icons.person),
                onChange: (value) => _bloc.validateFields(),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                  controller: _bloc.dateOfBirthController,
                  readOnly: true,
                  hintText: AppLocalizations.of(context)!.dateofBirth,
                  keyboardType: TextInputType.datetime,
                  prefixIcon: const Icon(Icons.date_range),
                  onChange: (value) => _bloc.validateFields(),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2101));
                    if (pickedDate != null) {
                      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                      _bloc.dateOfBirthController.text = formattedDate; //set output date to TextField value.
                    } else {
                      print("Date is not selected");
                    }
                  }),
              const SizedBox(height: 16),
              ValueListenableBuilder<int>(
                  valueListenable: _bloc.nationalityValue,
                  builder: (context, snapshot, child) {
                    return CustomTextFieldWithDropDown(
                      prefixIcon: const Icon(Icons.nature_outlined),
                      hintMessage: AppLocalizations.of(context)!.nationality,
                      value: natonalityEnToAr()[snapshot],
                      items: natonalityEnToAr(),
                      onChanged: (value) {
                        _bloc.nationalityValue.value = natonalityEnToAr().indexOf(value!);
                        _bloc.validateFields();
                      },
                    );
                  }),
              const SizedBox(height: 16),
              ValueListenableBuilder<int>(
                  valueListenable: _bloc.genderValue,
                  builder: (context, snapshot, child) {
                    return CustomTextFieldWithDropDown(
                      prefixIcon: const Icon(Icons.type_specimen),
                      hintMessage: AppLocalizations.of(context)!.gender,
                      value: genderEnToAr()[snapshot],
                      items: genderEnToAr(),
                      onChanged: (value) {
                        _bloc.genderValue.value = genderEnToAr().indexOf(value!);
                        _bloc.validateFields();
                      },
                    );
                  }),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _bloc.addressController,
                hintText: AppLocalizations.of(context)!.address,
                keyboardType: TextInputType.name,
                prefixIcon: const Icon(Icons.location_city),
                onChange: (value) => _bloc.validateFields(),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _bloc.mobileNumber1Controller,
                hintText: AppLocalizations.of(context)!.mobileNumberone,
                keyboardType: TextInputType.phone,
                prefixIcon: const Icon(Icons.phone),
                onChange: (value) => _bloc.validateFields(),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _bloc.mobileNumber2Controller,
                hintText: AppLocalizations.of(context)!.mobileNumbertwo,
                keyboardType: TextInputType.phone,
                prefixIcon: const Icon(Icons.phone),
                onChange: (value) => _bloc.validateFields(),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _bloc.emailController,
                hintText: AppLocalizations.of(context)!.email_hint,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const Icon(Icons.email),
                onChange: (value) => _bloc.validateFields(),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _bloc.passwordController,
                hintText: AppLocalizations.of(context)!.password,
                keyboardType: TextInputType.name,
                prefixIcon: const Icon(Icons.password),
                onChange: (value) => _bloc.validateFields(),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _bloc.repasswordController,
                hintText: AppLocalizations.of(context)!.repassword,
                keyboardType: TextInputType.name,
                prefixIcon: const Icon(Icons.password),
                onChange: (value) => _bloc.validateFields(),
              ),
              const SizedBox(height: 16),
              ValueListenableBuilder<SignUpStatusEnum>(
                  valueListenable: _bloc.signupStatus,
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
              const SizedBox(height: 16),
              ValueListenableBuilder<bool>(
                  valueListenable: _bloc.fieldsValidation,
                  builder: (context, snapshot, child) {
                    return CustomButtonWidget(
                      title: AppLocalizations.of(context)!.submit,
                      isButtonRounded: true,
                      enable: snapshot,
                      backgroundColor: const Color(0xff419aff),
                      onPress: () async {
                        await _bloc.signUp().then((value) {
                          if (value) {
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx) {
                              return const MainContainer();
                            }), (route) => false);
                          }
                        });
                      },
                    );
                  }),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
