// {
//   id: 'result-id',
//   output_url: 'result-url'
// }

class GeneratedImage {
  late final String id;
  late final String imageUrl;

  GeneratedImage({required this.id, required this.imageUrl});

  factory GeneratedImage.fromJson(Map<String, dynamic> json) {
    return GeneratedImage(id: json['id'], imageUrl: json['output_url']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'output_url': imageUrl,
    };
  }
}
