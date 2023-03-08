import 'package:flutter/material.dart';

@immutable
class Person {
  final String name;
  final int age;
  final String emoji;

  const Person({required this.name, required this.age, required this.emoji});
}

const people = [
  Person(name: 'John', age: 20, emoji: '🤯'),
  Person(name: 'Jack', age: 23, emoji: '🥶'),
  Person(name: 'Nick', age: 28, emoji: '🥰'),
];

class HeroAnimation extends StatelessWidget {
  const HeroAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: const Center(child: Text('People')),
        ),
        body: ListView.builder(
            itemCount: people.length,
            itemBuilder: (context, index) {
              final person = people[index];
              return ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetailsPage(person: person),
                    ),
                  );
                },
                leading: Hero(
                  tag: person.name,
                  child: Text(
                    person.emoji,
                    style: const TextStyle(fontSize: 40),
                  ),
                ),
                title: Text(person.name),
                subtitle: Text('${person.age} years old'),
                trailing: const Icon(
                  Icons.arrow_circle_right_outlined,
                  color: Colors.white,
                ),
              );
            }),
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, required this.person}) : super(key: key);

  final Person person;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Center(
          child: Hero(
            flightShuttleBuilder: (
              flightContext,
              animation,
              flightDirection,
              fromHeroContext,
              toHeroContext,
            ) {
              switch (flightDirection) {
                case HeroFlightDirection.push:
                  return ScaleTransition(
                      scale: animation.drive(
                        Tween<double>(begin: 0, end: 1).chain(
                          CurveTween(curve: Curves.fastOutSlowIn),
                        ),
                      ),
                      child: Material(
                        color: Colors.transparent,
                          child: toHeroContext.widget));
                case HeroFlightDirection.pop:
                  return Material(
                    color: Colors.transparent,
                      child: fromHeroContext.widget);
              }
            },
            tag: person.name,
            child: Text(
              person.emoji,
              style: const TextStyle(fontSize: 50),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              person.name,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '${person.age} years old',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
