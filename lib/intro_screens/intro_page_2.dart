import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            Lottie.network("https://lottie.host/f90f417e-79ee-4a26-9854-ba57c685121d/IQ5mbyoKD5.json"),
            const Spacer(),
            Text(
              "Keep up with the latest currency news and markter trends!",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 16,),
            const Text(
              "Easily accessible news on the currency market",
              textAlign: TextAlign.center,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
