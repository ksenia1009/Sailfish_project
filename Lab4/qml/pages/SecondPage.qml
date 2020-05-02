import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    property int delcount: 0
    function remove() {
        dataModel.remove(dataModel.index, 1);
        delcount +=1;
    }
    allowedOrientations: Orientation.All
    PageHeader {title: "Список"}
    SilicaFlickable {
        anchors.fill: parent

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: qsTr("Show Page 3")
                onClicked: pageStack.push(Qt.resolvedUrl("ThirdPage.qml"))
            }
        }

        Column {
            id: column
            anchors.fill: parent
            ListModel {id: dataModel }
            SilicaListView {
//                anchors.fill: parent
                width: parent.width
                height: parent.height - addButton.height
                model: dataModel
                spacing: 15
                delegate: Button {
                    width: parent.width
                    height: 70
                    color: "yellow"
                    Text {
                        anchors.centerIn: parent
                        text: model.text
                    }
                    onClicked: remove()
                }
            }
            Button {
                id: addButton
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Добавить"
                onClicked: dataModel.append( {text: "Элемент " + (dataModel.count + delcount)} )
            }
        }
    }
}
