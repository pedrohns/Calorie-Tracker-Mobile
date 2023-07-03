import 'package:flutter/material.dart';

class CalorieReview extends StatelessWidget {
  const CalorieReview({super.key});

  @override
  Widget build(BuildContext context) {
    final headlineTitulo = Theme.of(context).textTheme.headline1!;
    final headlineCorpo = Theme.of(context).textTheme.headline6!;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Calorias', style: headlineTitulo),
        SizedBox(height: 3),
        Text(
          'Restantes = Meta - Alimento + Exercício',
          style: headlineCorpo,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(),
            SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.flag,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Meta base',
                            style: headlineCorpo,
                          ),
                          Text(
                            '2020',
                            style: headlineTitulo,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.dining,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Alimentos',
                            style: headlineCorpo,
                          ),
                          Text(
                            '2020',
                            style: headlineTitulo,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.whatshot_rounded,
                        color: Colors.orangeAccent,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Exercício',
                            style: headlineCorpo,
                          ),
                          Text(
                            '2020',
                            style: headlineTitulo,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
