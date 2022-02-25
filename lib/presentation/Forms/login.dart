import 'package:cached_network_image/cached_network_image.dart';
import 'package:dating_app/presentation/Forms/my_form_field.dart';
import 'package:dating_app/presentation/Forms/sign_up.dart';
import 'package:dating_app/presentation/journey/home/home_page.dart';
import 'package:dating_app/utils/constant.dart';
import 'package:dating_app/utils/mixins.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget with InputValidationMixin {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with InputValidationMixin {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isHidden = true;
  bool buttonPressed = false;
  _validateForm() {
    bool _isValid = formKey.currentState!.validate();

    if (_isValid) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) => const Homepage()),
        ),
      );
    }
  }

  IconData icon = Icons.visibility_off_outlined;
  TextEditingController usernameController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ignore: avoid_unnecessary_containers
            Container(
              child: CachedNetworkImage(
                imageUrl: Constant.loginLogoCached,
              ),
              // const Image(
              //   image: AssetImage(Constant.loginLogo),
              // ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
              ),
              child: CustomFormField(
                formkey: formKey,
                controller: usernameController,
                textCap: TextCapitalization.none,
                validator: (value) {
                  return isUsername(value!) ? null : 'Username Required';
                },
                inputType: TextInputType.name,
                lableText: 'username',
                obscureText: false,
                prefixIcon: Icons.person,
                iconssuffix: null,
                suffixicon: null,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
              ),
              child: CustomFormField(
                textCap: TextCapitalization.none,
                formkey: formKey,
                controller: loginPasswordController,
                validator: (value) {
                  return isLoginPasswordValid(value!)
                      ? null
                      : 'Atleast 8 character required';
                },
                lableText: 'Password',
                suffixicon: InkWell(
                  onTap: () {
                    if (isHidden == true) {
                      isHidden = false;
                      icon = Icons.visibility;
                    } else {
                      isHidden = true;
                      icon = Icons.visibility_off_outlined;
                    }
                    setState(() {});
                  },
                  child: Icon(
                    icon,
                    color: Colors.grey[400],
                    size: 18,
                  ),
                ),
                prefixIcon: Icons.lock,
                obscureText: isHidden,
                inputType: TextInputType.emailAddress,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  buttonPressed = true;
                });

                _validateForm();
              },
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 40,
                ),
                padding: const EdgeInsets.all(10),
                height: 47,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.blue, Colors.green],
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {},
              child: const Center(
                child: Text(
                  'Forgot Password ?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Do not have Account ? '),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUp(),
                      ),
                    );
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
