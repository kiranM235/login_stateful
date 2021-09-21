import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? gender, email, password;
  // String? email;
  // String? password;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(48),
      child: Form(
        child: Column(
          children: [
            buildEmailField(),
            SizedBox(height: 8),
            buildPasswordField(),
            SizedBox(height: 8),
            buildGenderField(),
            SizedBox(height: 8),
            buildSubmitButton(),
          ],
        ),
      ),
    );
  }

  Widget buildEmailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: "Email",
        hintText: "you@example.com",
        prefixIcon: Icon(Icons.email),
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget buildPasswordField() {
    return TextFormField(
      obscureText: true,
      obscuringCharacter: ".",
      decoration: const InputDecoration(
        labelText: "Password",
        hintText: "password",
        prefixIcon: Icon(Icons.lock),
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget buildGenderField() {
    return DropdownButtonFormField<String>(
      items: const [
        DropdownMenuItem(
          child: Text("Female"),
          value: "Female",
        ),
        DropdownMenuItem(
          child: Text("Male"),
          value: "Male",
        ),
        DropdownMenuItem(
          child: Text("I don't wish to answer"),
          value: "I don't wish to answer",
        ),
      ],
      onChanged: (val) {
        gender = val;
      },

      decoration: const InputDecoration(
          labelText: "Select your gender",
          hintText: "Male",
          border: OutlineInputBorder(),
    ),
    );
  }

  Widget buildSubmitButton() {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        child: Text("Submit"),
        onPressed: () {
          // access the form and try to validate each of the children
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.green,
          padding: EdgeInsets.all(12),
        ),
      ),
    );
  }
}
