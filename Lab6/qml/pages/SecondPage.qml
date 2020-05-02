import QtQuick 2.0
import Sailfish.Silica 1.0
import custom.Counter 1.0

Page {
    id: page

    allowedOrientations: Orientation.All

    Counter {
        id: counter
        count: 0
    }

    SilicaFlickable {
        anchors.fill: parent

        PullDownMenu {
            MenuItem {
                text: qsTr("Show Page 2")
                onClicked: pageStack.push(Qt.resolvedUrl("ThirdPage.qml"))
            }
        }

        contentHeight: column.height

        Column {
            id: column
            width: page.width
            spacing: Theme.paddingLarge

            Label {
                text: counter.count
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 64
            }

            Button {
                text: "Увеличить"
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: counter.increment()
            }

            Button {
                text: "Сбросить"
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: counter.reset()
            }
        }
    }
}
