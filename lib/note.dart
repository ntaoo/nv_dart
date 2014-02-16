library note;

class Note {
  String title;
  String content;

  Note([this.title='untitled', this.content='']);

  void trimTitle() {
    this.title = this.title.trim();
  }
}
