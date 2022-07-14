import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/login_screen/login_bloc/login_cubit.dart';
import 'package:shop_app/modules/login_screen/login_bloc/login_states.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/network/constants.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var foemKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginShopAppCubit(),
      child: BlocConsumer<LoginShopAppCubit, LoginShopAppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: defultText(
                text: 'Login with us ..',
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Form(
                    key: foemKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        defultText(
                          text: 'login',
                          isUpperCase: true,
                          color: defultColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        defultText(
                          text: 'Login with us to enjoy all the great offers',
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        defultTextFormField(
                            controller: emailController,
                            textInputType: TextInputType.emailAddress,
                            validText: 'Email must be input',
                            hintText: 'Email',
                            prefixIcon: Icons.email_outlined),
                        const SizedBox(
                          height: 20,
                        ),
                        defultTextFormField(
                          controller: passwordController,
                          textInputType: TextInputType.visiblePassword,
                          obscureText: true,
                          validText: 'Password must be input',
                          hintText: 'Password',
                          prefixIcon: Icons.lock_outline,
                          suffixIcon: Icons.remove_red_eye_outlined,
                          suffixIconOnPressed: () {},
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ConditionalBuilder(
                          condition: state is! LoadingLoginShopApp,
                          builder: (context) => defultMaterialButton(
                            onPressed: () {
                              if (foemKey.currentState!.validate()) {
                                LoginShopAppCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                            text: 'login',
                            isUpperCase: true,
                            color: Colors.white,
                            backgroundColor: defultColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                          fallback: (context) =>
                              const Center(child: CircularProgressIndicator()),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
