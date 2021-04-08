import 'package:flutter/material.dart';
import 'package:pets/widgets/form-field.dart';

class FirstScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  static const IconData pets = IconData(0xe90e, fontFamily: 'MaterialIcons');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(
            pets,
            color: Colors.black,
            size: 20.0,
            key: Key('dsdas'),
          ),
          SizedBox(width: 5),
          Text(
            'Pets Game',
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(width: 5),
          Icon(
            pets,
            color: Colors.black,
            size: 20.0,
            key: Key('dsas'),
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
                Colors.orange[100],
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
                      suffix: Visibility(
                        visible: true,
                        child: IconButton(
                          icon: const Icon(Icons.cancel),
                          color: const Color(0xFF006AEC),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    FormItem(formFieldName: 'senha'),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (!_formKey.currentState.validate()) {
                          //  ScaffoldMessenger.of(context).showSnackBar(
                         //       SnackBar(content: Text('Processing Data')));
                          } else {
                            Navigator.pushNamed(context, '/second');
                          }
                        },
                        child: Text('Login'),
                      ),
                    ),
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
