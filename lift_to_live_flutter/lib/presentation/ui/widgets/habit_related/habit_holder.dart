import 'package:flutter/material.dart';

import '../../../../domain/entities/habit.dart';
import '../../../../helper.dart';

/// A habit holder widget for overviewing a single habit entry.
/// Placed in a habit list on the habits page view.
class HabitHolder extends StatelessWidget {
  final Habit habit;
  final List<Widget> habitTaskWidgets;

  const HabitHolder(
      {super.key, required this.habit, required this.habitTaskWidgets});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      margin: const EdgeInsets.fromLTRB(10, 5, 10, 0),
      decoration: BoxDecoration(
        color: Helper.lightBlueColor,
        border: Border.all(color: Helper.whiteColor.withOpacity(0.3)),
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 5, bottom: 5),
                decoration: BoxDecoration(
                    color: Helper.blueColor,
                    //border: Border.all(color: Helper.whiteColor.withOpacity(0.3)),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      Helper.formatter.format(
                          DateTime.fromMicrosecondsSinceEpoch(
                              int.parse(habit.date) * 1000)),
                      style: const TextStyle(
                          color: Helper.yellowColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 24),
                    ),
                    const SizedBox(
                      width: 20,
                      height: 2,
                    ),
                    Icon(
                        !habit.habits.any((element) => !element.isCompleted)
                            ? Icons.thumb_up
                            : habit.habits.any(
                                        (element) => !element.isCompleted) &&
                                    habit.habits
                                        .any((element) => element.isCompleted)
                                ? Icons.thumbs_up_down
                                : Icons.thumb_down,
                        size: 50,
                        color: !habit.habits
                                .any((element) => !element.isCompleted)
                            ? Colors.green.shade800
                            : habit.habits.any(
                                        (element) => !element.isCompleted) &&
                                    habit.habits
                                        .any((element) => element.isCompleted)
                                ? Colors.yellow.shade800
                                : Colors.red.shade800)
                  ],
                ),
              ),
            ],
          ),
          const Divider(),
          Row(
            children: [
              const SizedBox(height: 10),
              habit.note.isEmpty ? const SizedBox() : Row(
                children: [
                  const Icon(Icons.notes, color: Helper.yellowColor,),
                  const SizedBox(width: 10,),
                  Text(
                    habit.note,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 20),
          Column(
            children: habitTaskWidgets,
          )
        ],
      ),
    );
  }
}
