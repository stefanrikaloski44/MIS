import 'package:flutter/material.dart';
import '../services/location_service.dart';

class AddressWidget extends StatefulWidget {
  final Function(String location, double latitude, double longitude)
      onLocationSelected;

  const AddressWidget({super.key, required this.onLocationSelected});

  @override
  State<AddressWidget> createState() => _AddressWidgetState();
}

class _AddressWidgetState extends State<AddressWidget> {
  final _addressController = TextEditingController();
  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _addressController,
          decoration: InputDecoration(
            labelText: 'Location',
            suffixIcon: _isSearching
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: _searchLocation,
                  ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a location';
            }
            return null;
          },
        ),
        const SizedBox(height: 8),
        ElevatedButton.icon(
          onPressed: _getCurrentLocation,
          icon: const Icon(Icons.my_location),
          label: const Text('Use Current Location'),
        ),
      ],
    );
  }

  Future<void> _searchLocation() async {
    final address = _addressController.text;
    if (address.isEmpty) return;

    setState(() => _isSearching = true);

    try {
      final locations = await LocationService.getLocationFromAddress(address);
      if (locations.isNotEmpty) {
        final location = locations.first;
        widget.onLocationSelected(
          address,
          location.latitude,
          location.longitude,
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not find location')),
      );
    } finally {
      setState(() => _isSearching = false);
    }
  }

  Future<void> _getCurrentLocation() async {
    setState(() => _isSearching = true);

    try {
      final position = await LocationService.getCurrentLocation();
      final placemarks = await LocationService.getAddressFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        final placemark = placemarks.first;
        final address =
            '${placemark.street}, ${placemark.locality}, ${placemark.country}';
        _addressController.text = address;
        widget.onLocationSelected(
          address,
          position.latitude,
          position.longitude,
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    } finally {
      setState(() => _isSearching = false);
    }
  }

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }
}