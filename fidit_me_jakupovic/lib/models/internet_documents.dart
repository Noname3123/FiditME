///this class contains document metadata neccessarry for the app to generate document buttons with open and share functionality
class Document {
  Document({required this.url, required this.documentName});

  ///uri of the document
  final Uri url;

  ///Name of document. The name is unique for each document and written wihout white spaces. Localizer uses this name as a key to determine the actual localized name of the document to be displayed
  final String documentName;
}

///This var is a map which contains a list of all documents linked to semester number (key) for undergraduate studies. This var is of type Map<"String", List<Document>>
var dinpPreddiplomskiStudiji = {
  "1": [
    Document(
      url: Uri(
          scheme: "https",
          host: "inf.uniri.hr",
          path:
              "/images/nastava/izvedbeni/2023_2024/PDS/1/DINP_FIDIT_2023_2024_MAT1.pdf"),
      documentName: "Matematika1",
    ),
    Document(
      url: Uri(
          scheme: "https",
          host: "inf.uniri.hr",
          path:
              "/images/nastava/izvedbeni/2023_2024/PDS/1/DINP_FIDIT_2023_2024_OPROG.pdf"),
      documentName: "OsnoveProgramiranja",
    )
  ],
  "2": [
    Document(
      url: Uri(
          scheme: "https",
          host: "inf.uniri.hr",
          path:
              "images/nastava/izvedbeni/2023_2024/PDS/1/DINP_FIDIT_2023_2024_OS.pdf"),
      documentName: "OperacijskiSustavi",
    )
  ]
};

///This var is a map which contains a list of all documents linked to semester number (key) for graduate studies. This var is of type Map<"String", List<Document>>
var dinpDiplomskiStudiji = {
  "1": [
    Document(
      url: Uri(
          scheme: "https",
          host: "inf.uniri.hr",
          path:
              "/images/nastava/izvedbeni/2023_2024/DS/1/DINP_FIDIT_2023_2024_DAP.pdf"),
      documentName: "DubinskaAnalizaPodataka",
    )
  ],
  "2": [
    Document(
      url: Uri(
          scheme: "https",
          host: "inf.uniri.hr",
          path:
              "/images/nastava/izvedbeni/2023_2024/DS/1/DINP_FIDIT_2023_2024_SDU.pdf"),
      documentName: "StrojnoiDubokoUcenje",
    )
  ]
};

///This var is of type Map<"String", List<Document>> and contains docs related for enrollment into graduate study programme
var dokumentiUpisDiplomskiStudij = {
  "diplomskiStudij": [
    Document(
      url: Uri(
          scheme: "https",
          host: "inf.uniri.hr",
          path:
              "/images/studiji/upisi/2024/Natjecaj_upisi_diplomski_studiji_2024_2025.pdf"),
      documentName: "NatjecajZaUpisUPrvuGodinuDiplomskog",
    )
  ]
};

///This var is of type Map<"String", List<Document>> and contains docs related for enrollment into udergraduate study programme
var dokumentiUpisPredDiplomskiStudij = {
  "predDiplomskiStudij": [
    Document(
      url: Uri(
          scheme: "https",
          host: "inf.uniri.hr",
          path:
              "/images/studiji/upisi/2024/Natjecaj_upisi_prijediplomski_2024_2025.pdf"),
      documentName: "NatjecajZaUpisUPrvuGodinuPredDiplomskog",
    )
  ]
};

///This var is of type Map<"String", List<Document>> and contains docs related for enrollment into senior years of studies
var dokumentiUpisViseGodine = {
  "upisViseGodine": [
    Document(
      url: Uri(
          scheme: "https",
          host: "inf.uniri.hr",
          path:
              "/images/studiji/upisi/2023/Odluka_o_uvjetima_upisa_u_visu_godinu_studija.pdf"),
      documentName: "OdlukaOUvjetimaUpisaUVisuGodinuStudija",
    )
  ]
};

///This Map<String, List<Document>> contains a list of all documents related to the program of the undergraduate study
var dokumentPrijediplomskiProgram = {
  "programPredDiplomski": [
    Document(
      url: Uri(
          scheme: "https",
          host: "inf.uniri.hr",
          path:
              "/images/studiji/preddiplomski/1P/program/NPP_Prijediplomski_studij_Informatika_FIDIT_2022_2.pdf"),
      documentName: "PlanProgramPredDiplomskog",
    )
  ]
};

///This Map<String, List<Document>> contains a list of all documents related to the program of the graduate study
var dokumentDiplomskiProgram = {
  "programDiplomski": [
    Document(
      url: Uri(
          scheme: "https",
          host: "inf.uniri.hr",
          path:
              "/images/studiji/diplomski/IIS_PI/NPP_Diplomski_studij_Informatika_FIDIT_2022_2.pdf"),
      documentName: "PlanProgramDiplomskog",
    )
  ]
};
