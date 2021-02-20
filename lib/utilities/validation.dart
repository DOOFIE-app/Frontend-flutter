import 'dart:io';

// import 'package:google_maps_place_picker/google_maps_place_picker.dart';

class Validation<T> {
  T value;
  String _error;

  String get error => _error;

  set error(String error) {
    _error = error;
  }

  Validation(this.value, this._error);

  bool get isValid {
    return value != null && _error == null;
  }

  get getValue {
    return value;
  }
}

class ValidationText extends Validation<String> {
  ValidationText(String value, String error) : super(value, error);
}

class ValidationNumber extends Validation<num> {
  ValidationNumber(num value, String error) : super(value, error);
}

class ValidationOptions extends Validation<List<String>> {
  String _selected;

  ValidationOptions(List<String> value, String error) : super(value, error);

  void select(String item) {
    _selected = item;
  }

  @override
  bool get isValid {
    return _selected != null && error == null;
  }

  @override
  String get getValue {
    return _selected;
  }
}

// class ValidateLocation extends Validation<PickResult> {
//   ValidateLocation(PickResult value, String error) : super(value, error);
//
//   @override
//   bool get isValid {
//     return value != null && value.geometry.location.lat != null && value.geometry.location.lng != null;
//   }
// }

class ValidateFile extends Validation<File> {
  ValidateFile(File value, String error) : super(value, error);
}
