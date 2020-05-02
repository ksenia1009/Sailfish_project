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
                text: qsTr("Show Page 2")
                onClicked: pageStack.push(Qt.resolvedUrl("SecondPage.qml"))
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

            property int count : 0

            Item {
                Timer {
                    interval: 2500; running: true; repeat: true
                    onTriggered: column.count = column.count + 1
                }

            }
            Rectangle {
                id: red
                width: 320
                height: 320
                radius: 160
                anchors.horizontalCenter: parent.horizontalCenter
                state: "ON"
                states: [
                    State {
                        name: "ON"
                        PropertyChanges {
                            target: red
                            color: "red"
                        }
                        when: (column.count%3 == 0)
                    },
                    State {
                        name: "OFF"
                        PropertyChanges {
                            target: red
                            color: "black"
                        }
                        when: (column.count%3 != 0)
                    }
                ]
            }
            Rectangle {
                id: yellow
                width: 320
                height: 320
                radius: 160
                anchors.horizontalCenter: parent.horizontalCenter
                state: "OFF"
                states: [
                    State {
                        name: "ON"
                        PropertyChanges {
                            target: yellow
                            color: "yellow"
                        }
                        when: (column.count%3 == 1)
                    },
                    State {
                        name: "OFF"
                        PropertyChanges {
                            target: yellow
                            color: "black"
                        }
                        when: (column.count%3 != 1)
                    }
                ]
            }
            Rectangle {
                id: green
                width: 320
                height: 320
                radius: 160
                anchors.horizontalCenter: parent.horizontalCenter
                state: "OFF"
                states: [
                    State {
                        name: "ON"
                        PropertyChanges {
                            target: green
                            color: "green"
                        }
                        when: (column.count%3 == 2)
                    },
                    State {
                        name: "OFF"
                        PropertyChanges {
                            target: green
                            color: "black"
                        }
                        when: (column.count%3 != 2)
                    }
                ]
            }
            Rectangle {
                id: human
                width: 160
                height: 160
                color: "pink"
                state: "Left"
                states: [
                    State {
                        name: "Left"
                        PropertyChanges {
                            target: human
                            x: 0
                        }
                        when: (green.state == "OFF")
                    },
                    State {
                        name: "Right"
//                        extend: "Left"
                        PropertyChanges {
                            target: human
                        }
                        when: (green.state == "ON")
                    }
                ]
                transitions: [
                    Transition {
                        from: "Left"
                        to: "Right"
                        SequentialAnimation {
                            NumberAnimation {
                                property: "x"
                                from: 50
                                to: page.width - 150
                                duration: 1250
                            }
                            NumberAnimation {
                                property: "x"
                                from: page.width - 150
                                to: 50
                                duration: 1250
                            }
                        }
                    }
                ]
            }
        }
    }
}
