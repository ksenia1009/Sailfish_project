import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height
        PullDownMenu {
            MenuItem {
                text: "option 1a"
                onClicked: tf1.text = text
            }
            MenuItem {
                text: "option 2a"
                onClicked: tf1.text = text
            }
            MenuItem {
                text: "option 3a"
                onClicked: tf1.text = text
            }
        }
        PushUpMenu {
            MenuItem {
                text: "option 1b"
                onClicked: tf1.text = text
            }
            MenuItem {
                text: "option 2b"
                onClicked: tf1.text = text
            }
            MenuItem {
                text: "option 3b"
                onClicked: tf1.text = text
            }
        }
        Column {
            id: column
            width: page.width
            spacing: Theme.paddingLarge
            TextField {
                id: tf1
                text: "Text"
            }
        }
    }
}
