import 'package:travel_world/datamodel/user.dart';

import 'datamodel/agency.dart';
import 'datamodel/categories.dart';

class AppInfo {
  static UserModel loggedInUser = UserModel();

  static List<Agency> agencyNames = [
    Agency(
        content:
            'Kerala Tourism Department is a major government ministry under Kerala Government. It is prime regulatory agency that overviews and supervises entire tourism activities of the state. Kerala Tourism is ranked as one of the fastest growing tourism industry in the country and the ministry has been often adjudged as key department that aggressively worked on to make Kerala Tourism into Top 100 Superbrands.',
        image: 'https://express-press-release.net/61/logo/kerala.jpg',
        location: 'Kerala',
        name: 'Kerala Tourism Department'),
    Agency(
        content:
            'MakeMyTrip Limited is an Indian online travel company founded in 2000. Headquartered in Gurugram, Haryana, the company provides online travel services including flight tickets, domestic and international holiday packages, hotel reservations, and rail and bus tickets',
        image:
            'https://hippoprod.s3.amazonaws.com/merchants/logos/000/000/014/large/make_my_trip_india_logo.png',
        location: 'India',
        name: 'Make My Trip'),
    Agency(
        content:
            "Trivago N.V., marketed with lowercase styling as trivago, is a German transnational technology company specializing in internet-related services and products in the hotel, lodging and metasearch fields. The United States travel company Expedia Group owns a majority of the company's stock.",
        image: 'https://pluspng.com/img-png/trivago-png-open-2000.png',
        location: 'India',
        name: 'Trivago'),
    Agency(
        content:
            'Tripadvisor, Inc. is an online travel company that operates a global platform with user-generated content, price comparison tools, and online reservations for transportation, lodging, travel experiences, and restaurants. Its flagship brand, Tripadvisor.com, reached 490 million average monthly unique visitors in 2018',
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSphz2R7vxaxdBtp6M3hdll5ChdJ19Ql-3LXDB8aK3IWcjjzSIi&s',
        location: 'Global',
        name: 'Trip Advisor'),
    Agency(
        content:
            "Airbnb, Inc. is an online marketplace for arranging or offering lodging, primarily homestays, or tourism experiences. The company does not own any of the real estate listings, nor does it host events; it acts as a broker, receiving commissions from each booking.",
        image: 'https://m.blog.hu/ko/kobormacska/image/airbnb.jpg',
        location: 'California, United States',
        name: 'Airbnb'),
    Agency(
        content:
            'Skyscanner is an online travel company based in Edinburgh, Scotland and owned by Trip.com Group, the largest online travel agency in China. The site is available in over 30 languages and is used by 100 million people per month.',
        image:
            'https://www.skyscanner.co.in/sttc/blackbird/opengraph_solid_logo.png',
        location: 'Scotland, UK',
        name: 'Skyscanner'),
  ];
  static List<Categories> categoryNames = [
    Categories(
        desc:
            ' Duration : 02 Nights / 03 Days \nDestinations : Munnar - Cochin',
        image:
            'http://www.incrediblekeralatour.online/images/packages/kerala1.jpg',
        name: 'Kerala House Boat Tour ',
        rate: 4),
    Categories(
        desc:
            'Duration : 05 Nights / 06 Days \nDestinations :  Kumarakom - Allepey - Kovalam ',
        image:
            'http://www.incrediblekeralatour.online/images/packages/kerala6.jpg',
        name: 'Honeymoon in Kerala',
        rate: 1),
    Categories(
        desc:
            'Duration : 05 Nights / 06 Days \nDestinations : Munnar - Mattupetti',
        image:
            'https://english.mathrubhumi.com/polopoly_fs/1.3339696.1543125725!/image/image.jpg_gen/derivatives/landscape_894_577/image.jpg',
        name: 'Munnar Trekking',
        rate: 3),
    Categories(
        desc:
            'Duration : 05 Nights / 06 Days \nDestinations :Delhi - Agra - jaipur',
        image:
            'https://www.indiatourist.in/assets/images/tour-package-image/1537769813taj.jpg',
        name: 'The monumental city Delhi',
        rate: 2),
    Categories(
        desc:
            'Duration : 05 Nights / 06 Days \nDestinations :Jammu - Srinagar - Amritsar - Vaishnu Devi',
        image:
            'https://www.indiatourist.in/assets/images/tour-package-image/1536661950srinagar.jpg',
        name: 'Romantic Kashmir',
        rate: 4),
  ];

  static Agency selectedAgency = Agency();
  static Categories selectedCategory = Categories();
}
