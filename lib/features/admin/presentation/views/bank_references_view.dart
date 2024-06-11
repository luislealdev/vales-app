import 'package:flutter/material.dart';
import 'package:vales_app/features/shared/shared.dart';

class BankReferencesView extends StatelessWidget {
  const BankReferencesView({super.key});

  @override
  Widget build(BuildContext context) {
    return WhiteCard(
        child: Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: const Text("Convenios",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400)),
        ),
        const SizedBox(height: 10),
        const _ItemContainer(
            img: "assets/images/banamex.png",
            child: Column(
              children: [
                Text("Banamex convenio", style: TextStyle(fontSize: 18)),
                Text("PA: 4247/01 +Optica")
              ],
            )),
        const SizedBox(
          height: 20,
        ),
        const _ItemContainer(
            img: "assets/images/bancomer.png",
            child: Column(
              children: [
                Text("Bancomer convenio", style: TextStyle(fontSize: 18)),
                Text("Celaya: 001385283")
              ],
            ))
      ],
    ));
  }
}

class _ItemContainer extends StatelessWidget {
  final String img;
  final Widget child;

  const _ItemContainer({required this.img, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(img),
            width: 150,
            height: 100,
          ),
          child
        ],
      ),
    );
  }
}
