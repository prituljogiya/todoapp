import 'package:flutter/material.dart';

class Testing extends StatefulWidget {
  const Testing({Key? key}) : super(key: key);

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  final _formKey = GlobalKey<FormState>();
  late String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (input) {
                if(input!.isEmpty){
                  return 'Provide an email';
                }
              },
              onSaved: (input) => _email = input!,
              decoration: InputDecoration(
                  labelText: 'Email'
              ),
            ),
            TextFormField(
              validator: (input) {
                if(input?.length ==6){
                  return 'Longer password please';
                }
              },
              onSaved: (input) => _password = input!,
              decoration: InputDecoration(
                  labelText: 'Password'
              ),
              obscureText: true,
            ),
            ElevatedButton(onPressed: _submit, child: Text("login"))
          ],
        ),
      ),
    );
  }
  void _submit() {
    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();
      print(_email);
      print(_password);
    }
  }
}
