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
                text: qsTr("Dialog 2")
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
            Item {
                id: it1
                width: parent.width
                height: 600
                Rectangle {
                    id: redRect
                    x: 100
                    y: 100
                    width: 200
                    height: 200
                    color: "red"
                }
                Rectangle {
                    id: greenRect
                    anchors.left: redRect.right
                    anchors.top: redRect.verticalCenter
                    width: 200
                    height: 200
                    color: "green"
                }
                Rectangle {
                    id: blueRect
                    anchors.left: greenRect.horizontalCenter
                    anchors.top: redRect.top
                    width: 200
                    height: 200
                    color: "blue"
                    Text {
                        text: qsTr("Square")
                        anchors.centerIn: blueRect
                        color: "white"
                        font.pointSize: 20
                    }
                }
            }
            Item {
                id: it2
                width: parent.width
                height: 200
                y: it1.height + 100
                Row {
                    id: row1
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 30
                    Rectangle {
                        width: 200
                        height: 200
                        color: "red"
                    }
                    Rectangle {
                        width: 200
                        height: 200
                        color: "green"
                    }
                    Rectangle {
                        width: 200
                        height: 200
                        color: "blue"
                    }
                }
            }
            Item {
                id: it3
                width: parent.width
                height: 200
                y: it2.y + it2.height + 30
                Row {
                    id: row2
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 30
                    Rectangle {
                        width: 200
                        height: 200
                        color: "magenta"
                    }
                    Rectangle {
                        width: 200
                        height: 200
                        color: "transparent"
                    }
                    Rectangle {
                        width: 200
                        height: 200
                        color: "black"
                    }
                }
            }
            Item {
                id: it4
                width: parent.width
                height: 450
                y: it3.y + it3.height + 50
                Grid {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    columns: 3
                    rows: 2
                    spacing: 30
                    Rectangle { width: 200; height: 200; color: "red" }
                    Rectangle { width: 200; height: 200; color: "green" }
                    Rectangle { width: 200; height: 200; color: "blue" }
                    Rectangle { width: 200; height: 200; color: "magenta" }
                    Rectangle { width: 200; height: 200; color: "transparent" }
                    Rectangle { width: 200; height: 200; color: "black" }
                }
            }
            Item {
                id: it5
                width: parent.width
                height: 400
                y: it4.y + it4.height + 50
                Rectangle {
                    id: firstRect
                    height: 300
                    width: 300
                    x: width/10
                    y: height/10
                    color: "white"
                    Rectangle {
                        id: secondRect
                        width: parent.width
                        height: parent.height
                        color: parent.color
                        z: 1
                        transform: [Scale {xScale: 0.5; yScale: 1 },
                            Rotation { angle: 45 },
                            Translate {x: 570} ]
                    }
                }
            }
            Item {
                id: it6
                width: parent.width
                height: 800
                y: it5.y + it5.height + 50
                Rectangle {
                    id: yellowRect
                    color: "yellow"
                    y: 50
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 0
                    height: 0
                    SequentialAnimation {
                        loops: Animation.Infinite
                        running: true
                        ParallelAnimation {
                            PropertyAnimation {
                                target: yellowRect
                                property: "y"
                                from: 50
                                to: page.width - 180
                                duration: 2000
                            }
                            PropertyAnimation {
                                target: yellowRect
                                property: "width"
                                from: 0
                                to: 200
                                duration: 2000
                            }
                            PropertyAnimation {
                                target: yellowRect
                                property: "height"
                                from: 0
                                to: 200
                                duration: 2000
                            }
                        }
                    }
                }
            }
        }
    }
}
