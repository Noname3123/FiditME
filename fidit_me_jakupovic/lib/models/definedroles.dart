import 'package:fidit_me_jakupovic/models/role_settings.dart';

///A Map of roles and corresponding classes which define what is visible to the user. Key is the name of the role while the value is the appropriate role setting
final definedRoleMap = {
  "Student": RoleSettings(
    hideDinpPage: true,
    hideGraduateStudiesEnrollment: true,
    hideGraduateStudyDINPS: true,
    hideUnderGraduateStudyDINPS: true,
    hideSeniorYearsEnrollmentDocs: true,
    hideUndergraduateStudiesEnrollment: false,
    hidePlanOfGraduateStudies: false,
    hidePlanOfUndergraduateStudies: false,
  ),
  "Undergraduate": RoleSettings(
    hideDinpPage: false,
    hideGraduateStudiesEnrollment: false,
    hideGraduateStudyDINPS: true,
    hideUnderGraduateStudyDINPS: false,
    hideSeniorYearsEnrollmentDocs: false,
    hideUndergraduateStudiesEnrollment: true,
    hidePlanOfGraduateStudies: false,
    hidePlanOfUndergraduateStudies: false,
  ),
  "Graduate": RoleSettings(
    hideDinpPage: false,
    hideGraduateStudiesEnrollment: true,
    hideGraduateStudyDINPS: false,
    hideUnderGraduateStudyDINPS: true,
    hideSeniorYearsEnrollmentDocs: false,
    hideUndergraduateStudiesEnrollment: true,
    hidePlanOfGraduateStudies: false,
    hidePlanOfUndergraduateStudies: true,
  )
};

///For a given RoleSetting, find the appropriate key in the definedRoleMap or return the default key (String is the return type)
String getKeyBasedOnRole(RoleSettings? role) {
  return definedRoleMap.keys.firstWhere((key) => definedRoleMap[key] == role,
      orElse: () => "Student");
}
