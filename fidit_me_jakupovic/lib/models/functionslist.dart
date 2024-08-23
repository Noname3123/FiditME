///this class acts as a ""structure"" of functions which are passed between widgets children and parents. Passed functions are related to functions called as events when ui is interacted with
class FunctionsList {
  FunctionsList({this.getDarkModeStatus, this.updateDarkModeStatus});

  Function? getDarkModeStatus;
  Function? updateDarkModeStatus;
}
