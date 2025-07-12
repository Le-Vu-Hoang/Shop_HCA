import 'dart:io';
import 'package:e_commercial/core/constants/app_text_style.dart';
import 'package:e_commercial/core/constants/app_themes.dart';
import 'package:e_commercial/core/utils/date_time_convert.dart';
import 'package:e_commercial/presentation/blocs/profile/profile_bloc.dart';
import 'package:e_commercial/presentation/blocs/profile/profile_event.dart';
import 'package:e_commercial/presentation/blocs/profile/profile_state.dart';
import 'package:e_commercial/presentation/widgets/button/app_button.dart';
import 'package:e_commercial/presentation/widgets/loading/app_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  XFile? _pickedImage;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileBloc()..add(LoadProfile()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppThemes.primaryColor.withOpacity(0.85),
          centerTitle: true,
          title: Text('Profile', style: AppTextStyle.withColor(AppTextStyle.h1, Colors.white)),
        ),
        body: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state is ProfileLoading) {
              AppLoading.show(context);
            } else {
              AppLoading.hide(context);
            }

            if (state is ProfileUpdated) {
              Fluttertoast.showToast(
                msg: "Profile updated successfully",
                backgroundColor: Colors.green,
                textColor: Colors.white,
              );
            } else if (state is ProfileError) {
              Fluttertoast.showToast(
                msg: "Error: ${state.errorMessage}",
                backgroundColor: Colors.red,
                textColor: Colors.white,
              );
            }
          },
          builder: (context, state) {
            if (state is ProfileLoaded) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: FormBuilder(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _buildAvatar(state),
                        const SizedBox(height: 20),
                        _buildTextField('full_name', 'Username', state.user.fullName),
                        _buildTextField('account_name', 'Account Name', state.user.accountName),
                        _buildTextField('email', 'Email', state.user.email),
                        _buildDatePicker(state.user.birthday),
                        _buildTextField('number_phone', 'Phone Number', state.user.numberPhone),
                        const SizedBox(height: 20),
                        AppButton(
                          text: 'Save',
                          icon: Icons.save_as_outlined,
                          iconColor: Colors.white,
                          iconSize: 32,
                          width: MediaQuery.of(context).size.width * 0.6,
                          textStyle: const TextStyle(color: Colors.white, fontSize: 18),
                          gradientColor: AppThemes.backgroundColor,
                          isGradient: true,
                          color: AppThemes.primaryColor,
                          onPressed: () {
                            if (_formKey.currentState?.saveAndValidate() ?? false) {
                              final formData = _formKey.currentState!.value;
                              final localUser = state.user.copyWith(
                                fullName: formData['full_name'],
                                accountName: formData['account_name'],
                                email: formData['email'],
                                birthday: (formData['birth_date'] as DateTime?)?.toIso8601String(),
                                numberPhone: formData['number_phone'],
                                imageLink: _pickedImage?.path ?? state.user.imageLink,
                              );
                              context.read<ProfileBloc>().add(UpdateProfile(localUser.toUserModel()));
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Widget _buildTextField(String name, String label, String? initialValue) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: FormBuilderTextField(
        name: name,
        initialValue: initialValue ?? '',
        decoration: InputDecoration(
          labelText: label,
          labelStyle: AppTextStyle.withWeight(AppTextStyle.subtitle, FontWeight.w600),
        ),
        style: AppTextStyle.withWeight(AppTextStyle.textLarge, FontWeight.w500),
      ),
    );
  }

  Widget _buildDatePicker(String? dateString) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: FormBuilderDateTimePicker(
        name: 'birth_date',
        initialValue: parseIsoStringToDateTime(dateString),
        inputType: InputType.date,
        decoration: InputDecoration(
          labelText: 'Birthday',
          labelStyle: AppTextStyle.withWeight(AppTextStyle.subtitle, FontWeight.w600),
        ),
        style: AppTextStyle.withWeight(AppTextStyle.textLarge, FontWeight.w500),
      ),
    );
  }

  Widget _buildAvatar(ProfileLoaded state) {
    final imageProvider = _pickedImage != null
        ? FileImage(File(_pickedImage!.path))
        : (state.user.imageLink != null
        ? NetworkImage(state.user.imageLink!)
        : const AssetImage('assets/images/default_avatar.png')) as ImageProvider;

    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: imageProvider,
        ),
        TextButton(
          onPressed: () async {
            final picker = ImagePicker();
            final image = await picker.pickImage(source: ImageSource.gallery);
            if (image != null) {
              setState(() {
                _pickedImage = image;
              });
            }
          },
          child: const Text('Chọn ảnh đại diện'),
        )
      ],
    );
  }
}
