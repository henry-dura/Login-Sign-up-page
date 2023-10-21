import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String email = '';
  String passWord = '';
  bool isLogin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up / Login',style: TextStyle(fontWeight: FontWeight.w800),),centerTitle: true,backgroundColor: Colors.purple,),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                obscureText:true,
                decoration: const InputDecoration(
                  hintText: 'Enter Username',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty || value.length<4) {
                    return 'Please enter valid password greater than 4';
                  }
                  return null;
                },
                onSaved: (value)=>passWord = value!,
              ),
              const SizedBox(height: 25,),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                ),
                validator: (value) => EmailValidator.validate(value!) ? null : "Please enter a valid",
                onSaved: (value)=> email = value!,

              ),
              const SizedBox(height: 25,),
              TextFormField(
                obscureText:true,
                decoration: const InputDecoration(
                  hintText: 'Enter your password',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty || value.length<7) {
                    return 'Please enter valid password greater than 7';
                  }
                  return null;
                },
                onSaved: (value)=>passWord = value!,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.purple), // Change the color to your desired color
                    ),
                    onPressed: () {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        print(email);
                        print(passWord);
                      }
                    },
                    child: const Text('Submit',style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold,color: Colors.black),),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
