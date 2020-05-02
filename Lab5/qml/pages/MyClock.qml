import QtQuick 2.0
import Sailfish.Silica 1.0

Item {
    property string hour: "0"
    property string min: "0"
    property string sec: "0"
    Row {
        Label {
            text: hour
        }
        Label {
            text: ":"
        }
        Label {
            text: min
        }
        Label {
            text: ":"
        }
        Label {
            text: sec
        }
    }
}
