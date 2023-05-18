enum ChatMessageType { text, audio, image, video }

enum MessageStatus { notSent, notView, viewed }

class MessageModel {
  String text;
  String time;
  ChatMessageType messageType;
  MessageStatus messageStatus;
  bool isSender;

  MessageModel(
      {this.text = '',
      required this.messageType,
      required this.messageStatus,
      required this.isSender,
      required this.time});
}
