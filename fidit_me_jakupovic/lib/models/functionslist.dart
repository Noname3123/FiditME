///this class acts as a "structure" of methods which are passed between widgets children and parents. Passed methods are called as events when ui is interacted with.
class FunctionsList {
  FunctionsList({
    this.getDarkModeStatus,
    this.updateDarkModeStatus,
    this.getLocale,
    this.setLocale,
    this.getRole,
    this.setRole,
  });

  Function? getDarkModeStatus;
  Function? updateDarkModeStatus;
  Function? getLocale;
  Function? setLocale;
  Function? getRole;
  Function? setRole;
}
