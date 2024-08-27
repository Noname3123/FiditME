import 'package:fidit_me_jakupovic/models/functionslist.dart';
import 'package:fidit_me_jakupovic/models/role_settings.dart';
import 'package:fidit_me_jakupovic/models/role_to_localized_name_mapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fidit_me_jakupovic/models/definedroles.dart' as definedRoles;

///this class is a stateful widget -  a language dialog which gives the user a list of all langs (English + croatian)
class RoleDialog extends StatefulWidget {
  const RoleDialog({super.key, required this.passedFunctionList});

  final FunctionsList passedFunctionList;

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
    var cancelBtn = TextButton(
        onPressed: () {
          Navigator.of(context).pop(); //close dialog
        },
        child: Text(
          AppLocalizations.of(context)!.odustani,
        ));
    var applyBtn = TextButton(
        onPressed: () {
          widget.passedFunctionList.setRole!(selectedRole, shouldSave: true);

          Navigator.of(context).pop();
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
        title: Text(AppLocalizations.of(context)!.izaberiJezik),
        content: Column(
          children: [
            ...(definedRoles.definedRoleMap.keys)
                .map((roleName) => RadioListTile<RoleSettings?>(
                      title: Text(RoleToLocalizedNameMapper(
                              context: context, getRole: () {})
                          .getLocalizedRoleNameByKey(roleName)),
                      value: definedRoles.definedRoleMap[roleName],
                      groupValue: selectedRole,
                      onChanged: (RoleSettings? value) {
                        setState(() {
                          value == null
                              ? selectedRole =
                                  definedRoles.definedRoleMap["Student"]
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
