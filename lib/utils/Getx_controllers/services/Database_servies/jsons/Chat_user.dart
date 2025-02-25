class ChatUser {
  ChatUser({
    required this.id,
    required this.name,
    required this.email,
    required this.about,
    required this.image,
    required this.createdAt,
    required this.isOnline,
    required this.lastActive,
    required this.pushToken,
  });

  late final String id;
  late final String name;
  late final String email;
  late final String about;
  late final String image;
  late final String createdAt;
  late final bool isOnline;
  late final String lastActive;
  late final String pushToken;

  /// Constructor to create a ChatUser object from JSON
  ChatUser.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? ''; // Fix: Include `id`
    image = json['image'] ?? '';
    name = json['name'] ?? '';
    email = json['email'] ?? '';
    about = json['about'] ?? '';
    createdAt = json['createdAt']?.toString() ?? ''; // Handle timestamp
    isOnline = json['isOnline'] ?? false; // Fix: Boolean default value
    lastActive = json['lastActive']?.toString() ?? ''; // Handle timestamp
    pushToken = json['pushToken'] ?? '';
  }

  /// Converts a ChatUser object into JSON format
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id; // Fix: Include `id`
    data['image'] = image;
    data['about'] = about;
    data['name'] = name;
    data['email'] = email;
    data['createdAt'] = createdAt;
    data['isOnline'] = isOnline;
    data['lastActive'] = lastActive;
    data['pushToken'] = pushToken;
    return data;
  }
}
