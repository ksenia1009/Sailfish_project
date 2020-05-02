import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    ListModel {
        id: taskModel
        ListElement {name: "Сделать дело"; date: "17.02.17";}
        ListElement {name: "Гулять смело"; date: "17.02.17";}
        ListElement {name: "Сходить на учебу"; date: "16.02.17";}
        ListElement {name: "Прочитать книгу"; date: "15.02.17";}
    }
    SilicaListView {
        anchors.fill: parent
        model: taskModel
        header: PageHeader {title: "Задачи"}
        section {
            property: 'date'
            delegate: SectionHeader {text: section}
        }
        delegate: Text {text: name; color: "white"}
    }
}
