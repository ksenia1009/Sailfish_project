import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    ListModel {
        id: taskModel
        ListElement {name: "Task1"}
        ListElement {name: "Task2"}
        ListElement {name: "Task3"}
        ListElement {name: "Task4"}
    }
    SlideshowView {
        id: ssv
        model: taskModel
        anchors.centerIn: parent
        height: width
        itemHeight: width
        itemWidth: width
        delegate: Rectangle {
            width: ssv.itemWidth
            height: ssv.itemHeight
            Text {
                anchors.centerIn: parent
                text: name
            }
        }
    }
}
