import 'meeting.dart';

// 더미 모임 데이터
List<Meeting> dummyMeetings = [
  Meeting(
    id: 1,
    name: "모임 1",
    creatorID: "user1",
    description: "이 모임은 첫 번째 모임입니다.",
    isJoined: false,
    image: 'assets/image/no-image-icon.png',
    max_member: 100,
    isPrivate: false,
    representativePhotos: [
      'assets/image/no-image-icon.png',
      'assets/image/no-image-icon.png',
      'assets/image/no-image-icon.png',
    ],
    memberPhotos: [
      'assets/image/no-image-icon.png',
      'assets/image/no-image-icon.png',
      'assets/image/no-image-icon.png',
    ],
    member_id: [],
    inviteCode: '078',
  ),
  Meeting(
    id: 2,
    name: "모임 2",
    creatorID: "user2",
    description: "이 모임은 두 번째 모임입니다.",
    isJoined: false,
    image: 'assets/image/no-image-icon.png',
    max_member: 100,
    isPrivate: true,
    representativePhotos: [
      'assets/image/no-image-icon.png',
      'assets/image/no-image-icon.png',
      'assets/image/no-image-icon.png',
    ],
    memberPhotos: [
      'assets/image/no-image-icon.png',
      'assets/image/no-image-icon.png',
      'assets/image/no-image-icon.png',
    ],
    member_id: [],
    inviteCode: '067',
  ),
  Meeting(
    id: 3,
    name: "모임 3",
    creatorID: "user1",
    description: "이 모임은 세 번째 모임입니다.",
    isJoined: true,
    image: 'assets/image/no-image-icon.png',
    max_member: 100,
    isPrivate: false,
    representativePhotos: [
      'assets/image/no-image-icon.png',
      'assets/image/no-image-icon.png',
      'assets/image/no-image-icon.png',
    ],
    memberPhotos: [
      'assets/image/no-image-icon.png',
      'assets/image/no-image-icon.png',
      'assets/image/no-image-icon.png',
    ],
    member_id: [],
    inviteCode: '056',
  ),
  Meeting(
    id: 4,
    name: "모임 4",
    creatorID: "user1",
    description: "이 모임은 네 번째 모임입니다.",
    isJoined: false,
    image: 'assets/image/no-image-icon.png',
    max_member: 100,
    isPrivate: false,
    representativePhotos: [
      'assets/image/no-image-icon.png',
      'assets/image/no-image-icon.png',
      'assets/image/no-image-icon.png',
    ],
    memberPhotos: [
      'assets/image/no-image-icon.png',
      'assets/image/no-image-icon.png',
      'assets/image/no-image-icon.png',
    ],
    member_id: [],
    inviteCode: '045',
  ),
  Meeting(
    id: 5,
    name: "모임 5",
    creatorID: "user1",
    description: "이 모임은 다섯 번째 모임입니다.",
    isJoined: false,
    image: 'assets/image/no-image-icon.png',
    max_member: 100,
    isPrivate: false,
    representativePhotos: [
      'assets/image/no-image-icon.png',
      'assets/image/no-image-icon.png',
      'assets/image/no-image-icon.png',
    ],
    memberPhotos: [
      'assets/image/no-image-icon.png',
      'assets/image/no-image-icon.png',
      'assets/image/no-image-icon.png',
    ],
    member_id: [],
    inviteCode: '034',
  ),
  Meeting(
    id: 6,
    name: "모임 6",
    creatorID: "user1",
    description: "이 모임은 여섯 번째 모임입니다.",
    isJoined: false,
    image: 'assets/image/no-image-icon.png',
    max_member: 100,
    isPrivate: false,
    representativePhotos: [
      'assets/image/no-image-icon.png',
      'assets/image/no-image-icon.png',
      'assets/image/no-image-icon.png',
    ],
    memberPhotos: [
      'assets/image/no-image-icon.png',
      'assets/image/no-image-icon.png',
      'assets/image/no-image-icon.png',
    ],
    member_id: [],
    inviteCode: '023',
  ),
  Meeting(
    id: 7,
    name: "모임 7",
    creatorID: "user1",
    description: "이 모임은 일곱 번째 모임입니다.",
    isJoined: false,
    image: 'assets/image/no-image-icon.png',
    max_member: 100,
    isPrivate: false,
    representativePhotos: [
      'assets/image/no-image-icon.png',
      'assets/image/no-image-icon.png',
      'assets/image/no-image-icon.png',
    ],
    memberPhotos: [
      'assets/image/no-image-icon.png',
      'assets/image/no-image-icon.png',
      'assets/image/no-image-icon.png',
    ],
    member_id: [],
    inviteCode: '012',
  ),
  Meeting(
    id: 8,
    name: "모임 8",
    creatorID: "user1",
    description: "이 모임은 여덟 번째 모임입니다.",
    isJoined: false,
    image: 'assets/image/no-image-icon.png',
    max_member: 100,
    isPrivate: false,
    representativePhotos: [
      'assets/image/no-image-icon.png',
      'assets/image/no-image-icon.png',
      'assets/image/no-image-icon.png',
    ],
    memberPhotos: [
      'assets/image/no-image-icon.png',
      'assets/image/no-image-icon.png',
      'assets/image/no-image-icon.png',
    ],
    member_id: [],
    inviteCode: '789',
  ),
  Meeting(
    id: 9,
    name: "모임 9",
    creatorID: "user1",
    description: "이 모임은 아홉 번째 모임입니다.",
    isJoined: false,
    image: 'assets/image/no-image-icon.png',
    max_member: 100,
    isPrivate: false,
    representativePhotos: [
      'assets/image/no-image-icon.png',
      'assets/image/no-image-icon.png',
      'assets/image/no-image-icon.png',
    ],
    memberPhotos: [
      'assets/image/no-image-icon.png',
      'assets/image/no-image-icon.png',
      'assets/image/no-image-icon.png',
    ],
    member_id: [],
    inviteCode: '456',
  ),
  Meeting(
    id: 10,
    name: "모임 10",
    creatorID: "user1",
    description: "이 모임은 열 번째 모임입니다.",
    isJoined: false,
    image: 'assets/image/no-image-icon.png',
    max_member: 100,
    isPrivate: false,
    representativePhotos: [
      'assets/image/no-image-icon.png',
      'assets/image/no-image-icon.png',
      'assets/image/no-image-icon.png',
    ],
    memberPhotos: [
      'assets/image/no-image-icon.png',
      'assets/image/no-image-icon.png',
      'assets/image/no-image-icon.png',
    ],
    member_id: [],
    inviteCode: '123',
  ),
  // 더 많은 모임 데이터 추가...
];

// '내가 생성한 모임' 필터링
List<Meeting> myCreatedMeetings = dummyMeetings.where((meeting) {
  // 현재 사용자의 ID와 모임의 creatorID를 비교하여 내가 생성한 모임만 필터링
  return meeting.creatorID == "user1";
}).toList();

// '내가 가입한 모임' 필터링
List<Meeting> myJoinedMeetings = dummyMeetings.where((meeting) {
  // 모임의 isJoined 필드를 확인하여 가입 여부를 판단
  return meeting.isJoined;
}).toList();

// 모임 생성 함수
void createMeeting() {
  // 모임 생성 로직을 구현한 후, 생성한 모임을 'dummyMeetings' 리스트에 추가
  Meeting newMeeting = Meeting(
    id: dummyMeetings.length + 1,
    name: "새로운 모임",
    creatorID: "user1", // 사용자1이 생성한 모임
    description: "이 모임은 새로 생성된 모임입니다.",
    isJoined: false,
    image: '',
    member_id: ["user1"], // 생성자의 ID를 member_id 리스트에 추가
    max_member: 100,
    isPrivate: false,
    representativePhotos: [],
    memberPhotos: [],
    inviteCode: '',
  );
  dummyMeetings.add(newMeeting);
}
