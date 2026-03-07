import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/validators.dart';

class SignIn extends StatelessWidget {

  static const String routeName = 'sign-in';
   SignIn({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;
  final formKey = GlobalKey<FormState>() ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title:
          Row(
            children: [
              Icon(Icons.arrow_back_ios_new_outlined),
              SizedBox(width: 10,),
              Text('Login',
                style: AppTheme.lightTheme.textTheme.bodyLarge,
              ),
             ]

          ),



      ),
      body: Form(
        key: formKey,
        child: Container(
          color: AppColors.white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: "Enter your Email",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  validator: Validators.emailValidator,
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: "Enter you password ",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  validator: Validators.passwordValidator,
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Checkbox(
                        value: rememberMe,
                        onChanged: (value){

                    }),
                    Text('Remember me',
                      style: AppTheme.lightTheme.textTheme.bodySmall,
                    ),
                    Spacer(),
                    InkWell(
                      onTap: (){},
                      child: Text('Forget password ?',
                        style: AppTheme.lightTheme.textTheme.bodySmall?.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: (){

                      },
                      child: Text('Login',
                        style: AppTheme.lightTheme.textTheme.bodyMedium,

                  )),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? ",
                      style: AppTheme.lightTheme.textTheme.bodyMedium?.copyWith(
                        color: AppColors.black
                      ),
                    ),
                    Text('Sign up ',
                      style: AppTheme.lightTheme.textTheme.bodyMedium?.copyWith(
                        color: AppColors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    )

                  ],
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
