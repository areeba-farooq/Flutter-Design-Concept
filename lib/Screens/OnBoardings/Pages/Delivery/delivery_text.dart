import 'package:flutter/material.dart';

import '../../widgets/column_text.dart';

class DeliveryText extends StatelessWidget {
  const DeliveryText({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextColumn(
      title: 'Fast Delivery',
      text:
          'Adipisicing anim ex excepteur duis quis in tempor eu ullamco adipisicing.',
    );
  }
}
