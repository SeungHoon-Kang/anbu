class Meeting {
  final int id;
  final String name;
  final String description;
  final String image;
  final List<String> member_id;
  final int max_member;
  final bool isJoined;
  final bool isPrivate;
  final List<String> representativePhotos;
  final List<String> memberPhotos;
  final String creatorID;
  final String? inviteCode; // null이 될 수 있는 타입으로 변경

  Meeting({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.member_id,
    required this.max_member,
    required this.isJoined,
    required this.isPrivate,
    required this.representativePhotos,
    required this.memberPhotos,
    required this.creatorID,
    this.inviteCode, // 옵셔널한 파라미터로 변경
  });
}
