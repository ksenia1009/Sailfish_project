import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All

    SilicaListView {
        anchors.fill: parent
        contentHeight: column.height
        Column {
            id: column

            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: qsTr("Вторая страница")
            }
            Button {
                id: b3
                text: "Назад"
                onClicked: pageStack.navigateBack()
            }
        }
    }
}
