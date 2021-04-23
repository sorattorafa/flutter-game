import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RadioButtonItem extends StatelessWidget {
  const RadioButtonItem({
    this.enabled = true,
    this.selected,
    required this.child,
    required this.onPressed,
    //this.description = '',
    // this.customAction,
  });

  final bool enabled;
  final bool? selected;
  final Function onPressed;
  final Widget child;
  // final String description;
  // final Widget customAction;

  @override
  Widget build(BuildContext context) {
    const borderRadius = BorderRadius.all(Radius.circular(10));

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          if (enabled) {
            onPressed.call();
          }
        },
        borderRadius: borderRadius,
        child: Ink(
          decoration: BoxDecoration(
            color: enabled ? Colors.white : Colors.grey[200],
            border: selected == true
                ? Border.all(
                    color: const Color(0xFF006AEC).withOpacity(0.5), width: 3)
                : Border.all(
                    color: const Color(0xFFFFFFFF).withOpacity(0.0), width: 3),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 3.0, // has the effect of softening the shadow
                spreadRadius: 0.2, // has the effect of extending the shadow
                offset: const Offset(2.0, 2.0),
              )
            ],
            borderRadius: borderRadius,
          ),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 100),
            // alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child: child,
          ),
        ),
      ),
    );
  }
}
