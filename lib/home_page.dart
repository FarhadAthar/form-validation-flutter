import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/utils.dart';

import 'reusable_widget/custom_form_field.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  String? email, password, phone;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'R E G I S T E R',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: _buildUI());
  }

  Widget _buildUI() {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(8),
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomFormField(
                hintText: 'Enter your email',
                obscureText: false,
                validator: (value) {
                  if (!value!.isValidEmail) {
                    return "Please enter valid email address!";
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              CustomFormField(
                hintText: 'Enter your Phone Number',
                obscureText: false,
                validator: (value) {
                  if (!value!.isValidPhone) {
                    return "Please enter the valid Phone Number!";
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    phone = value;
                  });
                },
              ),
              CustomFormField(
                hintText: 'Enter your Password',
                obscureText: true,
                validator: (value) {
                  if (!value!.isValidPassword) {
                    return "Password not Valid";
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            "Register Successfully! \n Email: $email \n Phone: $phone \n Password: $password")));
                  }
                },
                child: const Text("Register Now!"),
              ),
            ],
          )),
    ));
  }
}
