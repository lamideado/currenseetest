import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            Lottie.network("https://lottie.host/75ce9a54-273c-4613-95dd-3a5e7ccdaf51/4saGnEhBjK.json"),
            const Spacer(),
            Text(
              "Find detailed information about exchange rates!",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 16,),
            const Text(
              "View rate history over time",
              textAlign: TextAlign.center,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
