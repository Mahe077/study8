import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:study8/src/helpers/third_party_auth.dart';
import 'package:study8/src/theme/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

var loggerNoStack = Logger(
  printer: PrettyPrinter(methodCount: 0),
);

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailFieldController = TextEditingController();
  final TextEditingController _passwordFieldController =
      TextEditingController();

  bool obscureText = true;
  bool rememberMe = false;

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
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              "assets/images/splash_images.jpeg",
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
              opacity: const AlwaysStoppedAnimation(0.6),
            ),
            Positioned(
              bottom: 0,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          "Sign In Now",
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: AppColors().greenColor),
                        ),
                        const Text("Please login into continue using our app",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            )),
                        const SizedBox(height: 40),
                        TextField(
                          controller: _emailFieldController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "Enter your email",
                            label: const Text("Email"),
                            hintStyle: TextStyle(
                              fontSize: 16,
                              color: AppColors().greenColor,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: _passwordFieldController,
                          keyboardType: TextInputType.visiblePassword,
                          obscuringCharacter: "*",
                          obscureText: obscureText,
                          decoration: InputDecoration(
                              hintText: "Enter your password",
                              label: const Text("Password"),
                              hintStyle: TextStyle(
                                fontSize: 16,
                                color: AppColors().greenColor,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      obscureText = !obscureText;
                                    });
                                  },
                                  icon: Icon(
                                    obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: AppColors().greenColor,
                                  ))),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: rememberMe,
                                  onChanged: (value) {
                                    setState(() {
                                      rememberMe = value!;
                                    });
                                  },
                                  activeColor: AppColors().greenColor,
                                ),
                                Text(
                                  "Remember me",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors().greenColor,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: () {}, //TODO:Implement
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors().greenColorDark,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {},
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
                              onPressed: () async {
                                try {
                                  UserCredential credentials =
                                      await ThirdPartyAuthenticators()
                                          .signInWithGoogle();

                                  if (credentials.user != null) {
                                    Navigator.popAndPushNamed(context, "/home");
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Something went wrong"),
                                      ),
                                    );
                                  }
                                } on FirebaseAuthException catch (e) {
                                  if (e.code ==
                                      'account-exists-with-different-credential') {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            "An account already exists with the same email address but different sign-in credentials. Sign in using a provider associated with this email address."),
                                      ),
                                    );
                                  } else if (e.code == 'invalid-credential') {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            "The credential used to authenticate the AdminUser is malformed or has expired. Please try again."),
                                      ),
                                    );
                                  }
                                } catch (e) {
                                  logger.e(e.toString());
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text("Something went wrong")));
                                }
                              }, //TODO:Implement
                              icon: Image.asset(
                                "assets/icons/google_logo.png",
                                height: 40,
                              ),
                            ),
                            const SizedBox(height: 5),
                            IconButton(
                              onPressed: () {}, //TODO:Implement
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
                            const Text("Don't have an account?"),
                            InkWell(
                              onTap: () {
                                Navigator.popAndPushNamed(context, "/register");
                              },
                              child: Text(
                                " Sign Up",
                                style: TextStyle(
                                  color: AppColors().greenColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
