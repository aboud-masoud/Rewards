import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:rewards_app/app.dart';
import 'package:rewards_app/screens/login/login_screen.dart';
import 'package:rewards_app/screens/mainContainer/edit_profile/edit_profile_bloc.dart';
import 'package:rewards_app/shared_widgets/custom_textfield_dropdown_widget.dart';
import 'package:rewards_app/shared_widgets/custom_textfield_widget.dart';
import 'package:rewards_app/utils/custom_text.dart';
import 'package:rewards_app/utils/custom_text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rewards_app/utils/global_value.dart';
import 'package:rewards_app/shared_widgets/custom_button_widget.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final _bloc = EditProfileBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9f9f9),
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: const Color(0x00ffffff),
        title: CustomText(
          title: AppLocalizations.of(context)!.editprofile,
          style: CustomTextStyle().semibold(size: 16, color: const Color(0xff707070)),
        ),
        actions: [
          SizedBox(
            width: 75,
            child: ValueListenableBuilder<bool>(
                valueListenable: _bloc.fieldsValidation,
                builder: (context, snapshot, child) {
                  return IconButton(
                      onPressed: snapshot
                          ? () async {
                              await _bloc.updateProfileInformation().then((value) => Navigator.of(context).pop());
                            }
                          : null,
                      icon: Row(
                        children: [
                          Icon(
                            Icons.check,
                            color: snapshot ? const Color(0xff419aff) : const Color(0x00419aff),
                          ),
                          CustomText(
                            title: AppLocalizations.of(context)!.save,
                            style: CustomTextStyle().semibold(
                                size: 14, color: snapshot ? const Color(0xff419aff) : const Color(0x00419aff)),
                          )
                        ],
                      ));
                }),
          )
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: StreamBuilder(
              stream: _bloc.profile.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                if (streamSnapshot.hasData) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs.singleWhere((element) => element.id == userEmail);

                  if (_bloc.openPageForTheFirstTime) {
                    _bloc.openPageForTheFirstTime = false;
                    _bloc.fullNameController.text = documentSnapshot["full name"] ?? "";
                    _bloc.dateOfBirthController.text = documentSnapshot["Date Of Birth"] ?? "";
                    if (languageSelected.value == "en") {
                      _bloc.genderValue.value = genderEnList.indexOf(documentSnapshot["GenderEn"]);
                      _bloc.nationalityValue.value = natonalityEnList.indexOf(documentSnapshot["NationalityEn"]);
                    } else {
                      _bloc.genderValue.value = genderArList.indexOf(documentSnapshot["GenderAr"]);
                      _bloc.nationalityValue.value = natonalityArList.indexOf(documentSnapshot["NationalityAr"]);
                    }
                    _bloc.addressController.text = documentSnapshot["Address"] ?? "";
                    _bloc.mobileNumber1Controller.text = documentSnapshot["Mobile Number 1"] ?? "";
                    _bloc.mobileNumber2Controller.text = documentSnapshot["Mobile Number 2"] ?? "";
                    _bloc.firstEvaluationDate = documentSnapshot["1 st Evaluation Date"] ?? "";
                    _bloc.firstTherapeuticSessionDate = documentSnapshot["1 st Therapeutic Session Date"] ?? "";
                    _bloc.therapeuticName = documentSnapshot["Therapeutic Name"] ?? "";
                  }

                  return Column(
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
                              _bloc.validateFields();
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
                      const SizedBox(height: 50),
                      CustomButtonWidget(
                        title: AppLocalizations.of(context)!.deleteaccount,
                        enable: true,
                        backgroundColor: Colors.red,
                        widthSize: MediaQuery.of(context).size.width,
                        onPress: () async {},
                      )
                    ],
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              }),
        ),
      ),
    );
  }
}
