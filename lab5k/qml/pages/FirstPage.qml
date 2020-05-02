import QtQuick 2.0
import Sailfish.Silica 1.0

SilicaListView {
    anchors.fill: parent
    model: 20
    delegate: ListItem {
        id: delegate
        Label {
            x: Theme.paddingLarge
            text: "List Item #" + index
            color: delegate.highlighted ? Theme.highlightColor : Theme.primaryColor
        }
        menu: ContextMenu {
            MenuLabel {text: "Context menu"}
            MenuItem {
                text: "Menu Item1"
                onClicked: console.log("Item #" + index + ", menu item 1")
            }
            MenuItem {
                text: "Menu Item2"
                onClicked: console.log("Item #" + index + ", menu item 2")
            }
        }
    }
}
