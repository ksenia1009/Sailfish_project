import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    SilicaFlickable {
        anchors.fill: parent
        PullDownMenu {
            MenuItem {
                text: qsTr("Show Page 2")
                onClicked: pageStack.push(Qt.resolvedUrl("SecondPage.qml"))
            }
        }
        ListModel {
            id: dataModel
            ListElement {color: "white"; text: "Белый";}
            ListElement {color: "green"; text: "Зеленый";}
            ListElement {color: "blue";  text: "Синий";}
        }
        SilicaListView {
            anchors.fill: parent
            model: dataModel
            delegate: Rectangle {
                width: parent.width
                height: 100
                color: model.color
                Text {
                    anchors.centerIn: parent
                    text: model.text
                }
            }
        }
    }
}
