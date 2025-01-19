import 'package:url_launcher/url_launcher_string.dart';

class GoogleMapsService {
  static Future<void> openDirections(double latitude, double longitude) async {
    final urlString = 
      'https://www.google.com/maps/dir/?api=1&destination=$latitude,$longitude';
    
    if (await canLaunchUrlString(urlString)) {
      await launchUrlString(urlString);
    } else {
      throw 'Could not launch Google Maps';
    }
  }

  static String getStaticMapUrl({
    required double latitude,
    required double longitude,
    int zoom = 15,
    int width = 600,
    int height = 300,
  }) {
    return 'https://maps.googleapis.com/maps/api/staticmap?'
        'center=$latitude,$longitude'
        '&zoom=$zoom'
        '&size=${width}x$height'
        '&markers=color:red%7C$latitude,$longitude'
        '&key=YOUR_GOOGLE_MAPS_API_KEY';
  }
}