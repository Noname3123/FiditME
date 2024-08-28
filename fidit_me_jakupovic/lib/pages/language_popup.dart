import 'package:fidit_me_jakupovic/models/functionslist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fidit_me_jakupovic/models/definedlocales.dart'
    as definedLocales;

///this class is a stateful widget -  a language dialog which gives the user a list of all langs (English + croatian)
class LanguageDialog extends StatefulWidget {
  const LanguageDialog({super.key, required this.passedFunctionList});

  final FunctionsList passedFunctionList;

  @override
  State<StatefulWidget> createState() => LanguageDialogState();
}

class LanguageDialogState extends State<LanguageDialog> {
  String selectedLang = "";

  @override
  void initState() {
    selectedLang = widget.passedFunctionList.getLocale!().languageCode;

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
          widget.passedFunctionList.setLocale!(selectedLang, shouldSave: true);
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
          mainAxisSize: MainAxisSize.min,
          children: [
            ...(definedLocales.definedLanguageMap.keys)
                .map((languageName) => RadioListTile<String?>(
                      title: Text(languageName),
                      value: definedLocales.definedLanguageMap[languageName],
                      groupValue: selectedLang,
                      onChanged: (String? value) {
                        setState(() {
                          value == null
                              ? selectedLang = "en"
                              : selectedLang = value;
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
