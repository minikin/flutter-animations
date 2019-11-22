import 'package:animation_cheat_page/shared/header_page.dart';
import 'package:animation_cheat_page/shared/ui/header.dart';
import 'package:animation_cheat_page/shared/ui/section.dart';
import 'package:animation_cheat_page/slivers/geometry/slivers_geometry.dart'
    as slivers;
import 'package:animation_cheat_page/slivers/shared/scroll_constraints.dart';
import 'package:animation_cheat_page/slivers/shared/sliver_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:presentation/presentation.dart';

class SliversGeometryPage extends StatelessWidget {
  const SliversGeometryPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final body = Container(
      height: 100,
      color: Colors.red,
    );
    return HeaderPage(
      repeatAnimations: false,
      header: AnimatedHeader(
        'Sliver',
        onPressed: () => Navigator.pushNamed(context, '/'),
      ),
      builder: (animation, child) {
        return Column(
          children: [
            const SectionHeader(
              title: Text('Geometry'),
              child: Markdown(
                slivers.description,
                style: TextStyle(
                  fontFamily: 'CrimsonPro',
                ),
              ),
            ),
            for (final sliverData in slivers.sliverExamples)
              SliverSection(
                title: sliverData.title,
                body: Markdown(
                  sliverData.description,
                  style: const TextStyle(
                    fontFamily: 'CrimsonPro',
                  ),
                ),
                leading: sliverData.leading,
                builder: (context, onChanged) {
                  return SliverValueChanged(
                    onGeometryChanged: (geometry) {
                      onChanged(sliverData.mapper(geometry));
                    },
                    child: body,
                  );
                },
              ),
          ],
        );
      },
    );
  }
}