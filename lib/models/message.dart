

class Message{
  late String idMessage;
  late String textMessage;
  late DateTime dateTimeMessage;
  List<String>? images;
  late String idSender;


  Message({required this.idMessage,required this.idSender, required this.textMessage, required this.dateTimeMessage,   this.images});
}