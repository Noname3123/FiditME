///this is a class of bool fields that define which parts of the app are available to user. Each role has appropriate RoleSettings associated with it
class RoleSettings {
  RoleSettings({
    required this.hideDinpPage,
    required this.hidePlanOfUndergraduateStudies,
    required this.hidePlanOfGraduateStudies,
    required this.hideUndergraduateStudiesEnrollment,
    required this.hideGraduateStudiesEnrollment,
    required this.hideSeniorYearsEnrollmentDocs,
    required this.hideUnderGraduateStudyDINPS,
    required this.hideGraduateStudyDINPS,
  });

  ///Should hide dinp page from user?
  bool hideDinpPage = false;

  ///Is the undergraduate plan hidden
  bool hidePlanOfUndergraduateStudies = false;

  ///Is the graduate plan hidden from person
  bool hidePlanOfGraduateStudies = false;

  ///Should the docs instructing on how to enroll to the 1st year of undergraduate study be hidden
  bool hideUndergraduateStudiesEnrollment = false;

  ///Should the docs instructing on how to enroll to the 1st year of graduate study be hidden
  bool hideGraduateStudiesEnrollment = false;

  ///Should the docs instructing on how to enroll to senior years be hidden
  bool hideSeniorYearsEnrollmentDocs = false;

  ///Should the DINP docs of the graduate studies be hidden
  bool hideGraduateStudyDINPS = false;

  ///Should the DINP docs of the undergraduate studies be hidden
  bool hideUnderGraduateStudyDINPS = false;
}
