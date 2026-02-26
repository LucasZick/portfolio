import 'package:flutter/material.dart';
import 'package:lucaszick/widgets/tech_box.dart';

class SkillsContent extends StatefulWidget {
  const SkillsContent({super.key});

  @override
  _SkillsContentState createState() => _SkillsContentState();
}

class _SkillsContentState extends State<SkillsContent> {
  // Lista de nomes das tecnologias
  List<String> techNames = [
    'python', 'javascript', 'dart', 'flutter', 'html', 'css', 'sql', 'postgres',
    'mysql', 'kafka', 'redis', 'mongo', 'git', 'github', 'docker', 'bash', 'linux',
    'glpk', 'ros', 'latex', 'qgis', 'matlab', 'oracle', 'arduino'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        child: GridView.extent(
          shrinkWrap: true,
          maxCrossAxisExtent: 150,
          mainAxisSpacing: 10,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 10,
          children: List.generate(techNames.length, (index) {
            final techName = techNames[index];
            return Draggable<String>(
              data: techName,
              childWhenDragging: const SizedBox.shrink(), // Esconde o item enquanto está sendo arrastado
              feedback: Material(
                color: Colors.transparent,
                child: TechBox(techName: techName),
              ),
              child: DragTarget<String>(
                onWillAccept: (data) => true,
                onAccept: (data) {
                  setState(() {
                    // Atualiza a posição do item na lista
                    techNames.remove(data);
                    techNames.insert(index, data);
                  });
                },
                builder: (context, candidateData, rejectedData) {
                  return TechBox(techName: techName);
                },
              ),
            );
          }),
        ),
      ),
    );
  }
}
