

import 'application_constants.dart';

class Endpoints {
  Endpoints._();

  //CONNECT TOKEN
  static const connectToken =
      "${ApplicationConstants.SEHIR_PANOSU_API_URL}/connect/token";

  //OFİS
  static const getOffices = "${ApplicationConstants.BASE_URL}Ofis/OfisListe";
  static const postOffice = "${ApplicationConstants.BASE_URL}Ofis";

}
