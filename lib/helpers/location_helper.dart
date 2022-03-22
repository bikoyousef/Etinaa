import 'package:http/http.dart' as http;
import 'dart:convert';

const googleAPI = 'AIzaSyCRipDHGhKGs_cri4Enld3igyZnEjszSsI';

class LocationHelper {
  static String generateLocationPreviewImage(
      {double? latitude, double? longtude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longtude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longtude&key=$googleAPI';
  }

  static Future<String> getLocationAddress(double lat, double lang) async {
    final url =Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lang&key=$googleAPI');
    final response = await http.get(url);
    return json.decode(response.body)['results'][0]['formatted_address'];
  }
}