class RecentFile {
  final String title, icon, date, size;

  RecentFile(this.title, this.icon, this.date, this.size);
}

List demoRecentFiles = [
  RecentFile('XD File', 'assets/icons/xd_file.svg', '01-03-2021', '2.45 MB'),
  RecentFile(
      'Figma File', 'assets/icons/Figma_file.svg', '27-02-2021', '29.0 MB'),
  RecentFile('Documetns', 'assets/icons/doc_file.svg', '01-03-2021', '32.5 MB'),
  RecentFile(
      'Sound File', 'assets/icons/sound_file.svg', '21-02-2021', '3.22 MB'),
  RecentFile(
      "Media File", "assets/icons/media_file.svg", "23-02-2021", "2.5gb"),
  RecentFile("Sals PDF", "assets/icons/pdf_file.svg", "25-02-2021", "3.5mb"),
  RecentFile(
      "Excel File", "assets/icons/excle_file.svg", "25-02-2021", "34.5mb"),
];
