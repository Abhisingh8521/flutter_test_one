import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../controller/auth_controller.dart';

class ProfileScreen extends StatelessWidget {
  final AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: Center(
        child: StreamBuilder<Map<String, dynamic>?>(
          stream: controller.userProfileStream(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data == null) {
              return Text('No user data available');
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  snapshot.data!['profile_image'] != null
                      ? ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CachedNetworkImage(
                          imageUrl: snapshot.data!['profile_image'],
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 1,

                          child: IconButton(
                            icon: Icon(Icons.camera_alt),
                            onPressed: () => controller.uploadProfileImage(),
                          ),
                        ),
                      ],
                    ),
                  )
                      : Stack(
                    alignment: Alignment.center,
                    children: [
                      const Icon(Icons.account_circle, size: 100),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: IconButton(
                          icon: Icon(Icons.photo_camera_back_sharp),
                          onPressed: () => controller.uploadProfileImage(),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Name:'),
                      const SizedBox(width: 10.0),
                      Text(
                        '${snapshot.data!['first_name']}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Last name:'),
                      const SizedBox(width: 10.0),
                      Text(
                        '${snapshot.data!['last_name']}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Email:'),
                      const SizedBox(width: 10.0),
                      Text(
                        '${snapshot.data!['email']}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
