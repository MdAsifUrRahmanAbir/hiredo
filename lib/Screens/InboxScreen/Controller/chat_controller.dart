import 'package:get/get.dart';
import 'package:homelyknock/Screens/InboxScreen/Model/message_model.dart';
import 'package:image_picker/image_picker.dart';

class ChatController extends GetxController {
  RxString imageFile = ''.obs;

  void selectedImageCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      imageFile.value = pickedImage.path;
    } else {
      Get.snackbar(
        'Error',
        'No image selected',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void selectedImageGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      imageFile.value = pickedImage.path;
    } else {
      Get.snackbar(
        'Error',
        'No image selected',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  List<MessageModel> messageList = [
    MessageModel(
        text:
            'Hey Megalodon, last week me and my friend have watch your tips video',
        messageType: ChatMessageType.text,
        messageStatus: MessageStatus.viewed,
        isSender: false,
        time: '10:30 PM'),
    MessageModel(
        text: 'Wow, I really believe it,',
        messageType: ChatMessageType.text,
        messageStatus: MessageStatus.viewed,
        isSender: true,
        time: '2:30 PM'),
    MessageModel(
        text:
            'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
        messageType: ChatMessageType.text,
        messageStatus: MessageStatus.viewed,
        isSender: false,
        time: '2:30 PM'),
    MessageModel(
        text: 'Exercitation veniam consequat sunt nostrud amet.',
        messageType: ChatMessageType.text,
        messageStatus: MessageStatus.viewed,
        isSender: true,
        time: '3:00 PM'),
    MessageModel(
        text:
            'Hey Megalodon, last week me and my friend have watch your tips video',
        messageType: ChatMessageType.text,
        messageStatus: MessageStatus.viewed,
        isSender: false,
        time: '10:30 PM'),
    MessageModel(
        text: 'Wow, I really believe it,',
        messageType: ChatMessageType.text,
        messageStatus: MessageStatus.viewed,
        isSender: true,
        time: '2:30 PM'),
    MessageModel(
        text:
            'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
        messageType: ChatMessageType.text,
        messageStatus: MessageStatus.viewed,
        isSender: false,
        time: '2:30 PM'),
    MessageModel(
        text: 'Exercitation veniam consequat sunt nostrud amet.',
        messageType: ChatMessageType.text,
        messageStatus: MessageStatus.viewed,
        isSender: true,
        time: '3:00 PM'),
    MessageModel(
        text:
            'Hey Megalodon, last week me and my friend have watch your tips video',
        messageType: ChatMessageType.text,
        messageStatus: MessageStatus.viewed,
        isSender: false,
        time: '10:30 PM'),
    MessageModel(
        text: 'Wow, I really believe it,',
        messageType: ChatMessageType.text,
        messageStatus: MessageStatus.viewed,
        isSender: true,
        time: '2:30 PM'),
    MessageModel(
        text:
            'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
        messageType: ChatMessageType.text,
        messageStatus: MessageStatus.viewed,
        isSender: false,
        time: '2:30 PM'),
    MessageModel(
        text: 'Exercitation veniam consequat sunt nostrud amet.',
        messageType: ChatMessageType.text,
        messageStatus: MessageStatus.viewed,
        isSender: true,
        time: '3:00 PM'),
    MessageModel(
        text:
            'Hey Megalodon, last week me and my friend have watch your tips video',
        messageType: ChatMessageType.text,
        messageStatus: MessageStatus.viewed,
        isSender: false,
        time: '10:30 PM'),
    MessageModel(
        text: 'Wow, I really believe it,',
        messageType: ChatMessageType.text,
        messageStatus: MessageStatus.viewed,
        isSender: true,
        time: '2:30 PM'),
    MessageModel(
        text:
            'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
        messageType: ChatMessageType.text,
        messageStatus: MessageStatus.viewed,
        isSender: false,
        time: '2:30 PM'),
    MessageModel(
        text: 'Exercitation veniam consequat sunt nostrud amet.',
        messageType: ChatMessageType.text,
        messageStatus: MessageStatus.viewed,
        isSender: true,
        time: '3:00 PM'),
  ];
}
