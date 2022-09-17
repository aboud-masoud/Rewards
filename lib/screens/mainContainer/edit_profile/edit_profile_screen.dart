import 'package:flutter/material.dart';
import 'package:rewards_app/screens/mainContainer/edit_profile/edit_profile_bloc.dart';
import 'package:rewards_app/shared_widgets/custom_textfield_widget.dart';
import 'package:rewards_app/utils/custom_text.dart';
import 'package:rewards_app/utils/custom_text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);

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
            child: IconButton(
                onPressed: () {
                  //TODO
                },
                icon: Row(
                  children: [
                    const Icon(
                      Icons.check,
                      color: Color(0xff419aff),
                    ),
                    CustomText(
                      title: AppLocalizations.of(context)!.save,
                      style: CustomTextStyle().semibold(size: 14, color: const Color(0xff419aff)),
                    )
                  ],
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
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
              hintText: AppLocalizations.of(context)!.dateofBirth,
              keyboardType: TextInputType.datetime,
              prefixIcon: const Icon(Icons.date_range),
              onChange: (value) => _bloc.validateFields(),
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _bloc.nationalityController,
              hintText: AppLocalizations.of(context)!.nationality,
              keyboardType: TextInputType.name,
              prefixIcon: const Icon(Icons.nature_outlined),
              onChange: (value) => _bloc.validateFields(),
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _bloc.genderController,
              hintText: AppLocalizations.of(context)!.gender,
              keyboardType: TextInputType.name,
              prefixIcon: const Icon(Icons.type_specimen),
              onChange: (value) => _bloc.validateFields(),
            ),
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
              controller: _bloc.usedLanguageController,
              hintText: AppLocalizations.of(context)!.usedlanguagewiththeclientathome,
              keyboardType: TextInputType.name,
              prefixIcon: const Icon(Icons.language),
              onChange: (value) => _bloc.validateFields(),
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _bloc.mobileNumberController,
              hintText: AppLocalizations.of(context)!.mobileNumber,
              keyboardType: TextInputType.phone,
              prefixIcon: const Icon(Icons.phone),
              onChange: (value) => _bloc.validateFields(),
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _bloc.parentOcupationController,
              hintText: AppLocalizations.of(context)!.parentsoccupation,
              keyboardType: TextInputType.name,
              prefixIcon: const Icon(Icons.person),
              onChange: (value) => _bloc.validateFields(),
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _bloc.hisrankController,
              hintText: AppLocalizations.of(context)!.siblingsandhisrank,
              keyboardType: TextInputType.name,
              prefixIcon: const Icon(Icons.percent),
              onChange: (value) => _bloc.validateFields(),
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _bloc.kinshipController,
              hintText: AppLocalizations.of(context)!.isthereanykinshipbetweenparents,
              keyboardType: TextInputType.name,
              prefixIcon: const Icon(Icons.arrow_circle_down_sharp),
              onChange: (value) => _bloc.validateFields(),
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _bloc.foundCountactController,
              hintText: AppLocalizations.of(context)!.youfoundcontactusvia,
              keyboardType: TextInputType.text,
              prefixIcon: const Icon(Icons.contact_page),
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
          ],
        ),
      ),
    );
  }
}
