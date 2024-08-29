import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'definedroles.dart' as defined_roles;

///this class exposes methods which map the role to a localised name matching the role
class RoleToLocalizedNameMapper {
  ///constructor which requires app build context and the get role method of main.dart class
  RoleToLocalizedNameMapper({required this.context, required this.getRole});
  BuildContext context;
  Function? getRole;

  ///This method returns a String Corresponding to the name of the active role or returns default role ("Student"/"Učenik" in hr)
  String getLocalizedRoleName() {
    var roleToLocalizedNameMap = {
      "Student": AppLocalizations.of(context)!.ulogaUcenik,
      "Undergraduate": AppLocalizations.of(context)!.ulogaStudentPredd,
      "Graduate": AppLocalizations.of(context)!.ulogaStudentDipl
    };

    var currentRole = getRole!();
    if (currentRole == null) {
      return AppLocalizations.of(context)!.ulogaUcenik;
    }

    var localizedName =
        roleToLocalizedNameMap[defined_roles.getKeyBasedOnRole(currentRole)];

    if (localizedName == null) {
      return AppLocalizations.of(context)!
          .ulogaUcenik; //return default localization of default user ("Student") if it is null
    }

    return localizedName;
  }

  ///This method returns a localised String name of role Corresponding to the role key (of String type), passed as param
  String getLocalizedRoleNameByKey(String key) {
    var roleToLocalizedNameMap = {
      "Student": AppLocalizations.of(context)!.ulogaUcenik,
      "Undergraduate": AppLocalizations.of(context)!.ulogaStudentPredd,
      "Graduate": AppLocalizations.of(context)!.ulogaStudentDipl
    };

    var localizedName = roleToLocalizedNameMap[key];
    localizedName ??=
        "Error! No matching role available!"; //null aware assignment
    return localizedName;
  }
}
