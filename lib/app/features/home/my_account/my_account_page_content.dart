import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:najlepszy_warsztat_samochodowy_w_warszawie/app/cubit/root_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAccountPageContent extends StatelessWidget {
  const MyAccountPageContent({
    Key? key,
    required this.email,
  }) : super(key: key);

  final String? email;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Jesteś zalogowany jako $email',
            style: GoogleFonts.lato(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              context.read<RootCubit>().signOut();
            },
            child: const Text(
              'Wyloguj',
            ),
            style: ElevatedButton.styleFrom(
              primary: const Color.fromARGB(255, 234, 255, 0),
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
        ],
      ),
    );
  }
}
