import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:study8/src/theme/app_colors.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _fullNameFieldControler = TextEditingController();
  TextEditingController _emailFieldControler = TextEditingController();
  TextEditingController _passwordFieldControler = TextEditingController();
  TextEditingController _confirmPasswordFieldControler =
      TextEditingController();

  bool _passwordObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: AppColors().greenBackgroundDark,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.asset(
            "assets/images/splash_images.jpeg",
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
            opacity: AlwaysStoppedAnimation(0.6),
          ),
          Positioned(
              bottom: 0,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      "assets/images/logo.png",
                      height: 90,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          "Sign Up Now",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: AppColors().greenColor,
                          ),
                        ),
                        const Text(
                          "Register from here and let us to help you out with your problems",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 30),
                        TextField(
                          controller: _fullNameFieldControler,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            hintText: "Enter your full name",
                            label: Text("Full Name"),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: _emailFieldControler,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: "Enter your email address",
                            label: Text("Email Address"),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: _passwordFieldControler,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: _passwordObscureText,
                          decoration: InputDecoration(
                            hintText: "Enter your password",
                            label: Text("Password"),
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _passwordObscureText = !_passwordObscureText;
                                });
                              },
                              icon: Icon(
                                _passwordObscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: AppColors().greenColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: _confirmPasswordFieldControler,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: _passwordObscureText,
                          decoration: InputDecoration(
                            hintText: "Confirm your password",
                            label: const Text("Confirm Password"),
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _passwordObscureText = !_passwordObscureText;
                                });
                              },
                              icon: Icon(
                                _passwordObscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: AppColors().greenColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.popAndPushNamed(context, '/home');
                          }, //TODO:implerment
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors().greenColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 30),
                            fixedSize:
                                Size(MediaQuery.of(context).size.width, 50),
                          ),
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Row(
                          children: [
                            Expanded(
                              child: Divider(
                                height: 1.0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Center(
                                child: Text(
                                  'OR',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                height: 1.0,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {}, //TODO:implement google
                              icon: Image.asset(
                                "assets/icons/google_logo.png",
                                height: 40,
                              ),
                            ),
                            const SizedBox(width: 5),
                            IconButton(
                              onPressed: () {}, //TODO:implement facebook
                              icon: Image.asset(
                                "assets/icons/facebook_icon.png",
                                height: 40,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Text("Alreaady have an account?"),
                            InkWell(
                              onTap: () {
                                Navigator.popAndPushNamed(context, "/login");
                              },
                              child: Text(
                                " Sign In",
                                style: TextStyle(
                                  color: AppColors().greenColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
