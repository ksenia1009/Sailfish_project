import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    allowedOrientations: Orientation.All
    property var dataModel: [
        {color: "white", text: "Белый"},
        {color: "green", text: "Зеленый"},
        {color: "blue", text: "Синий"}
    ]
    SilicaFlickable {
        anchors.fill: parent

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: qsTr("Show Page 4")
                onClicked: pageStack.push(Qt.resolvedUrl("FourthPage.qml"))
            }
        }
        SilicaListView {
            anchors.fill: parent
            model: dataModel
            delegate: Rectangle {
                width: parent.width
                height: 100
                color: modelData.color
                Text {
                    anchors.centerIn: parent
                    text: modelData.text
                }
            }
        }
    }
}
