///this class contains document metadata neccessarry for the app to generate document data
class Document {
  Document({required this.url, required this.documentName});

  ///url of the document
  final Uri url;

  ///Name of document
  final String documentName;
}

///this class contains additional info unique to dinp documents - such as semester number
class DinpDocument extends Document {
  DinpDocument(
      {required super.url,
      required super.documentName,
      required this.semesterNumber});

  ///Number of semester of this object
  final int semesterNumber;
}
