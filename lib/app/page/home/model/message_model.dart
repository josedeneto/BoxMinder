class MessageModel {
  final String? message;
  final bool isSentByme;
  final List<String>? images;
  MessageModel({
    required this.message,
    required this.isSentByme,
    this.images
  });
  
}
