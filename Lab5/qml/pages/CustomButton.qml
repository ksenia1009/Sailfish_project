import QtQuick 2.0
import Sailfish.Silica 1.0

Item {
    default property var someText
    property color buttonColor: "white"
    Button {
        x: 50
        y: 100
        text: someText.text
        color: buttonColor
    }
}
