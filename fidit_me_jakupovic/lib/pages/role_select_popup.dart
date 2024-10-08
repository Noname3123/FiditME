import 'package:fidit_me_jakupovic/models/functionslist.dart';
import 'package:fidit_me_jakupovic/models/role_settings.dart';
import 'package:fidit_me_jakupovic/models/role_to_localized_name_mapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fidit_me_jakupovic/models/definedroles.dart' as defined_roles;

///this class is a stateful widget -  a language dialog which gives the user a list of all langs (English + croatian) to choose
class RoleDialog extends StatefulWidget {
  ///Constructor receives a list of passed functions from the root widget (MainPageFrame) and an additional bool param which defines whether the cancel button should be hidden
  const RoleDialog(
      {super.key,
      required this.passedFunctionList,
      this.shouldHideCancelButton = false});

  final FunctionsList passedFunctionList;
  final bool shouldHideCancelButton;

  @override
  State<StatefulWidget> createState() => RoleDialogState();
}

class RoleDialogState extends State<RoleDialog> {
  RoleSettings? selectedRole;

  @override
  void initState() {
    selectedRole = widget.passedFunctionList.getRole!();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cancelBtn = widget.shouldHideCancelButton ==
            true //if cancel button shouldnt be visible, hide the cancel button
        ? Container()
        : TextButton(
            onPressed: () {
              Navigator.of(context).pop(); //close dialog
            },
            child: Text(
              AppLocalizations.of(context)!.odustani,
            ));
    var applyBtn = TextButton(
        onPressed: () {
          widget.passedFunctionList.setRole!(selectedRole, shouldSave: true);
          if (!widget.shouldHideCancelButton) {
            Navigator.of(context)
                .pop(); //Dont close page if starting for first time
          }
        },
        child: Text(
          AppLocalizations.of(context)!.primijeni,
        ));

    return Theme(
      data: Theme.of(context).copyWith(
        listTileTheme: const ListTileThemeData(
            shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        )),
      ),
      child: AlertDialog(
        title: Text(AppLocalizations.of(context)!.izaberiUlogu),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...(defined_roles.definedRoleMap.keys)
                .map((roleName) => RadioListTile<RoleSettings?>(
                      title: Text(RoleToLocalizedNameMapper(
                              context: context, getRole: () {})
                          .getLocalizedRoleNameByKey(roleName)),
                      value: defined_roles.definedRoleMap[roleName],
                      groupValue: selectedRole,
                      onChanged: (RoleSettings? value) {
                        setState(() {
                          value == null
                              ? selectedRole =
                                  defined_roles.definedRoleMap["Student"]
                              : selectedRole = value;
                        });
                      },
                    ))
          ],
        ),
        actions: [
          cancelBtn,
          applyBtn,
        ],
      ),
    );
  }
}
