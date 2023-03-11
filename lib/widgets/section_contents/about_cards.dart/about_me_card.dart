import 'package:flutter/material.dart';

class AboutMeCard extends StatelessWidget {
  const AboutMeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}
