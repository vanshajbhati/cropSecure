// A screen that allows users to take a picture using a given camera.
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:cropsecure/main.dart';
import 'package:cropsecure/screen/addfarmer/addplots.dart';
import 'package:cropsecure/utill/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';







class TakePictureScreen extends StatefulWidget {

 final String photoOf;

TakePictureScreen(
 {
   this.photoOf
}

    );



  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  CameraController _controller;
   Future<void> _initializeControllerFuture;

  List cameras;
  int selectedCameraIdx;
  String imagePath;

  List<CameraDescription> _cameras;


  Future<void> _initCamera() async {
    _cameras = await availableCameras();

    _controller = CameraController(_cameras.first, ResolutionPreset.medium);
    _initializeControllerFuture = _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void initState() {

    _initCamera();
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.












  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Take a picture')),
      // You must wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner until the
      // controller has finished initializing.
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return CameraPreview(_controller);
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        // Provide an onPressed callback.
        onPressed: () async {
          // Take the Picture in a try / catch block. If anything goes wrong,
          // catch the error.
          try {
            // Ensure that the camera is initialized.
            await _initializeControllerFuture;

            // Attempt to take a picture and get the file `image`
            // where it was saved.
            final image = await _controller.takePicture();

            // If the picture was taken, display it on a new screen.

          String constPath = widget.photoOf;

          print(constPath+ " constPath");
          if(constPath=="farmer_plot_image_path"){
            AppConstants.farmer_plot_image_path = image.path;
            print("farmer");

          }
           else if(constPath=="phani_image_path"){
             AppConstants.phani_image_path = image.path;
             print("phani");
          }
           else{
            print("nothing");
          }
              print(image.path+"dfasdsf");

              print(AppConstants.phani_image_path+" <===   path of the file");



            await Get.back();

          } catch (e) {
            // If an error occurs, log the error to the console.
            print(e);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key key,  this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.file(File(imagePath)),
            InkWell(
              onTap: (){
                AppConstants.phani_image_path= imagePath;
                print(imagePath+"dfasdsf");
                print(AppConstants.phani_image_path+" <===   path of the file 1");
                Get.to(() => AddPlots(),transition: Transition.rightToLeftWithFade,duration: const Duration(milliseconds: 600));
              },
              child: Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20)
                ),
                child:
                Center(
                  child: Text("save", style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold

                  ),),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}