import 'package:uuid/uuid.dart';

class GenerateRowid {
  String generate() {
    var uuid = Uuid();
    String uuidV4 = uuid.v4();
    // print(uuidV4);
    return uuidV4; // Isso imprimirá um UUID v4 único
  }
}
