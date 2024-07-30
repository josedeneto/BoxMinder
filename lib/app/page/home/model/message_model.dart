class MessageModel {
  final String message;
  final bool isSentByme;
  final String? image;
  MessageModel({
    required this.message,
    required this.isSentByme,
    this.image
  });
  
}
