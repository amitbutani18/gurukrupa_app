import 'package:flutter/material.dart';
import 'package:gurukrupa/providers/photo.dart';

class GallaryProvider with ChangeNotifier {
  List<Photo> _photos = [
    Photo(id: 8, imageUrl: 'https://i.postimg.cc/nrDZP3Tn/download-1.jpg'),
    Photo(id: 8, imageUrl: 'https://i.postimg.cc/NG1zdhk5/unnamed.jpg'),
    Photo(id: 8, imageUrl: 'https://i.postimg.cc/g0CgK4wV/unnamed.png'),
    Photo(id: 8, imageUrl: 'https://i.postimg.cc/YCJNc0pk/images.jpg'),
    Photo(id: 8, imageUrl: 'https://i.postimg.cc/L8dh21Zy/images-2.jpg'),
    Photo(id: 8, imageUrl: 'https://i.postimg.cc/sX0D8Qr4/download.jpg'),
  ];

  List<Photo> get photos {
    return [..._photos];
  }
}
