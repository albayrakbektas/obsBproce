class Announcement {
  String id;
  String tarih;
  String gonderen;
  String konu;
  String icerik;
  bool unread;
  Announcement(
      this.id, this.tarih, this.gonderen, this.konu, this.icerik, this.unread);
}

var announcements = <Announcement>[
  Announcement(
    'id',
    '31.10.2021',
    'Dr. Volkan Oger',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ornare enim justo, a tincidunt nisl rhoncus in. Interdum et malesuada fames ac ante ipsum primis in faucibus.',
    'icerik',
    true,
  ),
  Announcement(
    'id',
    '01.11.2021',
    'Dr. Bektas Albayrak',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ornare enim justo, a tincidunt nisl rhoncus in. Interdum et malesuada fames ac ante ipsum primis in faucibus.',
    'icerik',
    false,
  ),
];
