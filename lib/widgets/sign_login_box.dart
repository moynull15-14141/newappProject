import 'package:flutter/material.dart';
import 'package:newapp/HomePage.dart';
import 'package:newapp/login_si/service.dart';
import 'package:newapp/widgets/TextFieldInput.dart';
import 'package:newapp/widgets/snackBar.dart';

class SignBox extends StatefulWidget {
  SignBox({super.key, required this.boxName});
  final String boxName;

  @override
  State<SignBox> createState() => _SignBoxState();
}

class _SignBoxState extends State<SignBox> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController idController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  bool isloding = false;

  void signUpUser() async {
    String res = await AuthServices().signUpUser(
        email: emailController.text,
        password: passwordController.text,
        id: idController.text,
        name: nameController.text);

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
            height: 20,
          ),
          TextFieldInput(
              icon: const Icon(
                Icons.person,
                color: Color.fromARGB(255, 3, 84, 89),
              ),
              textEditingController: nameController,
              hintText: 'User Name',
              textInputType: TextInputType.name),
          const SizedBox(
            height: 8,
          ),
          TextFieldInput(
              icon: const Icon(
                Icons.pin,
                color: Color.fromARGB(255, 3, 84, 89),
              ),
              textEditingController: idController,
              hintText: 'ID',
              textInputType: TextInputType.number),
          const SizedBox(
            height: 8,
          ),
          TextFieldInput(
              icon: const Icon(
                Icons.email,
                color: Color.fromARGB(255, 3, 84, 89),
              ),
              textEditingController: emailController,
              hintText: 'Email',
              textInputType: TextInputType.emailAddress),
          const SizedBox(
            height: 8,
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
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              signUpUser();
              print("signup");
            },
            child: Text('create account'),
          ),
        ],
      ),
    );
  }

  void dspose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    idController.dispose();
    nameController.dispose();
  }
}
