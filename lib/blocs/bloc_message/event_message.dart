abstract class DataEventMessage{}

class DataEventPostMessage implements DataEventMessage{
  final String tokenPenerima;
  late String message;
  DataEventPostMessage({required this.message, required this.tokenPenerima}){
    if(message == "null"){
      message = "";
    }
  }
}