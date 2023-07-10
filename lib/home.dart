import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:url_launcher/url_launcher.dart';
import 'splash screen.dart';

void main() {
  runApp(HomeScreen());
}

class CurrencyData {
  final String date;
  final double value;
  final Color color;


  CurrencyData(this.date, this.value, this.color);
}


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _progress=0;
  late InAppWebViewController webView;

  List<Color> graphColors = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.orange,
    Colors.purple,
  ];
  BannerAd? bannerAd;
  bool isLoaded=false;
  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    bannerAd=BannerAd(size: AdSize.banner,
      adUnitId: "ca-app-pub-3940256099942544/6300978111",
      listener: BannerAdListener(
          onAdLoaded: (ad){
            setState(() {
              isLoaded=true;
            }
            );
            print("Banner Ad Loaded");
          },
          onAdFailedToLoad: (ad,error){
            ad.dispose();

          }
      ), request: AdRequest(),
    );
    bannerAd!.load();
  }
  String getCurrentDateTime() {
    final now = DateTime.now();
    final formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    return formatter.format(now);
  }

  List<CurrencyData> getCurrencyData() {
    return [
      CurrencyData('Qatari Rial', 75.95, graphColors[0]),
      CurrencyData('Dollar', 276.54, graphColors[1]),
      CurrencyData('Euro',300.82, graphColors[2]),
      CurrencyData('Durham', 75.29 , graphColors[3]),
      CurrencyData('Dinar', 899.99 , graphColors[4]),
    ];
  }

  List<String> _countries = [
    'Afghanistan',
    'Albania',
    'Algeria',
    'American Samoa',
    'Andorra',
    'Angola',
    'Anguilla',
    'Antigua and Barbuda',
    'Argentina',
    'Armenia',
    'Aruba',
    'Australia',
    'Austria',
    'Azerbaijan',
    'Bahamas',
    'Bahrain',
    'Bangladesh',
    'Barbados',
    'Belarus',
    'Belgium',
    'Belize',
    'Benin',
    'Bermuda',
    'Bhutan',
    'Bolivia (Plurinat.State)',
    'Bonaire/S.Eustatius/Saba',
    'Bosnia and Herzegovina',
    'Botswana',
    'Brazil',
    'British Indian Ocean Ter',
    'British Virgin Islands',
    'Brunei Darussalam',
    'Bulgaria',
    'Burkina Faso',
    'Burundi',
    'Cabo Verde',
    'Cambodia',
    'Cameroon',
    'Canada',
    'Cayman Islands',
    'Central African Republic',
    'Chad',
    'Channel Islands',
    'Chile',
    'China',
    'China, Hong Kong SAR',
    'China, Macao SAR',
    'Taiwan Province of China',
    'Christmas Island',
    'Cocos (Keeling) Islands',
    'Colombia',
    'Comoros',
    'Congo',
    'Congo, Dem. Rep. of the',
    'Cook Islands',
    'Costa Rica',
    "Côte d'Ivoire",
    'Croatia',
    'Cuba',
    'Curaçao',
    'Cyprus',
    'Czechia',
    'Denmark',
    'Djibouti',
    'Dominica',
    'Dominican Republic',
    'Ecuador',
    'Egypt',
    'El Salvador',
    'Equatorial Guinea',
    'Eritrea',
    'Estonia',
    'Ethiopia',
    'Falkland Is.(Malvinas)',
    'Faroe Islands',
    'Fiji, Republic of',
    'Finland',
    'France',
    'French Guiana',
    'French Polynesia',
    'French Southern Terr',
    'Gabon',
    'Gambia',
    'Georgia',
    'Germany',
    'Ghana',
    'Gibraltar',
    'Greece',
    'Greenland',
    'Grenada',
    'Guadeloupe',
    'Guam',
    'Guatemala',
    'Guernsey',
    'Guinea',
    'Guinea-Bissau',
    'Guyana',
    'Haiti',
    'Honduras',
    'Hungary',
    'Iceland',
    'India',
    'Indonesia',
    'Iran (Islamic Rep. of)',
    'Iraq',
    'Ireland',
    'Isle of Man',
    'Israel',
    'Italy',
    'Jamaica',
    'Japan',
    'Jersey',
    'Jordan',
    'Kazakhstan',
    'Kenya',
    'Kiribati',
    'Korea',
    'Korea',
    'Kuwait',
    'Kyrgyzstan',
    'Lao People\'s Dem. Rep.',
    'Latvia',
    'Lebanon',
    'Lesotho',
    'Liberia',
    'Libya',
    'Liechtenstein',
    'Lithuania',
    'Luxembourg',
    'Macedonia, Fmr Yug Rp of',
    'Madagascar',
    'Malawi',
    'Malaysia',
    'Maldives',
    'Mali',
    'Malta',
    'Marshall Islands',
    'Martinique',
    'Mauritania',
    'Mauritius',
    'Mayotte',
    'Mexico',
    'Micronesia,Fed.States of',
    'Moldova, Republic of',
    'Mongolia',
    'Montenegro',
    'Montserrat',
    'Morocco',
    'Mozambique',
    'Myanmar',
    'Namibia',
    'Nauru',
    'Nepal',
    'Netherlands',
    'New Caledonia',
    'New Zealand',
    'Nicaragua',
    'Niger',
    'Nigeria',
    'Niue',
    'Northern Mariana Is.',
    'Norway',
    'Oman',
    'Pakistan',
    'Palau',
    'Panama',
    'Papua New Guinea',
    'Paraguay',
    'Peru',
    'Philippines',
    'Pitcairn Islands',
    'Poland',
    'Portugal',
    'Puerto Rico',
    'Qatar',
    'Réunion',
    'Romania',
    'Russian Federation',
    'Rwanda',
    'Saint Barthélemy',
    'Saint Helena',
    'Saint Kitts and Nevis',
    'Saint Lucia',
    'Saint-Martin',
    'St. Pierre and Miquelon',
    'Saint Vincent/Grenadines',
    'Samoa',
    'Sao Tome and Principe',
    'Saudi Arabia',
    'Senegal',
    'Serbia',
    'Seychelles',
    'Sierra Leone',
    'Singapore',
    'Sint Maarten',
    'Slovakia',
    'Solomon Islands',
    'Somalia',
    'South Africa',
    'South Sudan',
    'Spain',
    'Sri Lanka',
    'Sudan',
    'Suriname',
    'Swaziland',
    'Sweden',
    'Switzerland',
    'Syrian Arab Republic',
    'Tajikistan',
    'Tanzania, United Rep. of',
    'Thailand',
    'Timor-Leste',
    'Togo',
    'Tokelau',
    'Tonga',
    'Trinidad and Tobago',
    'Tunisia',
    'Turkey',
    'Turkmenistan',
    'Turks and Caicos Is.',
    'Tuvalu',
    'Uganda',
    'Ukraine',
    'United Arab Emirates',
    'United Kingdom',
    'United States of America',
    'US Virgin Islands',
    'Uruguay',
    'Uzbekistan',
    'Vanuatu',
    'Venezuela, Boliv Rep of',
    'Viet Nam',
    'Wallis and Futuna Is.',
    'Western Sahara',
    'Yemen',
    'Zambia',
    'Zimbabwe',
  ];

  String _selectedCountry = 'Cameroon'; // Default selected country

  Map<String, String> _countryCurrencyMap = {
    'Afghanistan': 'Rupees',
    'Albania': 'Lek',
    'Algeria': 'Dinar',
    'American Samoa': 'US Dollar',
    'Andorra': 'Euro',
    'Angola': 'Kwanza',
    'Anguilla': 'East Caribbean Dollar',
    'Antigua and Barbuda': 'East Caribbean Dollar',
    'Argentina': 'Argentine Peso',
    'Armenia': 'Armenian Dram',
    'Aruba': 'Aruban Florin',
    'Australia': 'Australian Dollar',
    'Austria': 'Euro',
    'Azerbaijan': 'Azerbaijanian Manat',
    'Bahamas': 'Bahamian Dollar',
    'Bahrain': 'Bahraini Dinar',
    'Bangladesh': 'Taka',
    'Barbados': 'Barbados Dollar',
    'Belarus': 'Belarusian Ruble',
    'Belgium': 'Euro',
    'Belize': 'Belize Dollar',
    'Benin': 'CFA Franc (BCEAO)',
    'Bermuda': 'Bermudian Dollar',
    'Bhutan': 'Ngultrum',
    'Bolivia (Plurinat.State)': 'Boliviano',
    'Bonaire/S.Eustatius/Saba': 'US Dollar',
    'Bosnia and Herzegovina': 'Convertible Mark',
    'Botswana': 'Pula',
    'Brazil': 'Brazilian Real',
    'British Indian Ocean Ter': 'US Dollar',
    'British Virgin Islands': 'US Dollar',
    'Brunei Darussalam': 'Brunei Dollar',
    'Bulgaria': 'Bulgarian Lev',
    'Burkina Faso': 'CFA Franc (BCEAO)',
    'Burundi': 'Burundi Franc',
    'Cabo Verde': 'Cabo Verde Escudo',
    'Cambodia': 'Riel',
    'Cameroon': 'CFA Franc (BEAC)',
    'Canada': 'Canadian Dollar',
    'Cayman Islands': 'Cayman Islands Dollar',
    'Central African Republic': 'CFA Franc (BEAC)',
    'Chad': 'CFA Franc (BEAC)',
    'Channel Islands': 'Pound Sterling',
    'Chile': 'Chilean Peso',
    'China': 'Yuan Renminbi',
    'China, Hong Kong SAR': 'Hong Kong Dollar',
    'China, Macao SAR': 'Pataca',
    'Taiwan Province of China': 'New Taiwan Dollar',
    'Christmas Island': 'Australian Dollar',
    'Cocos (Keeling) Islands': 'Australian Dollar',
    'Colombia': 'Colombian Peso',
    'Comoros': 'Comoro Franc',
    'Congo': 'CFA Franc (BEAC)',
    'Congo, Dem. Rep. of the': 'Congolese Franc',
    'Cook Islands': 'New Zealand Dollar',
    'Costa Rica': 'Costa Rican Colón',
    'Côte d\'Ivoire': 'CFA Franc (BCEAO)',
    'Croatia': 'Croatian Kuna',
    'Cuba': 'Cuban Peso',
    'Curaçao': 'Netherlands Antillian Guilder',
    'Cyprus': 'Euro',
    'Czechia': 'Czech Koruna',
    'Denmark': 'Danish Krone',
    'Djibouti': 'Djibouti Franc',
    'Dominica': 'East Caribbean Dollar',
    'Dominican Republic': 'Dominican Peso',
    'Ecuador': 'US Dollar',
    'Egypt': 'Egyptian Pound',
    'El Salvador': 'US Dollar',
    'Equatorial Guinea': 'CFA Franc (BEAC)',
    'Eritrea': 'Nakfa',
    'Estonia': 'Euro',
    'Ethiopia': 'Ethiopian Birr',
    'Falkland Is.(Malvinas)': 'Falkland Islands Pound',
    'Faroe Islands': 'Danish Krone',
    'Fiji, Republic of': 'Fiji Dollar',
    'Finland': 'Euro',
    'France': 'Euro',
    'French Guiana': 'Euro',
    'French Polynesia': 'CFP Franc',
    'French Southern Terr': 'Euro',
    'Gabon': 'CFA Franc (BEAC)',
    'Gambia': 'Dalasi',
    'Georgia': 'Lari',
    'Germany': 'Euro',
    'Ghana': 'Ghana Cedi',
    'Gibraltar': 'Gibraltar Pound',
    'Greece': 'Euro',
    'Greenland': 'Danish Krone',
    'Grenada': 'East Caribbean Dollar',
    'Guadeloupe': 'Euro',
    'Guam': 'US Dollar',
    'Guatemala': 'Quetzal',
    'Guernsey': 'Pound Sterling',
    'Guinea': 'Guinea Franc',
    'Guinea-Bissau': 'CFA Franc (BCEAO)',
    'Guyana': 'Guyana Dollar',
    'Haiti': 'Gourde',
    'Honduras': 'Lempira',
    'Hungary': 'Forint',
    'Iceland': 'Iceland Króna',
    'India': 'Indian Rupee',
    'Indonesia': 'Rupiah',
    'Iran (Islamic Rep. of)': 'Iranian Rial',
    'Iraq': 'Iraqi Dinar',
    'Ireland': 'Euro',
    'Isle of Man': 'Pound Sterling',
    'Israel': 'New Israeli Sheqel',
    'Italy': 'Euro',
    'Jamaica': 'Jamaican Dollar',
    'Japan': 'Yen',
    'Jersey': 'Pound Sterling',
    'Jordan': 'Jordanian Dinar',
    'Kazakhstan': 'Tenge',
    'Kenya': 'Kenyan Shilling',
    'Kiribati': 'Australian Dollar',
    'Korea, Dem. People\'s Rep': 'North Korean Won',
    'Korea, Republic of': 'Won',
    'Kuwait': 'Kuwaiti Dinar',
    'Kyrgyzstan': 'Som',
    'Lao People\'s Dem. Rep.': 'Kip',
    'Latvia': 'Euro',
    'Lebanon': 'Lebanese Pound',
    'Lesotho': 'Loti',
    'Liberia': 'Liberian Dollar',
    'Libya': 'Libyan Dinar',
    'Liechtenstein': 'Swiss Franc',
    'Lithuania': 'Euro',
    'Luxembourg': 'Euro',
    'Macedonia, Fmr Yug Rp of': 'Denar',
    'Madagascar': 'Malagasy Ariary',
    'Malawi': 'Malawi Kwacha',
    'Malaysia': 'Malaysian Ringgit',
    'Maldives': 'Rufiyaa',
    'Mali': 'CFA Franc (BCEAO)',
    'Malta': 'Euro',
    'Marshall Islands': 'US Dollar',
    'Martinique': 'Euro',
    'Mauritania': 'Ouguiya',
    'Mauritius': 'Mauritius Rupee',
    'Mayotte': 'Euro',
    'Mexico': 'Mexican Peso',
    'Micronesia,Fed.States of': 'US Dollar',
    'Moldova, Republic of': 'Moldovan Leu',
    'Mongolia': 'Tugrik',
    'Montenegro': 'Euro',
    'Montserrat': 'East Caribbean Dollar',
    'Morocco': 'Moroccan Dirham',
    'Mozambique': 'Metical',
    'Myanmar': 'Kyat',
    'Namibia': 'Namibian Dollar',
    'Nauru': 'Australian Dollar',
    'Nepal': 'Nepalese Rupee',
    'Netherlands': 'Euro',
    'New Caledonia': 'CFP Franc',
    'New Zealand': 'New Zealand Dollar',
    'Nicaragua': 'Córdoba Oro',
    'Niger': 'CFA Franc (BCEAO)',
    'Nigeria': 'Naira',
    'Niue': 'New Zealand Dollar',
    'Northern Mariana Is.': 'US Dollar',
    'Norway': 'Norwegian Krone',
    'Oman': 'Rial Omani',
    'Pakistan': 'Pakistan Rupee',
    'Palau': 'US Dollar',
    'Panama': 'Balboa',
    'Papua New Guinea': 'Kina',
    'Paraguay': 'Guaraní',
    'Peru': 'Sol',
    'Philippines': 'Philippine Peso',
    'Pitcairn Islands': 'New Zealand Dollar',
    'Poland': 'Zloty',
    'Portugal': 'Euro',
    'Puerto Rico': 'US Dollar',
    'Qatar': 'Qatari Rial',
    'Réunion': 'Euro',
    'Romania': 'Romanian Leu',
    'Russian Federation': 'Russian Ruble',
    'Rwanda': 'Rwanda Franc',
    'Saint Barthélemy': 'Euro',
    'Saint Helena': 'Saint Helena Pound',
    'Saint Kitts and Nevis': 'East Caribbean Dollar',
    'Saint Lucia': 'East Caribbean Dollar',
    'Saint-Martin': 'Euro',
    'St. Pierre and Miquelon': 'Euro',
    'Saint Vincent/Grenadines': 'East Caribbean Dollar',
    'Samoa': 'Tala',
    'Sao Tome and Principe': 'Dobra',
    'Saudi Arabia': 'Saudi Riyal',
    'Senegal': 'CFA Franc (BCEAO)',
    'Serbia': 'Serbian Dinar',
    'Seychelles': 'Seychelles Rupee',
    'Sierra Leone': 'Leone',
    'Singapore': 'Singapore Dollar',
    'Sint Maarten': 'Netherlands Antillian Guilder',
    'Slovakia': 'Euro',
    'Slovenia': 'Euro',
    'Solomon Islands': 'Solomon Islands Dollar',
    'Somalia': 'Somali Shilling',
    'South Africa': 'Rand',
    'South Sudan': 'South Sudanese Pound',
    'Spain': 'Euro',
    'Sri Lanka': 'Sri Lanka Rupee (LKR)',
    'Sudan': 'Sudanese Pound (SDG)',
    'Suriname': 'Suriname Dollar (SRD)',
    'Swaziland': 'Lilangeni (SZL)',
    'Sweden': 'Swedish Krona (SEK)',
    'Switzerland': 'Swiss Franc (CHF)',
    'Syrian Arab Republic': 'Syrian Pound (SYP)',
    'Tajikistan': 'Somoni (TJS)',
    'Tanzania, United Rep. of': 'Tanzanian Shilling (TZS)',
    'Thailand': 'Baht (THB)',
    'Timor-Leste': 'US Dollar (USD)',
    'Togo': 'CFA Franc (BCEAO) (XOF)',
    'Tokelau': 'New Zealand Dollar (NZD)',
    'Tonga': 'Pa\'anga (TOP)',
    'Trinidad and Tobago': 'Trinidad and Tobago Dollar (TTD)',
    'Tunisia': 'Tunisian Dinar (TND)',
    'Turkey': 'Turkish Lira (TRY)',
    'Turkmenistan': 'Turkmenistan New Manat (TMT)',
    'Turks and Caicos Is.': 'US Dollar (USD)',
    'Tuvalu': 'Australian Dollar (AUD)',
    'Uganda': 'Uganda Shilling (UGX)',
    'Ukraine': 'Hryvnia (UAH)',
    'United Arab Emirates': 'UAE Dirham (AED)',
    'United Kingdom': 'Pound Sterling (GBP)',
    'United States of America': 'US Dollar (USD)',
    'US Virgin Islands': 'US Dollar (USD)',
    'Uruguay': 'Peso Uruguayo (UYU)',
    'Uzbekistan': 'Uzbekistan Sum (UZS)',
    'Vanuatu': 'Vatu (VUV)',
    'Venezuela, Boliv Rep of': 'Bolívar (VEF)',
    'Viet Nam': 'Dong (VND)',
    'Wallis and Futuna Is.': 'CFP Franc (XPF)',
    'Western Sahara': 'Moroccan Dirham (MAD)',
    'Yemen': 'Yemeni Rial (YER)',
    'Zambia': 'Zambian Kwacha (ZMW)',
    'Zimbabwe': 'Zimbabwe Dollar (ZW)',
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Screen',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Row(
            children: [
              Icon(
                Icons.currency_exchange,
                color: Colors.white,
              ),
              SizedBox(width: 8),
              Text(
                'ℍ𝕠𝕞𝕖',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          actions: [
            PopupMenuButton<String>(
              onSelected: (value) {
                // Perform action based on the selected option
                if (value == 'currency_rate') {
                  // Navigator.push(
                  //   context,
                  //   // MaterialPageRoute(builder: (context) => CurrencyRateScreen()),
                  // );  // Handle currency rate option
                } else if (value == 'currency_exchange') {
                  // Handle currency exchange option
                } else if (value == 'currency_converter') {
                  // Handle currency converter option
                } else if (value == 'currency_update') {
                  // Handle currency update option
                }
              },
              itemBuilder: (BuildContext context) => [
                PopupMenuItem<String>(
                  value: 'currency_rate',
                  child: Text('Currency Rate'),
                ),
                PopupMenuItem<String>(
                  value: 'currency_exchange',
                  child: Text('Currency Exchange'),
                ),
                PopupMenuItem<String>(
                  value: 'currency_converter',
                  child: Text('Currency Converter'),
                ),
                PopupMenuItem<String>(
                  value: 'currency_update',
                  child: Text('Currency Update'),
                ),
              ],
            ),
          ],
        ),
        body: Column(
          children: [
            if (isLoaded)
              Container(
                height: 50,
                child: AdWidget(ad: bannerAd!),
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.history),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WebViewScreen(),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.feedback),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WebViewScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: DropdownButton<String>(
                value: _selectedCountry,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCountry = newValue!;
                  });
                },
                items: _countries.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            Text(
              _countryCurrencyMap[_selectedCountry] ?? '',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: 300.0,
                child: charts.BarChart(
                  [
                    charts.Series<CurrencyData, String>(
                      id: 'Currency',
                      domainFn: (CurrencyData data, _) => data.date,
                      measureFn: (CurrencyData data, _) => data.value,
                      colorFn: (CurrencyData data, _) =>
                          charts.ColorUtil.fromDartColor(data.color),
                      data: getCurrencyData(),
                    ),
                  ],
                  animate: true,
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
              child: Text(
                'Currency rate of Pakistan',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        '🄳🄰🅃🄴: ',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Text(
                        DateFormat.yMMMMd().format(DateTime.now()),
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(width: 100),
                  Column(
                    children: [
                      Text(
                        '🅃🄸🄼🄴: ',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Text(
                        DateFormat.jm().format(DateTime.now()),
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
class WebViewScreen extends StatefulWidget {
  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  double _progress = 0;
  InAppWebViewController? webView;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebView'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                InAppWebView(
                  initialUrlRequest: URLRequest(
                    url: Uri.parse("https://www.google.com"),
                  ),
                  initialOptions: InAppWebViewGroupOptions(
                    crossPlatform: InAppWebViewOptions(
                      javaScriptEnabled: true,
                    ),
                  ),
                  onWebViewCreated: (controller) {
                    webView = controller;
                  },
                  onProgressChanged: (controller, progress) {
                    setState(() {
                      _progress = progress / 100;
                    });
                  },
                ),
                _progress < 1
                    ? SizedBox(
                  height: 3,
                  child: LinearProgressIndicator(
                    value: _progress,
                  ),
                )
                    : SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
