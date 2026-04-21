import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/di/di.dart';
import '../../../../../core/utils/validators.dart';
import '../view_model/cubit/profile_view_model.dart';
import '../view_model/states/profile_state.dart';

class EditProfileScreen extends StatelessWidget {
  static const String routeName = 'edit-profile';

  EditProfileScreen({super.key});

  final ProfileViewModel profileViewModel = getIt.get<ProfileViewModel>();
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  void _fillFields(ProfileScreenState state) {
    final user = state.profile;
    if (user == null) return;
    if (userNameController.text.isNotEmpty ||
        firstNameController.text.isNotEmpty ||
        lastNameController.text.isNotEmpty ||
        emailController.text.isNotEmpty ||
        phoneNumberController.text.isNotEmpty) {
      return;
    }

    userNameController.text = user.username;
    firstNameController.text = user.firstName;
    lastNameController.text = user.lastName;
    emailController.text = user.email;
    phoneNumberController.text = user.phone;
  }

  void _submit() {
    if (!(formKey.currentState?.validate() ?? false)) return;

    profileViewModel.updateProfile(
      username: userNameController.text.trim(),
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      email: emailController.text.trim(),
      phone: phoneNumberController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileViewModel>(
      create: (context) => profileViewModel..getUserData(),
      child: BlocConsumer<ProfileViewModel, ProfileScreenState>(
        listenWhen: (previous, current) =>
            previous.profile != current.profile ||
            previous.isUpdateSuccess != current.isUpdateSuccess ||
            previous.errorMessage != current.errorMessage,
        listener: (context, state) {
          _fillFields(state);

          if (state.isUpdateSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Profile updated successfully')),
            );
            Navigator.pop(context, true);
          } else if (state.errorMessage != null &&
              state.errorMessage!.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage!)),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.white,
              title: Text(
                'Edit Profile',
                style: AppTheme.lightTheme.textTheme.bodyLarge,
              ),
              centerTitle: false,
            ),
            body: Container(
              color: AppColors.white,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    padding: const EdgeInsets.all(20.0),
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: userNameController,
                            decoration: const InputDecoration(
                              labelText: 'User name',
                              hintText: 'Enter your user name',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                            ),
                            validator: Validators.userNameValidator,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: firstNameController,
                                  decoration: const InputDecoration(
                                    labelText: 'First name',
                                    hintText: 'Enter first name',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: TextFormField(
                                  controller: lastNameController,
                                  decoration: const InputDecoration(
                                    labelText: 'Last name',
                                    hintText: 'Enter last name',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              hintText: 'Enter your email',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                            ),
                            validator: Validators.emailValidator,
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: phoneNumberController,
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              labelText: 'Phone number',
                              hintText: 'Enter phone number',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                            ),
                          ),
                          const SizedBox(height: 30),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: state.isUpdatingProfile ? null : _submit,
                              child: Text(
                                'Update',
                                style: AppTheme.lightTheme.textTheme.bodyMedium,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                  if (state.isUpdatingProfile)
                    const Center(child: CircularProgressIndicator()),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
