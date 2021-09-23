import 'package:flutter/material.dart';
import 'package:login_stateful/src/mixins/validation_mixin.dart';
import 'package:login_stateful/src/screens/second_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixin {
  String? gender, email, password;

  // String? email;
  // String? password;
  //define global key of type FormState

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(8),
        child: Form(
          key: formKey,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildEmailField(),
                  SizedBox(height: 8),
                  buildPasswordField(),
                  SizedBox(height: 8),
                  buildGenderField(),
                  SizedBox(height: 8),
                  buildSubmitButton(context),
                ],
              ),
            ),
          ),
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
      validator: validateEmail,
      onSaved: (value) {
        email = value;
      },
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
      validator: validatePassword,
      onSaved: (value) {
        password = value;
      },
    );
  }

  Widget buildGenderField() {
    return DropdownButtonFormField<String>(
      items: const [
        DropdownMenuItem(
          child: Text("Male"),
          value: "male",
        ),
        DropdownMenuItem(
          child: Text("Female"),
          value: "female",
        ),
        DropdownMenuItem(
          child: Text("I don't wish to answer"),
          value: "I don't wish to answer",
        ),
      ],
      onChanged: (val) {
        gender = val;
        print(val);
      },
      decoration: const InputDecoration(
        labelText: "Select your gender",
        hintText: "Male",
        border: OutlineInputBorder(),
      ),
      validator: validateGender,
      onSaved: (value) {
        gender = value;
      },
    );
  }

  Widget buildSubmitButton(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        child: Text("Submit"),
        onPressed: () {
          // bool? validForm  = formKey.currentState?.validate();
          // if(validForm == true){
          //   // attempt to extract all the values from formfield.
          // }

          bool validForm = formKey.currentState!.validate();
          if (validForm) {
            // attempt to extract all the values from formfield.
            formKey.currentState!.save();
            print(
                "Email is $email, password is $password and gender is $gender");
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return SecondScreen();
                },
              ),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.green,
          padding: EdgeInsets.all(12),
        ),
      ),
    );
  }
}
