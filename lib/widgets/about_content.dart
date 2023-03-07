import 'package:circle_flags/circle_flags.dart';
import 'package:flutter/material.dart';
import 'package:lucaszick/widgets/carousel_slider.dart';

class AboutContent extends StatelessWidget {
  const AboutContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        height: 400,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 20,
                height: 400,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.black54, Colors.black26],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 20,
                height: 400,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.black26, Colors.black54],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
            ),
            Carousel(
              widgetList: [
                Card(
                  color: Theme.of(context).colorScheme.primary,
                  child: ListView(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(20),
                        child: Center(
                          child: Text(
                            'FORMAL STUDIES',
                            style: TextStyle(
                              fontSize: 30,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.school_outlined),
                        title: const Text('Web Development - SENAI SC'),
                        subtitle: const Text('Technical Course'),
                        trailing: CircleFlag('br'),
                      ),
                      ListTile(
                        leading: const Icon(Icons.school_outlined),
                        title: const Text('Information Systems - UDESC'),
                        subtitle: const Text('Graduation Degree'),
                        trailing: CircleFlag('br'),
                      ),
                      ListTile(
                        leading: const Icon(Icons.school_outlined),
                        title:
                            const Text('International Business - HTW Berlin'),
                        subtitle: const Text('Graduation Degree'),
                        trailing: CircleFlag('de'),
                      ),
                    ],
                  ),
                ),
                Card(
                  color: Theme.of(context).colorScheme.primary,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Scrollbar(
                      child: ListView(
                        children: const [
                          Center(
                            child: Text(
                              'MYSELF',
                              style: TextStyle(
                                fontSize: 30,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            """
                    a Brazilian full-stack developer currently based in Berlin on a university scholarship. I started studying technical courses back in 2016 and have since started my degrees in software development and administration. At 21, I'm a quick learner who is passionate about coding and enjoys working collaboratively with others.
                    
                    When I'm not coding, I'm usually exploring my interests in cars and basketball. I used to play basketball competitively and have a keen interest in the mechanics of cars. I'm constantly seeking out new challenges to develop my skills and knowledge in software development.
                    
                    I strongly believe in the power of teamwork and effective communication in achieving success in any project. Therefore, I always strive to foster good working relationships with my colleagues and clients. I'm excited about the future of software development and am eager to contribute to it in any way I can.""",
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.black54, Colors.transparent],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                width: 15,
                height: 400,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [Colors.black54, Colors.transparent],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                width: 15,
                height: 400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
