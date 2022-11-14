import 'package:flutter/material.dart';
import 'package:lift_to_live_flutter/presentation/presenters/home_page_presenter.dart';

/// Custom AlertDialog widget, which is nested in the HomePage and is used for logging out of the app.
class LogOutDialog extends StatefulWidget {
  final HomePagePresenter presenter;

  const LogOutDialog({Key? key, required this.presenter}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LogOutDialogState();
  }
}

/// This class holds data and methods related to the log in form.
class LogOutDialogState extends State<LogOutDialog> {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Sign out"),
      content: const Text(
          "Are you sure you want to sign out?"),
      actions: [
        IconButton(
            onPressed: () {
              widget.presenter.logOut(context);
            },
            icon: const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 30,
            )),
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.cancel,
              color: Colors.red,
              size: 30,
            ))
      ],
    );
  }

}