import QtQuick 2.0
import Sailfish.Silica 1.0

Dialog {
    id: dialog
    Column {
        anchors.fill: parent
        id: column
        width: parent.width
        spacing: Theme.paddingMedium
        DialogHeader {}
        Row {
            spacing: 200
            x: 25
            Label {
                text: "1"
            }
            Label {
                text: "2"
            }
        }
        Row {
            width: parent.width
            spacing: 25
            TextField {
                id: field1
                width: parent.width/2 - 10
            }
            TextField {
                id: field2
                width: parent.width/2 - 10
            }
        }
        Button {
            width: parent.width
            text: "Сложить"
            onClicked: {
                console.log(parseInt(field1.text) + parseInt(field2.text))
            }
        }
    }
}
