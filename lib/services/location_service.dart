import 'package:location/location.dart';

class LocationService {
  double _latitude;
  double get lastLatitude => _latitude;
  double _longitude;
  double get lastLongitude => _longitude;
  DateTime _lastFetch;

  /// This functions will fetch the location & save it to cache
  ///
  /// You can pass in the [useCache] parameter if you want to fetch the
  /// location again. If the cache is empty it will fetch the location for the
  /// first time. By default useCache = true
  ///
  /// If the last fetch was more than 30 minutes ago it will fetch the location
  /// again, even if you pass in the useCache parameter.
  Future<LocationServiceResponse> getLocation({bool useCache = true}) async {
    if (useCache &&
        _latitude != null &&
        _longitude != null &&
        DateTime.now().difference(_lastFetch).inMinutes < 30) {
      return LocationServiceResponse(
        LocationPermissionsStatus.OK,
        locationData: LocationData.fromMap({
          "latitude": _latitude,
          "longitude": _longitude,
        }),
      );
    }

    Location location = new Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (serviceEnabled == false) {
      serviceEnabled = await location.requestService();
      if (serviceEnabled == false) {
        return LocationServiceResponse(
            LocationPermissionsStatus.SERVICE_DISABLED);
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return LocationServiceResponse(
            LocationPermissionsStatus.PERMISSIONS_DENIED);
      }
    }

    locationData = await location.getLocation();

    _latitude = locationData.latitude;
    _longitude = locationData.longitude;
    _lastFetch = DateTime.now();

    return LocationServiceResponse(LocationPermissionsStatus.OK,
        locationData: locationData);
  }
}

class LocationServiceResponse {
  final LocationPermissionsStatus status;
  final LocationData locationData;

  LocationServiceResponse(this.status, {this.locationData});
}

enum LocationPermissionsStatus {
  /// The location service on the device is disabled
  SERVICE_DISABLED,

  /// The user has denied the permission to retrieve location
  PERMISSIONS_DENIED,

  /// The service is enabled & the user has gived permissions
  OK,
}

// Singleton
final locationService = LocationService();

const String TEST_GOOGLE_GEOCODING_API_KEY =
    "AIzaSyCKVzB4xkCc79fOn8yMG6mZXkEq1Vo-yVs";

const String GOOGLE_GEOCODING_API_KEY =
    "AIzaSyA0TgrGsxbVMYT_KpTZfrzY6A_lOUsi82M";
