///this class contains document metadata neccessarry for the app to generate document data
class Document {
  Document({required this.url, required this.documentName});

  ///url of the document
  final Uri url;

  ///Name of document (name matches )
  final String documentName;
}

///This var is a map which contains a list of all documents linked to semester number (key) for undergraduate studies
var dinpPreddiplomskiStudiji = {
  1: [
    Document(
      url: Uri(
          scheme: "https",
          host: "inf.uniri.hr",
          path:
              "/images/nastava/izvedbeni/2023_2024/PDS/1/DINP_FIDIT_2023_2024_MAT1.pdf"),
      documentName: "Matematika 1",
    ),
    Document(
      url: Uri(
          scheme: "https",
          host: "inf.uniri.hr",
          path:
              "/images/nastava/izvedbeni/2023_2024/PDS/1/DINP_FIDIT_2023_2024_OPROG.pdf"),
      documentName: "Osnove programiranja",
    )
  ],
  2: [
    Document(
      url: Uri(
          scheme: "https",
          host: "inf.uniri.hr",
          path:
              "images/nastava/izvedbeni/2023_2024/PDS/1/DINP_FIDIT_2023_2024_OS.pdf"),
      documentName: "Operacijski sustavi",
    )
  ]
};

///This var is a map which contains a list of all documents linked to semester number (key) for graduate studies
var dinpDiplomskiStudiji = {
  1: [
    Document(
      url: Uri(
          scheme: "https",
          host: "inf.uniri.hr",
          path:
              "/images/nastava/izvedbeni/2023_2024/DS/1/DINP_FIDIT_2023_2024_DAP.pdf"),
      documentName: "Dubinska analiza podataka",
    )
  ],
  2: [
    Document(
      url: Uri(
          scheme: "https",
          host: "inf.uniri.hr",
          path:
              "/images/nastava/izvedbeni/2023_2024/DS/1/DINP_FIDIT_2023_2024_SDU.pdf"),
      documentName: "Strojno i duboko učenje",
    )
  ]
};
