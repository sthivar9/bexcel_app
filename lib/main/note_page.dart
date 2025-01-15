import 'package:bexcel/main/note_class.dart';
import 'package:bexcel/main/note_database.dart';
import 'package:flutter/material.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  // note db
  final noteDatabase = NoteDatabase();

  //text Controller
  final noteController = TextEditingController();

  // user wants to add new note
  void addNewNote() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("New Note"),
        content: TextField(
          controller: noteController,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              noteController.clear();
            },
            child: Text("cancel"),
          ),
          TextButton(
            onPressed: () {
              //create note
              final newNote = Note(content: noteController.text);
              //save db
              noteDatabase.createNote(newNote);

              Navigator.pop(context);
              noteController.clear();
            },
            child: Text("Save"),
          )
        ],
      ),
    );
  }

  // user wants to update new note
  void updateNote(Note note) {
    noteController.text = note.content;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Update Note"),
        content: TextField(
          controller: noteController,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              noteController.clear();
            },
            child: Text("cancel"),
          ),
          TextButton(
            onPressed: () {
              //save db
              noteDatabase.updateNote(note, noteController.text);

              Navigator.pop(context);
              noteController.clear();
            },
            child: Text("Save"),
          )
        ],
      ),
    );
  }

  // user wants to delete new note
  void deleteNote(Note note) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Delete Note"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              noteController.clear();
            },
            child: Text("cancel"),
          ),
          TextButton(
            onPressed: () {
              noteDatabase.deleteNote(note);

              Navigator.pop(context);
              noteController.clear();
            },
            child: Text("Delete"),
          )
        ],
      ),
    );
  }

  //build ui
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewNote,
        child: Icon(Icons.add),
      ),

      //body => StreamBuilder
      body: StreamBuilder(
        //listion to this stream
        stream: noteDatabase.stream,

        //to build UI
        builder: (context, snapshot) {
          //loading
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          //loaded
          final notes = snapshot.data!;

          //list of notes UI
          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final note = notes[index];

              return ListTile(
                title: Text(note.content),
                trailing: SizedBox(
                  width: 100,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => updateNote(note),
                        icon: Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () => deleteNote(note),
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
