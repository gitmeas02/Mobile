
import 'package:flutter/material.dart';
enum Sizes { extraSmall, small, medium, large, extraLarge }

class MultipleChoice extends StatefulWidget {
  const MultipleChoice({super.key});

  @override
  State<MultipleChoice> createState() => _MultipleChoiceState();
}

class _MultipleChoiceState extends State<MultipleChoice> {
  // Set<Sizes> selection = <Sizes>{Sizes.large, Sizes.extraLarge};
  Set<Sizes> selection = <Sizes>{};
  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Sizes>(
      style:SegmentedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        selectedForegroundColor: Colors.white,
        selectedBackgroundColor: Colors.black,
      ),
      segments: const <ButtonSegment<Sizes>>[
        ButtonSegment<Sizes>(value: Sizes.extraSmall, label: Text('XS')),
        ButtonSegment<Sizes>(value: Sizes.small, label: Text('S')),
        ButtonSegment<Sizes>(value: Sizes.medium, label: Text('M')),
        ButtonSegment<Sizes>(value: Sizes.large, label: Text('L')),
        ButtonSegment<Sizes>(value: Sizes.extraLarge, label: Text('XL')),
      ],
      selected: selection,
      onSelectionChanged: (Set<Sizes> newSelection) {
        setState(() {
          selection = newSelection;
        });
      },
      multiSelectionEnabled: true,
      emptySelectionAllowed: true,
    );
  }
}