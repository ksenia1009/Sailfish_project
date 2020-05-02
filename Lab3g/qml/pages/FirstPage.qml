import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    SilicaWebView {
        id: web
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            bottom: tf1.top
        }
        url: "http://sailfishos.org"
    }
    TextField {
        id: tf1
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        text: "http://sailfishos.org"
        label: web.title
        EnterKey.onClicked: web.url = text
    }
}
