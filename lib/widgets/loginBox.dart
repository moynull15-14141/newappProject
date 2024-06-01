import 'package:flutter/material.dart';
import 'package:newapp/HomePage.dart';
import 'package:newapp/login_si/service.dart';
import 'package:newapp/widgets/TextFieldInput.dart';

import 'package:newapp/widgets/snackBar.dart';

class LoginBox extends StatefulWidget {
  LoginBox({super.key, required this.boxName});
  final String boxName;

  @override
  State<LoginBox> createState() => _LoginBoxState();
}

class _LoginBoxState extends State<LoginBox> {
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  bool isloding = false;
  void loginUser() async {
    String res = await AuthServices().loginUser(
      email: emailController.text,
      password: passwordController.text,
    );

    if (res == "success") {
      setState(() {
        isloding = true;
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const Ground(),
          ),
        );
      });
    } else {
      setState(
        () {
          isloding = false;
        },
      );

      showSnackbar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 390,
      width: 310,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: Color.fromARGB(255, 3, 84, 89)),
      child: Column(
        children: [
          Container(
            height: 50,
            width: 310,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              color: Color.fromARGB(255, 7, 123, 130),
            ),
            child: Center(
              child: Text(
                widget.boxName,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          TextFieldInput(
            icon: const Icon(
              Icons.email,
              color: Color.fromARGB(255, 3, 84, 89),
            ),
            textEditingController: emailController,
            hintText: 'Email',
            textInputType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 30,
          ),
          TextFieldInput(
              isPass: true,
              icon: const Icon(
                Icons.password,
                color: Color.fromARGB(255, 3, 84, 89),
              ),
              textEditingController: passwordController,
              hintText: 'Password',
              textInputType: TextInputType.visiblePassword),
          const Padding(
            padding: EdgeInsets.only(right: 14),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Forgote Passoword?",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              loginUser();
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }

  void dspose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
