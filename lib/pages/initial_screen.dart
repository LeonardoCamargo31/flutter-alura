import 'package:flutter/material.dart';
import 'package:flutter_alura/components/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('Tarefas'),
      ),
      body: AnimatedOpacity(
        opacity: isVisible ? 1 : 0,
        duration: const Duration(microseconds: 1000),
        child: ListView(
          children: [
            Task("Jogar", 'assets/imagens/cat1.jpeg', 3),
            Task("Caminhar", 'assets/imagens/cat2.jpeg', 4),
            Task("Estudar Flutter", 'assets/imagens/cat3.jpeg', 5),
            Task("Ler",'assets/imagens/cat4.jpeg', 5),
            Task("Limpar casa", 'assets/imagens/cat5.jpeg', 5),
            Task("Jogar", 'assets/imagens/cat1.jpeg', 5),
            SizedBox(height: 80),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          isVisible = !isVisible;
        });
      },
      child: Icon(Icons.remove_red_eye_sharp)),
    );
  }
}
