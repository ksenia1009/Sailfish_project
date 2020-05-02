import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: qsTr("Show Page 6")
                onClicked: pageStack.push(Qt.resolvedUrl("SixthPage.qml"))
            }
        }

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            id: column
            width: page.width
            height: page.height
            spacing: Theme.paddingLarge

            property var hour: 0
            property var min: 0
            property var sec: 0

            Item {
                Timer {
                    id: myTimer
                    interval: 1000
                    running: false
                    repeat: true
                    onTriggered: {
                        column.sec++
                        if (column.sec >= 60) {
                            column.sec = 0
                            column.min = column.min + 1
                        }
                        if (column.min >= 60) {
                            column.min = 0
                            column.hour = column.hour + 1
                        }
                    }
                }
            }
            Button {
                id: but
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                text: myTimer.running ? "Pause" : "Start"
                onClicked: myTimer.running = !myTimer.running
            }
            MyClock {
                id: myCl
                x: 325
                anchors.top: but.bottom
                hour: column.hour
                min: column.min
                sec: column.sec
            }
        }
    }
}
