import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var errorMessage = '';
  var isCreatingAccount = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isCreatingAccount == true ? 'Rejestracja' : 'Logowanie',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 139, 192, 115),
              Color.fromARGB(255, 233, 242, 151),
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                const SizedBox(
                  height: 140,
                ),
                Text(
                  isCreatingAccount == true ? 'Zarejestruj się' : 'Zaloguj się',
                  style: GoogleFonts.alef(
                      fontSize: 25,
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 50),
                TextField(
                  controller: widget.emailController,
                  decoration: const InputDecoration(hintText: 'E-mail'),
                ),
                TextField(
                  controller: widget.passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(hintText: 'Hasło'),
                ),
                const SizedBox(height: 20),
                Text(errorMessage),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (isCreatingAccount == true) {
                      //rejestracja
                      try {
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: widget.emailController.text,
                          password: widget.passwordController.text,
                        );
                      } catch (error) {
                        setState(() {
                          errorMessage = error.toString();
                        });
                      }
                    } else {
                      //logowanie
                      try {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: widget.emailController.text,
                          password: widget.passwordController.text,
                        );
                      } catch (error) {
                        setState(() {
                          errorMessage = error.toString();
                        });
                      }
                    }
                  },
                  child: Text(isCreatingAccount == true
                      ? 'Zarejestruj się'
                      : 'Zaloguj się'),
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 214, 209, 209),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    textStyle: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                    onPrimary: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                if (isCreatingAccount == false) ...[
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isCreatingAccount = true;
                      });
                    },
                    child: Text(
                      'Nie masz konta? Zarejestruj się',
                      style: GoogleFonts.alef(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                ],
                if (isCreatingAccount == true) ...[
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isCreatingAccount = false;
                      });
                    },
                    child: Text(
                      'Masz już konto? Zaloguj się',
                      style: GoogleFonts.alef(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
