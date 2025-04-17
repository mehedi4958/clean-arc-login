import 'package:clean_arc_login/presentation/sign_in/sign_in_state.dart';
import 'package:clean_arc_login/presentation/welcome/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'sign_in_bloc.dart';
import 'sign_in_event.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SignInBloc()..add(InitEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final bloc = BlocProvider.of<SignInBloc>(context);

    return Scaffold(
      body: BlocBuilder<SignInBloc, SignInState>(
        builder: (context, state) {
          if (state.isLoggedIn == true) {
            Future.delayed(Duration(milliseconds: 500), () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => WelcomePage(name: state.email!),
                ),
              );
            });
          }
          return Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Sign In',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.facebook_outlined, size: 30.0),
                          Icon(Icons.golf_course_outlined, size: 30.0),
                          Icon(Icons.dataset_linked_rounded, size: 30.0),
                        ],
                      ),
                      SizedBox(height: 12.0),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) {
                          if (email == null ||
                              !email.contains('@') ||
                              !email.contains('.')) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Email',
                          errorStyle: TextStyle(
                            color: Colors.red,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        validator: (password) {
                          if (password == null || password.length < 6) {
                            return 'Password is too weak.';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Password',
                          errorStyle: TextStyle(
                            color: Colors.red,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        'Forgot password',
                        style: TextStyle(color: Colors.grey, fontSize: 18.0),
                      ),
                      SizedBox(height: 8.0),
                      InkWell(
                        onTap: () {
                          if (formKey.currentState?.validate() ?? false) {
                            formKey.currentState?.save();
                            bloc.add(SignInTriggerEvent(emailController.text));
                          }
                        },
                        child: Container(
                          height: 45.0,
                          width: 180.0,
                          decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.all(
                              Radius.circular(22.0),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
