///this is a class of bool fields which define which parts of the app are available to user. Each role has appropriate RoleSettings associated with it
class RoleSettings {
  RoleSettings(
      {required this.canSeeDinp}); //TODO: create class which will be used for configuring app from role perspective

  bool canSeeDinp = false;
}
