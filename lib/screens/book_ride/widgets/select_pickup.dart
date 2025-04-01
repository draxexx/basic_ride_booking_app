import 'package:flutter/material.dart';

import 'select_location.dart';

class SelectPickup extends StatelessWidget {
  const SelectPickup({super.key});

  @override
  Widget build(BuildContext context) {
    return const SelectLocation(
      text: "Please select a pickup location on the map",
    );
  }
}
