import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets/cubit/users/cubit.dart';
import 'package:pets/cubit/users/state.dart';
import 'package:pets/models/user.dart';
import 'package:pets/widgets/form-field.dart';

class FirstScreen extends StatefulWidget {
  static const IconData pets = IconData(0xe90e, fontFamily: 'MaterialIcons');

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController senhaController = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        currentFocus.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              FirstScreen.pets,
              color: Colors.black,
              size: 20.0,
              key: Key('icon2'),
            ),
            SizedBox(width: 5),
            Text(
              'Pets Game',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(width: 5),
            Icon(
              FirstScreen.pets,
              color: Colors.black,
              size: 20.0,
              key: Key('icon1'),
            ),
          ]),
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.01, 0.8],
                colors: [
                  Colors.orange.shade200,
                  Colors.red.shade300,
                ],
              ),
            ),
            child: BlocBuilder<UserCubit, UserState>(builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        FormItem(
                          formFieldName: 'email',
                          controller: emailController,
                          suffix: Visibility(
                            visible: true,
                            child: IconButton(
                              icon: const Icon(Icons.cancel),
                              color: Colors.purple.shade500,
                              onPressed: () {
                                setState(() {
                                  emailController =
                                      TextEditingController(text: '');
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        FormItem(
                          formFieldName: 'password',
                          controller: senhaController,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                FocusScopeNode currentFocus =
                                    FocusScope.of(context);
                                currentFocus.unfocus();
                                final result = await context
                                    .read<UserCubit>()
                                    .makeLogin(UserModel(
                                        email: emailController.text,
                                        password: senhaController.text));
                                if (result == LoginSucess()) {
                                  Navigator.pushReplacementNamed(
                                      context, '/second');
                                }
                              }, //login,
                              child: Text('Login'),
                            ),
                            SizedBox(width: 12),
                            ElevatedButton(
                              onPressed: () async {
                                FocusScopeNode currentFocus =
                                    FocusScope.of(context);
                                currentFocus.unfocus();
                                final result = await context
                                    .read<UserCubit>()
                                    .createUser(UserModel(
                                        email: emailController.text,
                                        password: senhaController.text));
                                if (result == LoginSucess()) {
                                  Navigator.pushReplacementNamed(
                                      context, '/second');
                                }
                              },
                              child: Text('Sign up'),
                            ),
                          ],
                        ),
                        Visibility(
                            visible: state == ErrorState(),
                            child: Text('Invalid credentials, please try again',
                                style: TextStyle(color: Colors.red.shade700))),
                        Visibility(
                            visible: state == NetworkErrorState(),
                            child: Text('Network error, please try again',
                                style: TextStyle(color: Colors.red.shade700)))
                      ],
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
