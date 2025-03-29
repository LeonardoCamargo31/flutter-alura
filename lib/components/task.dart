import 'package:flutter/material.dart';
import 'package:flutter_alura/components/difficulty.dart';

class Task extends StatefulWidget {
  final String name;
  final String image;
  final int difficultyLevel;

  const Task(
    this.name, 
    this.image,
    this.difficultyLevel,
    {super.key}
  );

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;

  void aumentarNivel() {
    setState(() {
      nivel++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue,
            ),
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black26,
                      ),
                      width: 72,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          widget.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            widget.name,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Difficulty(difficultyLevel: widget.difficultyLevel),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        width: 52,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: () {
                            aumentarNivel();
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.arrow_drop_up),
                              Text('Up', style: TextStyle(fontSize: 12),)
                            ],
                          )
                        ),
                      )
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Colors.white, 
                        value: (widget.difficultyLevel > 0) ? 
                          (nivel/widget.difficultyLevel) / 10 : 1 ,
                      )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                    "Nivel: $nivel", 
                    style:  TextStyle(color:Colors.white,fontSize: 16),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}