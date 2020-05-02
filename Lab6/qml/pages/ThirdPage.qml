import QtQuick 2.0
import Sailfish.Silica 1.0
import custom.ListOfStrings 1.0


Page {
    id: page

    allowedOrientations: Orientation.All

    ListOfStrings {
        id: list_strings
    }

    SilicaFlickable {
            anchors.fill: parent
            contentHeight: column.height

            Column {
                id: column
                width: page.width
                spacing: Theme.paddingLarge

                TextField {
                    id: text_field
                    width: parent.width
                    placeholderText: "Добавить слово"
                }

                Button {
                    text: "Добавить"
                    anchors.horizontalCenter: parent.horizontalCenter

                    onClicked: {
                        list_strings.push(text_field.text);
                        text_field.text = "";
                    }
                }

                Button {
                    text: "Удалить"
                    anchors.horizontalCenter: parent.horizontalCenter

                    onClicked: list_strings.pop()
                }

                Label {
                    id: label_list_strings
                    width: page.width
                    wrapMode: "Wrap"
                    text: list_strings.list
                }
            }
        }
}
