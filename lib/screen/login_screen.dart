import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instragram_clone/utils/colors.dart';
import 'package:instragram_clone/widgets/text_field_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Container(),
              flex: 1,
            ),
            // instagram logo
            SvgPicture.asset(
              "assets/images/instagram.svg",
              color: primaryColor,
              height: 64,
            ),

            const SizedBox(height: 64),

            // email text field
            TextFieldInput(
              hintText: "Enter Your Email",
              textEditingController: _emailController,
              textInputType: TextInputType.emailAddress,
            ),

            const SizedBox(height: 24,),
            // password text field
            TextFieldInput(
              hintText: "Enter Your Password",
              textEditingController: _passwordController,
              textInputType: TextInputType.text,
              isPass: true,
            ),

             const SizedBox(height: 24,),

            // button for login
            InkWell(
              onTap: () {
                
              },
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4))
                  ),
                  color: blueColor
                ),
                child: const Text("Log In"),
              ),
            ),
            const SizedBox(height: 12,),
            Flexible(
              child: Container(),
              flex: 1,
            ),

            // transition to sign up
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: const Text("Dont't have an account"),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text("Sign Up", style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
              ],
            )

          ],
        ),
      ),
    ));
  }
}
