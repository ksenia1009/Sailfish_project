import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.XmlListModel 2.0

Page {
    id: page
    allowedOrientations: Orientation.All

    SilicaFlickable {
        anchors.fill: parent

        PullDownMenu {
            MenuItem {
                text: qsTr("Show Page 7")
                onClicked: pageStack.push(Qt.resolvedUrl("SeventhPage.qml"))
            }
        }

        DAO { id: dao }

        Column {
            width: page.width
            spacing: Theme.paddingMedium

            TextField {
                id: notesField
                width: parent.width
            }

            Button {
                text: "Добавить"
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    dao.insertNote(notesField.text);
                    selectNotes();
                    notesField.text = "";
                }
            }

            SilicaListView {
                width: parent.width
                height: parent.height
                spacing: 20
                model: ListModel { id: notesListModel }
                delegate: Rectangle {
                    width: parent.width
                    height: textLabel.height
                    Label {
                        id: textLabel
                        text: model.text
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            dao.deleteNote(notesListModel.get(index).id);
                            selectNotes();
                        }
                    }
                }
            }
        }

        function selectNotes() {
            notesListModel.clear();
            dao.retrieveNotes((function(notes) {
                for (var i = 0; i < notes.length; i++) {
                    var note = notes.item(i);
                    notes_list_model.append({id: note.id, text: note.note});
                }
            }));
        }

        Component.onCompleted: selectNotes()
    }
}
