import "dart:io";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:image_picker/image_picker.dart";
import "package:provider/provider.dart";
import "package:rental/Provider/PropertyProvider.dart";

class PropertyPicturePicker extends StatefulWidget {
  String? defaultPic;
  PropertyPicturePicker({this.defaultPic});
  @override
  State<StatefulWidget> createState() {
    return ProfilePicturePickerState();
  }
}

class ProfilePicturePickerState extends State<PropertyPicturePicker>{

  XFile? image = null;
  String? imagePath;

  Future pickImage(ImageSource imsrc,BuildContext ctx) async{

    try {
      final selectedImage = await ImagePicker().pickImage(
          source: imsrc);
      if (selectedImage == null) return;
      if(ctx.mounted){
        ctx.read<PropertyProvider>().selectedImage = selectedImage;
      }
  
      setState(() {
        this.image = selectedImage;
      });
    }catch(e){
      print("Failed to pick image ${e.toString()}");
    }
    Navigator.pop(ctx);
    super.initState();

  }

  Widget build(BuildContext context){
        imagePath = (widget.defaultPic != null && widget.defaultPic!.isNotEmpty)?widget.defaultPic:null;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
        Stack(children: [
          ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
             width: 380,
              height: 180,
              decoration: const BoxDecoration(
                color: Colors.grey,
              ),
              child: image!= null? !kIsWeb? Image.file(
                  width: 200,height: 200,
                  fit: BoxFit.cover,
                  File(image!.path)
              ): Image.network(image!.path) : imagePath==null? const Icon(Icons.person,size:200): Image.network(imagePath!)
       
            )
          ),

          Container(
            width: 400,
            height: 200,
            child: Align(
              alignment: Alignment.bottomRight,
              child: 
             Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100)
            ),
            child:
            Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.lightBlue
                ),
                child: 
                IconButton(
                  icon: const Icon(Icons.photo_camera,size: 35,color: Colors.white,), onPressed: () {
                    showDialog(context: context,
                        builder: (_)=> AlertDialog(
                          elevation: 24.0,
                          title: Text("Select an image"),
                          content: Text("Select an image from ?"),
                          actions: [
                            TextButton(onPressed: (){
                              pickImage(ImageSource.camera,context);
                            }, child: Text("Camera")),
                            TextButton(onPressed: (){
                              pickImage(ImageSource.gallery,context);
                            }, child: Text("Gallery")),
                            TextButton(onPressed: (){
                              Navigator.pop(context);
                            }, child: Text("Cancel"))
                          ],
                        ),
                      barrierDismissible: true
                    );
                  },
                ),
            ),
          )),
          )

         
        ])
      ]
    );
  }
}