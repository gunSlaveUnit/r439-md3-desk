import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

import "navigation.js" as Navigation

Item {
    ColumnLayout {
        GridLayout {
            rows: 4
            columns: 2
            flow: GridLayout.TopToBottom

            Button {text: qsTr("1. Общее")}
            Button {text: qsTr("2. АГ-Л")}
            Button {text: qsTr("3. ПГ-Л")}
            Button {text: qsTr("4. КЛ-У")}
            Button {text: qsTr("5. ДМД, УЗОЗМ")}
            Button {text: qsTr("6. Тракты ПРД, ПРМ")}
        }

        Button {text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = Navigation.REGULATIONS_PAGE}}
    }
}