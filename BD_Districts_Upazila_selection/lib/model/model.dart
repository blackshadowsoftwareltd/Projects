/// model>>>>

import 'dart:convert';

List<BdCountryDetails>? bdcountryDetails;

void getCountryDetailsbd() {
  List<Map> map = CountryDatabd.countryDatabd;
  List<BdCountryDetails> list =
      map.map((json) => BdCountryDetails.fromJson(json)).toList();
  bdcountryDetails = list;
}

// List<BdCountryDetails> bdCountryDetailsFromJson(String str) =>
//     List<BdCountryDetails>.from(
//         json.decode(str).map((x) => BdCountryDetails.fromJson(x)));

// String bdCountryDetailsToJson(List<BdCountryDetails> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BdCountryDetails {
  BdCountryDetails({
    this.districtName,
    this.upazila,
  });

  String? districtName;
  List<Upazila>? upazila;

  factory BdCountryDetails.fromJson(Map<dynamic, dynamic> json) =>
      BdCountryDetails(
        districtName: json["district_name"],
        upazila:
            List<Upazila>.from(json["upazila"].map((x) => Upazila.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "district_name": districtName,
        "upazila": List<dynamic>.from(upazila!.map((x) => x.toJson())),
      };
}

class Upazila {
  Upazila({
    this.upazilaName,
  });

  String? upazilaName;

  factory Upazila.fromJson(Map<String, dynamic> json) => Upazila(
        // upazilaName: json["upazila_name"] == null ? null : json["upazila_name"],
        upazilaName: json["upazila_name"],
      );

  Map<String, dynamic> toJson() => {
        // "upazila_name": upazilaName == null ? null : upazilaName,
        "upazila_name": upazilaName,
      };
}

class CountryDatabd {
  static List<Map<String, Object>> countryDatabd = [
    {
      "district_name": "Sherpur",
      "upazila": [
        {"upazila_name": "Jhenaigati"},
        {"upazila_name": "Nakla"},
        {"upazila_name": "Nalitabari"},
        {"upazila_name": "SherpurSadar"},
        {"upazila_name": "Sreebordi"}
      ]
    },
    {
      "district_name": "Netrokona",
      "upazila": [
        {"upazila_name": "Purbadhala"},
        {"upazila_name": "NetrakonaSadar"},
        {"upazila_name": "Mohanganj"},
        {"upazila_name": "Madan"},
        {"upazila_name": "Kendua"},
        {"upazila_name": "Kalmakanda"},
        {"upazila_name": "Khaliajuri"},
        {"upazila_name": "Durgapur"},
        {"upazila_name": "Barhatta"},
        {"upazila_name": "Atpara"}
      ]
    },
    {
      "district_name": "Mymensingh",
      "upazila": [
        {"upazila_name": "Nandail"},
        {"upazila_name": "Tarakanda"},
        {"upazila_name": "Dhobaura"},
        {"upazila_name": "Trishal"},
        {"upazila_name": "Muktagacha"},
        {"upazila_name": "MymensinghSadar"},
        {"upazila_name": "Gaffargaon"},
        {"upazila_name": "Fulbaria"},
        {"upazila_name": "Bhaluka"},
        {"upazila_name": "Gauripur"},
        {"upazila_name": "Phulpur"},
        {"upazila_name": "Ishwarganj"},
        {"upazila_name": "Haluaghat"}
      ]
    },
    {
      "district_name": "Jamalpur",
      "upazila": [
        {"upazila_name": "JamalpurSadar"},
        {"upazila_name": "Bakshiganj"},
        {"upazila_name": "Sarishabari"},
        {"upazila_name": "Melendah"},
        {"upazila_name": "Madarganj"},
        {"upazila_name": "Islampur"},
        {"upazila_name": "Dewanganj"}
      ]
    },
    {
      "district_name": "Tangail",
      "upazila": [
        {"upazila_name": "TangailSadar"},
        {"upazila_name": "Shakhipur"},
        {"upazila_name": "Nagarpur"},
        {"upazila_name": "Mirzapur"},
        {"upazila_name": "Madhupur"},
        {"upazila_name": "Kalihati"},
        {"upazila_name": "Gopalpur"},
        {"upazila_name": "Ghatail"},
        {"upazila_name": "Dhanbari"},
        {"upazila_name": "Delduar"},
        {"upazila_name": "Basail"}
      ]
    },
    {
      "district_name": "Shariatpur",
      "upazila": [
        {"upazila_name": "Janjira"},
        {"upazila_name": "ShariatpurSadar"},
        {"upazila_name": "Naria"},
        {"upazila_name": "Goshairhat"},
        {"upazila_name": "Damudya"},
        {"upazila_name": "Bhederganj"}
      ]
    },
    {
      "district_name": "Rajbari",
      "upazila": [
        {"upazila_name": "RajbariSadar"},
        {"upazila_name": "Pangsha"},
        {"upazila_name": "Kalukhali"},
        {"upazila_name": "Goalanda"},
        {"upazila_name": "Baliakandi"}
      ]
    },
    {
      "district_name": "Narsingdi",
      "upazila": [
        {"upazila_name": "Shibpur"},
        {"upazila_name": "Raipura"},
        {"upazila_name": "Palash"},
        {"upazila_name": "NarsingdiSadar"},
        {"upazila_name": "Monohardi"},
        {"upazila_name": "Belabo"}
      ]
    },
    {
      "district_name": "Narayanganj",
      "upazila": [
        {"upazila_name": "Sonargaon"},
        {"upazila_name": "Rupganj"},
        {"upazila_name": "NarayanganjSada"},
        {"upazila_name": "Bandar"},
        {"upazila_name": "Araihazar"}
      ]
    },
    {
      "district_name": "Munshiganj",
      "upazila": [
        {"upazila_name": "Tongibari"},
        {"upazila_name": "Sreenagar"},
        {"upazila_name": "Sirajdikhan"},
        {"upazila_name": "MunshiganjSadar"},
        {"upazila_name": "Lohajang"},
        {"upazila_name": "Gazaria"}
      ]
    },
    {
      "district_name": "Manikganj",
      "upazila": [
        {"upazila_name": "Singair"},
        {"upazila_name": "Shibalay"},
        {"upazila_name": "Saturia"},
        {"upazila_name": "ManikganjSadar"},
        {"upazila_name": "Harirampur"},
        {"upazila_name": "Ghior"},
        {"upazila_name": "Daulatpur"}
      ]
    },
    {
      "district_name": "Madaripur",
      "upazila": [
        {"upazila_name": "Shibchar"},
        {"upazila_name": "Rajoir"},
        {"upazila_name": "MadaripurSadar"},
        {"upazila_name": "Kalkini"}
      ]
    },
    {
      "district_name": "Kishoreganj",
      "upazila": [
        {"upazila_name": "Tarail"},
        {"upazila_name": "Pakundia"},
        {"upazila_name": "Nikli"},
        {"upazila_name": "Mithamoin"},
        {"upazila_name": "Kuliarchar"},
        {"upazila_name": "KishoreganjSada"},
        {"upazila_name": "Katiadi"},
        {"upazila_name": "Karimganj"},
        {"upazila_name": "Itna"},
        {"upazila_name": "Hossainpur"},
        {"upazila_name": "Bhairab"},
        {"upazila_name": "Bajitpur"},
        {"upazila_name": "Austagram"}
      ]
    },
    {
      "district_name": "Gopalganj",
      "upazila": [
        {"upazila_name": "Tungipara"},
        {"upazila_name": "Muksudpur"},
        {"upazila_name": "Kotwalipara"},
        {"upazila_name": "Kasiani"},
        {"upazila_name": "GopalganjSadar"}
      ]
    },
    {
      "district_name": "Gazipur",
      "upazila": [
        {"upazila_name": "Sreepur"},
        {"upazila_name": "Kapasia"},
        {"upazila_name": "Kaliganz"},
        {"upazila_name": "Kaliakair"},
        {"upazila_name": "GazipurSadar"}
      ]
    },
    {
      "district_name": "Faridpur",
      "upazila": [
        {"upazila_name": "Madhukhali"},
        {"upazila_name": "Saltha"},
        {"upazila_name": "Sadarpur"},
        {"upazila_name": "Nagarkanda"},
        {"upazila_name": "FaridpurSadar"},
        {"upazila_name": "Charbhadrasan"},
        {"upazila_name": "Boalmari"},
        {"upazila_name": "Bhanga"},
        {"upazila_name": "Alfadanga"}
      ]
    },
    {
      "district_name": "Dhaka",
      "upazila": [
        {"upazila_name": "Savar"},
        {"upazila_name": "Nawabganj"},
        {"upazila_name": "Keraniganj"},
        {"upazila_name": "Dohar"},
        {"upazila_name": "Dhamrai"},
        {"upazila_name": "Tejgaon Circle"}
      ]
    },
    {
      "district_name": "RANGAMATI",
      "upazila": [
        {"upazila_name": "RAJASTHALI"},
        {"upazila_name": "BELAICHHARI"},
        {"upazila_name": "KAPTAI"},
        {"upazila_name": "NANEARCHAR"},
        {"upazila_name": "JURAICHARI"},
        {"upazila_name": "BAGHAICHARI"},
        {"upazila_name": "BARKAL"},
        {"upazila_name": "KAWKHALI"},
        {"upazila_name": "LANGADU"},
        {"upazila_name": "RANGAMATISADAR"}
      ]
    },
    {
      "district_name": "NOAKHALI",
      "upazila": [
        {"upazila_name": "SUBARNA CHAR"},
        {"upazila_name": "SONAIMURI"},
        {"upazila_name": "KABIRHAT"},
        {"upazila_name": "NOAKHALISADAR"},
        {"upazila_name": "SENBAG"},
        {"upazila_name": "HATIYA"},
        {"upazila_name": "COMPANIGANJ"},
        {"upazila_name": "CHATKHIL"}
      ]
    },
    {
      "district_name": "LAXMIPUR",
      "upazila": [
        {"upazila_name": "KAMALNAGAR"},
        {"upazila_name": "RAMGATI"},
        {"upazila_name": "RAMGANJ"},
        {"upazila_name": "RAIPUR"},
        {"upazila_name": "LAXMIPURSADAR"}
      ]
    },
    {
      "district_name": "KHAGRACHHARI",
      "upazila": [
        {"upazila_name": "LAKSHMICHHARI"},
        {"upazila_name": "MANIKCHHARI"},
        {"upazila_name": "MATIRANGA"},
        {"upazila_name": "RAMGARH"},
        {"upazila_name": "PANCHHARI"},
        {"upazila_name": "DIGHINALA"},
        {"upazila_name": "MAHALCHHARI"},
        {"upazila_name": "KHAGRACHARISADAR"}
      ]
    },
    {
      "district_name": "Feni",
      "upazila": [
        {"upazila_name": "Chhagalniya"},
        {"upazila_name": "Daganbhuiyan"},
        {"upazila_name": "FeniSadar"},
        {"upazila_name": "Porashuram"},
        {"upazila_name": "Sonagazi"},
        {"upazila_name": "Fulgazi"}
      ]
    },
    {
      "district_name": "Pirojpur",
      "upazila": [
        {"upazila_name": "Zianagar"},
        {"upazila_name": "PirojpurSadar"},
        {"upazila_name": "Nesarabad"},
        {"upazila_name": "Nasirpur"},
        {"upazila_name": "Mothbaria"},
        {"upazila_name": "Kawkhali"},
        {"upazila_name": "Bhandaria"}
      ]
    },
    {
      "district_name": "Patuakhali",
      "upazila": [
        {"upazila_name": "Rangabali"},
        {"upazila_name": "Dumki"},
        {"upazila_name": "PatuakhaliSadar"},
        {"upazila_name": "Mirjaganj"},
        {"upazila_name": "Kalapara"},
        {"upazila_name": "Galachipa"},
        {"upazila_name": "Dashmina"},
        {"upazila_name": "Bauphal"}
      ]
    },
    {
      "district_name": "Jhalakati",
      "upazila": [
        {"upazila_name": "Rajapur"},
        {"upazila_name": "Nalchiti"},
        {"upazila_name": "Kanthalia"},
        {"upazila_name": "JhalakatiSadar"}
      ]
    },
    {
      "district_name": "Bagerhat",
      "upazila": [
        {"upazila_name": "Sharankhola"},
        {"upazila_name": "Rampal"},
        {"upazila_name": "Morrelganj"},
        {"upazila_name": "Mongla"},
        {"upazila_name": "Mollahat"},
        {"upazila_name": "Kachua"},
        {"upazila_name": "Fakirhat"},
        {"upazila_name": "Chitalmari"},
        {"upazila_name": "BagerhatSadar"}
      ]
    },
    {
      "district_name": "Chuadanga",
      "upazila": [
        {"upazila_name": "Jibannagar"},
        {"upazila_name": "Damurhuda"},
        {"upazila_name": "ChuadangaSadar"},
        {"upazila_name": "Alamdanga"}
      ]
    },
    {
      "district_name": "Jessore",
      "upazila": [
        {"upazila_name": "Sharsha"},
        {"upazila_name": "Monirampur"},
        {"upazila_name": "Keshabpur"},
        {"upazila_name": "Jhikargacha"},
        {"upazila_name": "JessoreSadar"},
        {"upazila_name": "Chowgacha"},
        {"upazila_name": "Bagherpara"},
        {"upazila_name": "Abhoynagar"}
      ]
    },
    {
      "district_name": "Jhenaidha",
      "upazila": [
        {"upazila_name": "Shailkupa"},
        {"upazila_name": "Moheshpur"},
        {"upazila_name": "Kotchandpur"},
        {"upazila_name": "Kaligonj"},
        {"upazila_name": "JhenaidahSadar"},
        {"upazila_name": "Harinakunda"}
      ]
    },
    {
      "district_name": "Khulna",
      "upazila": [
        {"upazila_name": "Terokhada"},
        {"upazila_name": "Rupsa"},
        {"upazila_name": "Phultala"},
        {"upazila_name": "Paikgacha"},
        {"upazila_name": "Koyra"},
        {"upazila_name": "Dumuria"},
        {"upazila_name": "Dighulia"},
        {"upazila_name": "Dacope"},
        {"upazila_name": "Batiaghata"}
      ]
    },
    {
      "district_name": "Kushtia",
      "upazila": [
        {"upazila_name": "Mirpur"},
        {"upazila_name": "KushtiaSadar"},
        {"upazila_name": "Kumarkhali"},
        {"upazila_name": "Khoksha"},
        {"upazila_name": "Daulatpur"},
        {"upazila_name": "Bheramara"}
      ]
    },
    {
      "district_name": "Magura",
      "upazila": [
        {"upazila_name": "Sreepur"},
        {"upazila_name": "Salikha"},
        {"upazila_name": "Mohammadpur"},
        {"upazila_name": "MaguraSadar"}
      ]
    },
    {
      "district_name": "Meherpur",
      "upazila": [
        {"upazila_name": "Mujibnagar"},
        {"upazila_name": "MeherpurSadar"},
        {"upazila_name": "Gangni"}
      ]
    },
    {
      "district_name": "Narail",
      "upazila": [
        {"upazila_name": "NarailSadar"},
        {"upazila_name": "Lohagara"},
        {"upazila_name": "Kalia"}
      ]
    },
    {
      "district_name": "Satkhira",
      "upazila": [
        {"upazila_name": "Tala"},
        {"upazila_name": "Shyamnagar"},
        {"upazila_name": "SatkhiraSadar"},
        {"upazila_name": "Kaligunj"},
        {"upazila_name": "Kalaroa"},
        {"upazila_name": "Debhata"},
        {"upazila_name": "Assasuni"}
      ]
    },
    {
      "district_name": "Chapai HNawabganj",
      "upazila": [
        {"upazila_name": "Shibganj"},
        {"upazila_name": "NawabganjSadar"},
        {"upazila_name": "Nachol"},
        {"upazila_name": "Gomostapur"},
        {"upazila_name": "Bholahat"}
      ]
    },
    {
      "district_name": "Joypurhat",
      "upazila": [
        {"upazila_name": "Panchbibi"},
        {"upazila_name": "Khetlal"},
        {"upazila_name": "Kalai"},
        {"upazila_name": "JoypurhatSadar"},
        {"upazila_name": "Akkelpur"}
      ]
    },
    {
      "district_name": "Naogaon",
      "upazila": [
        {"upazila_name": "Shapahar"},
        {"upazila_name": "Raninagar"},
        {"upazila_name": "Porsha"},
        {"upazila_name": "Patnitala"},
        {"upazila_name": "Niamatpur"},
        {"upazila_name": "NaogaonSadar"},
        {"upazila_name": "Manda"},
        {"upazila_name": "Mohadevpur"},
        {"upazila_name": "Dhamoirhat"},
        {"upazila_name": "Badalgachi"},
        {"upazila_name": "Atrai"}
      ]
    },
    {
      "district_name": "Natore",
      "upazila": [
        {"upazila_name": "Singra"},
        {"upazila_name": "NatoreSadar"},
        {"upazila_name": "Naldanga"},
        {"upazila_name": "Gurudaspur"},
        {"upazila_name": "Baraigram"},
        {"upazila_name": "Bagatipara"},
        {"upazila_name": "Lalpur"}
      ]
    },
    {
      "district_name": "Pabna",
      "upazila": [
        {"upazila_name": "Sujanagar"},
        {"upazila_name": "Santhia"},
        {"upazila_name": "PabnaSadar"},
        {"upazila_name": "Ishwardi"},
        {"upazila_name": "Faridpur"},
        {"upazila_name": "Chatmohar"},
        {"upazila_name": "Bhangura"},
        {"upazila_name": "Bera"},
        {"upazila_name": "Atghoria"}
      ]
    },
    {
      "district_name": "Rajshahi",
      "upazila": [
        {"upazila_name": "Tanore"},
        {"upazila_name": "Puthia"},
        {"upazila_name": "Paba"},
        {"upazila_name": "Mohanpur"},
        {"upazila_name": "Godagari"},
        {"upazila_name": "Durgapur"},
        {"upazila_name": "Charghat"},
        {"upazila_name": "Bagmara"},
        {"upazila_name": "Bagha"}
      ]
    },
    {
      "district_name": "Sirajganj",
      "upazila": [
        {"upazila_name": "Ullapara"},
        {"upazila_name": "Tarash"},
        {"upazila_name": "SerajganjSadar"},
        {"upazila_name": "Shahzadpur"},
        {"upazila_name": "Raiganj"},
        {"upazila_name": "Kazipur"},
        {"upazila_name": "Kamarkhand"},
        {"upazila_name": "Chowhali"},
        {"upazila_name": "Belkuchi"}
      ]
    },
    {
      "district_name": "Dinajpur",
      "upazila": [
        {"upazila_name": "Parbatipur"},
        {"upazila_name": "Nawabganj"},
        {"upazila_name": "Khanshama"},
        {"upazila_name": "Kaharol"},
        {"upazila_name": "Hakimpur"},
        {"upazila_name": "Ghoraghat"},
        {"upazila_name": "Fulbari"},
        {"upazila_name": "DinajpurSadar"},
        {"upazila_name": "Bochaganj"},
        {"upazila_name": "Birol"},
        {"upazila_name": "Birganj"},
        {"upazila_name": "Birampur"}
      ]
    },
    {
      "district_name": "Gaibandha",
      "upazila": [
        {"upazila_name": "Sundarganj"},
        {"upazila_name": "Shaghata"},
        {"upazila_name": "Sadullapur"},
        {"upazila_name": "Palashbari"},
        {"upazila_name": "Gobindaganj"},
        {"upazila_name": "GaibandhaSadar"},
        {"upazila_name": "Fulchari"}
      ]
    },
    {
      "district_name": "Kurigram",
      "upazila": [
        {"upazila_name": "Ulipur"},
        {"upazila_name": "Rowmari"},
        {"upazila_name": "Rajibpur"},
        {"upazila_name": "Fulbari"},
        {"upazila_name": "Nageswari"},
        {"upazila_name": "KurigramSadar"},
        {"upazila_name": "Chilmari"},
        {"upazila_name": "Bhurungamari"}
      ]
    },
    {
      "district_name": "Lalmonirhat",
      "upazila": [
        {"upazila_name": "Patgram"},
        {"upazila_name": "LalmonirhatSadar"},
        {"upazila_name": "Kaaliganj"},
        {"upazila_name": "Hatibandha"},
        {"upazila_name": "Aditmari"}
      ]
    },
    {
      "district_name": "Nilphamari",
      "upazila": [
        {"upazila_name": "Sayedpur"},
        {"upazila_name": "NilphamariSadar"},
        {"upazila_name": "Kishoreganj"},
        {"upazila_name": "Jaldhaka"},
        {"upazila_name": "Dimla"},
        {"upazila_name": "Domar"}
      ]
    },
    {
      "district_name": "Panchagarh",
      "upazila": [
        {"upazila_name": "Tetulia"},
        {"upazila_name": "PanchagarhSadar"},
        {"upazila_name": "Debiganj"},
        {"upazila_name": "Boda"},
        {"upazila_name": "Atwari"}
      ]
    },
    {
      "district_name": "Rangpur",
      "upazila": [
        {"upazila_name": "Taraganj"},
        {"upazila_name": "RangpurSadar"},
        {"upazila_name": "Pirganj"},
        {"upazila_name": "Pirgacha"},
        {"upazila_name": "Mithapukur"},
        {"upazila_name": "Kaunia"},
        {"upazila_name": "Gangachara"},
        {"upazila_name": "Badarganj"}
      ]
    },
    {
      "district_name": "Thakurgaon",
      "upazila": [
        {"upazila_name": "Ranisankail"},
        {"upazila_name": "ThakurgaonSadar"},
        {"upazila_name": "Pirganj"},
        {"upazila_name": "Haripur"},
        {"upazila_name": "Baliadangi"}
      ]
    },
    {
      "district_name": "Habiganj",
      "upazila": [
        {"upazila_name": "Nabiganj"},
        {"upazila_name": "Madhabpur"},
        {"upazila_name": "Lakhai"},
        {"upazila_name": "HabiganjSadar"},
        {"upazila_name": "Chunarughat"},
        {"upazila_name": "Baniachong"},
        {"upazila_name": "Bahubal"},
        {"upazila_name": "Azmiriganj"}
      ]
    },
    {
      "district_name": "Moulvibazar",
      "upazila": [
        {"upazila_name": "Sreemangal"},
        {"upazila_name": "Rajnagar"},
        {"upazila_name": "MoulvibazarSadar"},
        {"upazila_name": "Kulaura"},
        {"upazila_name": "Kamalganj"},
        {"upazila_name": "Juri"},
        {"upazila_name": "Barlekha"}
      ]
    },
    {
      "district_name": "COX'S BAZAR",
      "upazila": [
        {"upazila_name": "PEKUA"},
        {"upazila_name": "UKHIYA"},
        {"upazila_name": "TEKNAF"},
        {"upazila_name": "RAMU"},
        {"upazila_name": "MOHESKHALI"},
        {"upazila_name": "KUTUBDIA"},
        {"upazila_name": "COX'S BAZARSADAR"},
        {"upazila_name": "CHAKORIA"}
      ]
    },
    {
      "district_name": "COMILLA",
      "upazila": [
        {"upazila_name": "BARURA"},
        {"upazila_name": "BRAHMANPARA"},
        {"upazila_name": "BURICHONG"},
        {"upazila_name": "CHANDINA"},
        {"upazila_name": "CHAUDDAGRAM"},
        {"upazila_name": "DAUDKANDI"},
        {"upazila_name": "DEBIDWAR"},
        {"upazila_name": "HOMNA"},
        {"upazila_name": "LAKSAM"},
        {"upazila_name": "MONOHORGANJ"},
        {"upazila_name": "MURADNAGAR"},
        {"upazila_name": "NANGALKOT"},
        {"upazila_name": "COMILLASADAR"},
        {"upazila_name": "TITASH"}
      ]
    },
    {
      "district_name": "CHITTAGONG",
      "upazila": [
        {"upazila_name": "LOHAGARA"},
        {"upazila_name": "SATKANIA"},
        {"upazila_name": "PATIYA"},
        {"upazila_name": "CHANDANISH"},
        {"upazila_name": "BOALKHALI"},
        {"upazila_name": "BANSKHALI"},
        {"upazila_name": "ANWARA"},
        {"upazila_name": "SITAKUNDA"},
        {"upazila_name": "SANDWIP"},
        {"upazila_name": "RAOJAN"},
        {"upazila_name": "RANGUNIA"},
        {"upazila_name": "MIRSHARAI"},
        {"upazila_name": "HATHAZARI"},
        {"upazila_name": "FATIKCHARI"}
      ]
    },
    {
      "district_name": "CHANDPUR",
      "upazila": [
        {"upazila_name": "CHANDPURSADAR"},
        {"upazila_name": "FARIDGAN"},
        {"upazila_name": "HAIMCHAR"},
        {"upazila_name": "HAZIGANJ"},
        {"upazila_name": "KACHUA"},
        {"upazila_name": "UTTAR MATLAB"},
        {"upazila_name": "SHAHRASTI"},
        {"upazila_name": "DAKSHIN MATLAB "}
      ]
    },
    {
      "district_name": "Bogra",
      "upazila": [
        {"upazila_name": "Sonatala"},
        {"upazila_name": "Shibganj"},
        {"upazila_name": "Sherpor"},
        {"upazila_name": "Sajahanpur"},
        {"upazila_name": "Sariakandi"},
        {"upazila_name": "Nandigram"},
        {"upazila_name": "Kahaloo"},
        {"upazila_name": "Gabtali"},
        {"upazila_name": "Dhupchanchia"},
        {"upazila_name": "Dhunat"},
        {"upazila_name": "BograSadar"},
        {"upazila_name": "Adamdighi"}
      ]
    },
    {
      "district_name": "BANDARBAN",
      "upazila": [
        {"upazila_name": "BANDARBANSADAR"},
        {"upazila_name": "RUMA"},
        {"upazila_name": "ROWANGCHHARI"},
        {"upazila_name": "THANCHI"},
        {"upazila_name": "LAMA"},
        {"upazila_name": "NAIKHYONGCHARI"},
        {"upazila_name": "ALIKADAM"}
      ]
    },
    {
      "district_name": "BRAHMANBARIA",
      "upazila": [
        {"upazila_name": "Bijoynagar"},
        {"upazila_name": "Kasba"},
        {"upazila_name": "Nabinagar"},
        {"upazila_name": "Nasirnagar"},
        {"upazila_name": "Sarail"},
        {"upazila_name": "B.Baria Sadar"},
        {"upazila_name": "AKHAURA"},
        {"upazila_name": "Bancharampur"},
        {"upazila_name": "Ashuganj"}
      ]
    },
    {
      "district_name": "Barisal",
      "upazila": [
        {"upazila_name": "Agailjhara"},
        {"upazila_name": "Uzirpur"},
        {"upazila_name": "Muladi"},
        {"upazila_name": "Mehendiganj"},
        {"upazila_name": "Hizla"},
        {"upazila_name": "Gournadi"},
        {"upazila_name": "BarisalSadar"},
        {"upazila_name": "Benaripara"},
        {"upazila_name": "Bakerganj"},
        {"upazila_name": "Babuganj"}
      ]
    },
    {
      "district_name": "Bhola",
      "upazila": [
        {"upazila_name": "BholaSadar"},
        {"upazila_name": "Daulatkhan"},
        {"upazila_name": "Borhanuddin"},
        {"upazila_name": "Lalmohan"},
        {"upazila_name": "Charfassion"},
        {"upazila_name": "Monpura"},
        {"upazila_name": "Tazumuddin"}
      ]
    },
    {
      "district_name": "Borguna",
      "upazila": [
        {"upazila_name": "Amtali"},
        {"upazila_name": "Bamna"},
        {"upazila_name": "BargunaSadar"},
        {"upazila_name": "Betagi"},
        {"upazila_name": "Patharghata"},
        {"upazila_name": "Taltali"}
      ]
    },
    {
      "district_name": "Sylhet",
      "upazila": [
        {"upazila_name": "Zakiganj"},
        {"upazila_name": "SylhetSadar"},
        {"upazila_name": "Kanaighat"},
        {"upazila_name": "Jointiapur"},
        {"upazila_name": "Gowainghat"},
        {"upazila_name": "Golapganj"},
        {"upazila_name": "Fenchuganj"},
        {"upazila_name": "Dakshin Surma"},
        {"upazila_name": "Companiganj"},
        {"upazila_name": "Biswanath"},
        {"upazila_name": "Beanibazar"},
        {"upazila_name": "Balaganj"}
      ]
    },
    {
      "district_name": "Sunamganj",
      "upazila": [
        {"upazila_name": "Tahirpur"},
        {"upazila_name": "SunamganjSadar"},
        {"upazila_name": "Sulla"},
        {"upazila_name": "Jamalganj"},
        {"upazila_name": "Jagannathpur"},
        {"upazila_name": "Derai"},
        {"upazila_name": "Doarabazar"},
        {"upazila_name": "Dakshin Sunamganj"},
        {"upazila_name": "Chhatak"},
        {"upazila_name": "Biswamvarpur"}
      ]
    }
  ];
}
