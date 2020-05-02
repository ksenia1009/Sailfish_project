import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.XmlListModel 2.0

Page {
    id: page
    allowedOrientations: Orientation.All

    SilicaFlickable {
        anchors.fill: parent

        PullDownMenu {
            MenuItem {
                text: qsTr("Show Page 5")
                onClicked: pageStack.push(Qt.resolvedUrl("FifthPage.qml"))
            }
        }

        XmlListModel {
            id: xmlModel
            source: "http://www.cbr.ru/scripts/XML_daily.asp"
            query: "/ValCurs/Valute"
            XmlRole {
                name: "Name"
                query: "Name/string()"
            }
            XmlRole {
                name: "Value"
                query: "Value/string()"
            }

        }
        SilicaListView {
            anchors.fill: parent
            header: PageHeader {title: "Валюты" }
            model: xmlModel
            delegate: Column {
                Label {
                    text: Name
                }
                Label {
                    text: Value
                }
            }
        }
    }
}

