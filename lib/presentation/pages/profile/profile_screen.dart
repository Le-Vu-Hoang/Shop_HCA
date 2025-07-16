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
          title: Text('Profile',
              style: AppTextStyle.withColor(AppTextStyle.h1, Colors.white)),
        ),
        body: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state is ProfileUpdated) {
              Fluttertoast.showToast(
                msg: "Profile updated successfully",
                backgroundColor: Colors.green,
                textColor: Colors.white,
              );
              setState(() => _pickedImage = null);
              context.read<ProfileBloc>().add(LoadProfile());
            } else if (state is ProfileError) {
              Fluttertoast.showToast(
                msg: "Error: ${state.errorMessage}",
                backgroundColor: Colors.red,
                textColor: Colors.white,
              );
            }
          },
          builder: (context, state) {
            if (state is ProfileLoaded || state is ProfileLoading) {
              final userState = state is ProfileLoaded
                  ? state
                  : (state as ProfileLoading).previous;

              return Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: FormBuilder(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            _buildAvatar(userState),
                            const SizedBox(height: 20),
                            _buildTextField('full_name', 'Username',
                                userState.user.fullName),
                            _buildTextField('account_name', 'Account Name',
                                userState.user.accountName),
                            _buildTextField(
                                'email', 'Email', userState.user.email),
                            _buildDatePicker(userState.user.birthday),
                            _buildTextField('number_phone', 'Phone Number',
                                userState.user.numberPhone),
                            const SizedBox(height: 20),
                            _addressInfor(userState.user),
                            const SizedBox(height: 20),
                            AppButton(
                              text: 'Save',
                              icon: Icons.save_as_outlined,
                              iconColor: Colors.white,
                              iconSize: 32,
                              width: MediaQuery.of(context).size.width * 0.6,
                              textStyle: const TextStyle(
                                  color: Colors.white, fontSize: 18),
                              gradientColor: AppThemes.backgroundColor,
                              isGradient: true,
                              color: AppThemes.primaryColor,
                              onPressed: () {
                                if (_formKey.currentState?.saveAndValidate() ??
                                    false) {
                                  final formData = _formKey.currentState!.value;
                                  final localUser = userState.user.copyWith(
                                    fullName: formData['full_name'],
                                    accountName: formData['account_name'],
                                    email: formData['email'],
                                    birthday:
                                        (formData['birth_date'] as DateTime?)
                                            ?.toIso8601String(),
                                    numberPhone: formData['number_phone'],
                                    imageLink: _pickedImage?.path,
                                  );
                                  context.read<ProfileBloc>().add(UpdateProfile(
                                      localUser.toUserModel(), _pickedImage));
                                }
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (state is ProfileLoading) AppLoading.overlay(),
                ],
              );
            } else if (state is ProfileError) {
              return Center(
                child: Text(
                  'Error: ${state.errorMessage}',
                  style: AppTextStyle.withColor(
                      AppTextStyle.textLarge, Colors.red),
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
          labelStyle:
              AppTextStyle.withWeight(AppTextStyle.subtitle, FontWeight.w600),
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
          labelStyle:
              AppTextStyle.withWeight(AppTextStyle.subtitle, FontWeight.w600),
        ),
        style: AppTextStyle.withWeight(AppTextStyle.textLarge, FontWeight.w500),
      ),
    );
  }

  Widget _buildAvatar(ProfileState state) {
    final user = (state is ProfileLoaded)
        ? state.user
        : (state is ProfileLoading)
            ? state.previous.user
            : null;

    ImageProvider imageProvider;

    if (_pickedImage != null) {
      imageProvider = FileImage(File(_pickedImage!.path));
    } else if (user?.imageLink != null && user!.imageLink!.isNotEmpty) {
      imageProvider = NetworkImage(user.imageLink!);
    } else {
      imageProvider = const AssetImage('assets/images/default_avatar.png');
    }

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

  Widget _addressInfor(String? address) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(children: [
        Text(
          address!,
          style:
              AppTextStyle.withWeight(AppTextStyle.textLarge, FontWeight.w500),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 10),
        TextButton(
          onPressed: () {
            // Navigate to address update screen
          },
          child: const Text('Cập nhật địa chỉ'),
        )
      ]),
    );
  }
}
