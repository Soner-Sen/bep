import 'package:bep_desktop/application/screens/home/widgets/zero_budget.dart';
import 'package:bep_desktop/theme/app_theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

//Allgemeiner Snapshot über meine Finanzen
//Transaction hinzufügen
//Weekly Spending Targets
//Kalender mit Ausgaben
//Ziel Geld: Bis wann? Was für Raten muss man dann zahlen
//DB Oder Local Storage
//Spenden Screen

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const BouncingScrollPhysics(),
      crossAxisCount: 2,
      children: [
        ZeroBudget(),
        Container(
          color: Colors.green,
        ),
        Container(
          color: Colors.blue,
        ),
        Container(
          color: Colors.yellow,
        ),
      ],
    );
  }
}
