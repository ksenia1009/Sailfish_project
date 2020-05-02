import QtQuick 2.0
import Sailfish.Silica 1.0
import Nemo.Configuration 1.0

Page {
    id: page
    allowedOrientations: Orientation.All

    SilicaFlickable {
        anchors.fill: parent

        ConfigurationGroup {
            id: settings
            path: "/lab6h/settings"
            property string textsetting: "Default"
            property bool flag: false
        }

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        Column {
            id: column
            width: page.width
            spacing: Theme.paddingLarge

            Column {
                TextField {
                    id: tf1
                    text: settings.textsetting
                }
                Button {
                    text: "Применить"
                    onClicked: settings.textsetting = tf1.text
                }
            }
            Column {
                TextSwitch {
                    id: ts1
                    text: "Флажок"
                    checked: settings.flag
                }
                Button {
                    text: "Применить"
                    onClicked: settings.flag = ts1.checked

                }
            }
        }
    }
}
