import 'package:flutter/material.dart';

import '../../widgets/column_text.dart';

class PaymentText extends StatelessWidget {
  const PaymentText();

  @override
  Widget build(BuildContext context) {
    return const TextColumn(
      title: 'Easy Payment Methods',
      text: 'Ipsum magna enim cupidatat culpa elit cillum velit occaecat.',
    );
  }
}
