import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:path_provider/path_provider.dart';

Future<String> getMLText(fpath) async {
  final inputImage = InputImage.fromFilePath(fpath);
  // final File img = File(fpath);
  //    final Directory directory = await getApplicationDocumentsDirectory();
  //    final String path = directory.path;
  //    final File newImage = await img.copy('$path/image1.png');
  //    print(newImage.path);
  // var inputImage = InputImage.fromFilePath(newImage.path);
  final textRecognizer = TextRecognizer(script: TextRecognitionScript.chinese);

  final RecognizedText recognizedText =
      await textRecognizer.processImage(inputImage);
  String text = recognizedText.text;
  return text;
}
