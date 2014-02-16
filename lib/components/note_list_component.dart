library note_list_component;

import 'package:angular/angular.dart';
import 'package:nv_dart/note.dart';

@NgComponent(
    selector: 'note-list',
    templateUrl: 'packages/nv_dart/components/note_list_component.html',
    cssUrl: 'packages/nv_dart/components/note_list_component.css',
    publishAs: 'cmp',
    applyAuthorStyles: false
)
class NoteListComponent {
  @NgTwoWay('notes')
  List<Note> notes = [];
  @NgTwoWay('active-note')
  Note activeNote;

  bool isNoteTitleEditing = false;
  String titleFilter = "";

  NoteListComponent() {
  }

  void selectNote(Note note) {
    if (note != activeNote) {
      activeNote = note;
      isNoteTitleEditing = false;
    }
  }

  void createNote() {
    var note = new Note();
    notes.add(note);
    selectNote(note);
  }

  void deleteNote(Note note) {
    notes.remove(note);
  }

  void editNoteTitle(Note note) {
    activeNote = note;
    isNoteTitleEditing = true;
  }

  void doneTitleEditing() {
    isNoteTitleEditing = false;
    if (activeNote == null) return;
    if (activeNote.title.isEmpty) activeNote.title = 'untitled';
    activeNote.trimTitle();
  }
}