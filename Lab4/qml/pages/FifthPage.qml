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
                text: qsTr("Show Page 7")
                onClicked: pageStack.push(Qt.resolvedUrl("SeventhPage.qml"))
            }
        }

        function loadForexRate() {
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "http://www.cbr.ru/scripts/XML_daily.asp", true);
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    xmlModel.xml = xhr.responseText;
                }
            }
            xhr.send();
        }

        XmlListModel {
            id: xmlModel
            query: "/ValCurs/Valute"
            XmlRole {
                name: "Code"
                query: "CharCode/string()"
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
                    text: Code
                }
                Label {
                    text: Value
                }
            }
        }

        Component.onCompleted: loadForexRate()
    }
}
