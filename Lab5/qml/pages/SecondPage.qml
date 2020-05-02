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
                text: qsTr("Show Page 3")
                onClicked: pageStack.push(Qt.resolvedUrl("ThirdPage.qml"))
            }
        }

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            id: column
            width: page.width
            spacing: Theme.paddingLarge

            Button {
                id: but1
//                anchors.fill: column
                onPressed: { txt.state = "fall" }
            }
            Text {
                id: txt
                height: 200
                width: column.width
                anchors.horizontalCenter: column.horizontalCenter
                text: "Hello world!"
                font.pointSize: 72
                color: "red"
                y: 150
                state: "normal"
                states: [
                    State {
                        name: "normal"
                        PropertyChanges {
                            target: txt
                            y: 150
                            color: "red"
                        }
                    },
                    State {
                        name: "fall"
                        extend: "normal"
                        PropertyChanges {
                            target: txt
                            rotation: 180
                            color: "blue"
                        }
                    }
                ]
                transitions: [
                    Transition {
                        from: "normal"
                        to: "fall"
//                        reversible: true

                        SequentialAnimation {
                            PropertyAnimation {
                                property: "y"
                                from: 150
                                to: 1050
                                duration: 4500
                            }
                            PropertyAnimation {
                                property: "y"
                                from: 1050
                                to: 150
                                duration: 4500
                            }
                        }
                    }
                ]
            }
        }
    }
}
