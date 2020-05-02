import QtQuick 2.0
import Sailfish.Silica 1.0
import "pages"

ApplicationWindow
{
    property int added: 0
    property int removed: 0
    property int prev: 0

    Connections {
        target: pageStack
        onDepthChanged: {
            if (prev > pageStack.depth) {
                removed++
            }
            else {
                added++
            }
            prev = pageStSSack.depth
        }
    }
    initialPage: Component { FirstPage { } }
    cover: Qt.resolvedUrl("cover/CoverPage.qml")
    allowedOrientations: defaultAllowedOrientations
}
