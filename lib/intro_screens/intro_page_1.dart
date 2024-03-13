import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            Lottie.network("https://lottie.host/e6983345-330f-423a-ac48-9443fd9a3f08/stOmgAb6Q0.json"),
            const Spacer(),
            Text(
                "Convert Currencies with the latest exchange rates!",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 16,),
            const Text(
              "Quick and easy in-app currency conversion",
              textAlign: TextAlign.center,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
