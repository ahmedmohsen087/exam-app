import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/di/di.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../view_model/cubit/profile_view_model.dart';
import '../view_model/states/profile_state.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final ProfileViewModel profileScreenViewModel = getIt.get<ProfileViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileViewModel>(
      create: (context) => profileScreenViewModel..getUserData(),
      child: BlocBuilder<ProfileViewModel, ProfileScreenState>(
        builder: (context, state) {
          final user = state.profile;
          final formKey = ValueKey(
            '${user?.id ?? 'empty'}-${state.isLoadingProfile}-${state.errorMessage ?? ''}',
          );

          return Container(
            color: AppColors.white,
            child: SafeArea(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    padding: const EdgeInsets.all(20.0),
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    child: Column(
                      children: [
                        if (state.errorMessage != null &&
                            state.errorMessage!.isNotEmpty) ...[
                          Text(
                            state.errorMessage!,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 20),
                        ],
                        if (user == null && !state.isLoadingProfile) ...[
                          const Text('No Data found'),
                          const SizedBox(height: 20),
                        ],
                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                initialValue: user?.username ?? '',
                                readOnly: true,
                                decoration: const InputDecoration(
                                  labelText: 'User name',
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      initialValue: user?.firstName ?? '',
                                      readOnly: true,
                                      decoration: const InputDecoration(
                                        labelText: 'First name',
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: TextFormField(
                                      initialValue: user?.lastName ?? '',
                                      readOnly: true,
                                      decoration: const InputDecoration(
                                        labelText: 'Last name',
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                initialValue: user?.email ?? '',
                                readOnly: true,
                                decoration: const InputDecoration(
                                  labelText: 'Email',
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                initialValue:
                                    (user?.passwordResetCode.isNotEmpty ?? false)
                                        ? user!.passwordResetCode
                                        : '*******',
                                readOnly: true,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  labelText: 'Password',
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                initialValue: user?.phone ?? '',
                                readOnly: true,
                                decoration: const InputDecoration(
                                  labelText: 'Phone number',
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                              ),
                              const SizedBox(height: 30),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.gray,
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    'Update',
                                    style:
                                        AppTheme.lightTheme.textTheme.bodyMedium,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (state.isLoadingProfile)
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
