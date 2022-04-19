import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:najlepszy_warsztat_samochodowy_w_warszawie/app/features/login/cubit/login_page_cubit.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();

  final email = TextEditingController();
  final password = TextEditingController();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginPageCubit(),
      child: BlocBuilder<LoginPageCubit, LoginPageState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                state.isCreatingAccount ? 'Rejestracja' : 'Logowanie',
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
                        state.isCreatingAccount
                            ? 'Zarejestruj się'
                            : 'Zaloguj się',
                        style: GoogleFonts.alef(
                            fontSize: 25,
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 50),
                      TextField(
                        controller: widget.email,
                        decoration: const InputDecoration(hintText: 'E-mail'),
                      ),
                      TextField(
                        controller: widget.password,
                        obscureText: true,
                        decoration: const InputDecoration(hintText: 'Hasło'),
                      ),
                      const SizedBox(height: 20),
                      Text(state.errorMessage),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (state.isCreatingAccount) {
                            //rejestracja
                            try {
                              context.read<LoginPageCubit>().signUp(
                                  widget.email.text, widget.password.text);
                            } catch (error) {
                              Center(
                                child: Text(
                                  'Something went wrong : ${state.errorMessage}',
                                ),
                              );
                            }
                          } else {
                            //logowanie
                            try {
                              context.read<LoginPageCubit>().signIn(
                                  widget.email.text, widget.password.text);
                            } catch (error) {
                              Center(
                                child: Text(
                                  'Something went wrong : ${state.errorMessage}',
                                ),
                              );
                            }
                          }
                        },
                        child: Text(state.isCreatingAccount
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
                      if (state.isCreatingAccount == false) ...[
                        TextButton(
                          onPressed: () {
                            context.read<LoginPageCubit>().setState();
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
                      if (state.isCreatingAccount == true) ...[
                        TextButton(
                          onPressed: () {
                            context.read<LoginPageCubit>().start();
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
        },
      ),
    );
  }
}
