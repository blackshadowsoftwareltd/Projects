  class SinglePostComment {
  SinglePostComment({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });

  int postId;
  int id;
  String name;
  String email;
  String body;

  factory SinglePostComment.fromJson(Map<String, dynamic> json) =>
      SinglePostComment(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
      );
}
