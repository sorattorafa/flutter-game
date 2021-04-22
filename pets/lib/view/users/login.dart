import 'package:flutter/material.dart';
import 'package:pets/servcices/user/user.dart';
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
  bool hasLoginError = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void login() {
    if (!_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Processing Data')));
    } else {
      final emailUser = senhaController.text;
      final password = emailController.text;

        Navigator.pushReplacementNamed(context, '/second');
      UsersServices().makeLogin(emailUser, password).then((value) {
        print(value);
        Navigator.pushReplacementNamed(context, '/second');
      }).catchError((onError) {
        hasLoginError = true;
        print(onError);
      });
    }
  }

  Future<void>? signUp() {
    if (!_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Processing Data')));
    } else {
      final emailUser = senhaController.text;
      final password = emailController.text;
      return UsersServices().createUser(emailUser, password).then((value) {
        //print(value);
        Navigator.pushReplacementNamed(context, '/second');
      }).catchError((onError) {
        print(onError);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Column(
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
                              emailController = TextEditingController(text: '');
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    FormItem(
                      formFieldName: 'senha',
                      controller: senhaController,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: login,
                          child: Text('Login'),
                        ),
                        SizedBox(width: 12),
                        ElevatedButton(
                          onPressed: signUp,
                          child: Text('Sign up'),
                        ),
                      ],
                    ),
                    Visibility(
                        visible: hasLoginError,
                        child: Text('Invalid credentials, try again',
                            style: TextStyle(color: Colors.black)))
                  ],
                ),
              ),
              /*
              ElevatedButton(
                child: Text('Launch screen'),
                onPressed: () {
                  Navigator.pushNamed(context, '/second');
                  // Navigate to the second screen when tapped.
                },
              ),
              */
            ],
          ),
        ),
      ),
    );
  }
}
