import 'package:flutter/material.dart';
import 'package:mango/media_test/models/media.dart';
import 'package:mango/media_test/ui/screens/picker_screen.dart';

// Home screen widget
class media_upload extends StatefulWidget {
  // Constructor for the media_upload widget
  const media_upload({super.key});

  @override
  State<media_upload> createState() => _media_uploadState();
}

// State class for the home screen
class _media_uploadState extends State<media_upload> {
  // List to hold selected media items
  final List<Media> _selectedMedias = [];

  // Method to update selected media items
  void _updateSelectedMedias(List<Media> entities) {
    setState(() {
      // Clear existing selected media items
      _selectedMedias.clear();
      // Add newly selected media items
      _selectedMedias.addAll(entities);
    });
  }

  // Method to handle FloatingActionButton onPressed event
  Future<void> _handleFloatingActionButton() async {
    final List<Media>? result = await Navigator.push<List<Media>>(
      // Navigate to the picker screen
      context,
      MaterialPageRoute(
        builder: (context) => PickerScreen(
            selectedMedias:
                _selectedMedias), // Pass the selected media items to the picker screen
      ),
    );
    if (result != null) {
      // Update selected media items with the result from the picker screen
      _updateSelectedMedias(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // App bar title
        title: const Text("Media Picker"),
      ),
      body: ListView.builder(
        // Number of selected media items
        itemCount: _selectedMedias.length,
        // Apply bouncing scroll physics
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              // Apply padding to each selected media item
              horizontal: 8.0,
              vertical: 4.0,
            ),
            // Display selected media widget
            child: _selectedMedias[index].widget,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        // Call _handleFloatingActionButton method when FloatingActionButton is pressed
        onPressed: _handleFloatingActionButton,
        // Floating action button icon
        child: const Icon(Icons.image_rounded),
      ),
    );
  }
}
