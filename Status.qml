import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

import "navigation.js" as Navigation

Item {
    ColumnLayout {
        anchors.fill: parent

        GridLayout {
            anchors.fill: parent

            rows: 4
            columns: 2
            flow: GridLayout.TopToBottom

            ButtonMD3 {text: qsTr("1. Общее")}
            ButtonMD3 {text: qsTr("2. АГ-Л")}
            ButtonMD3 {text: qsTr("3. ПГ-Л")}
            ButtonMD3 {text: qsTr("4. КЛ-У")}
            ButtonMD3 {text: qsTr("5. ДМД, УЗОЗМ"); onClicked: {display_stack.currentIndex = Navigation.STATUS_DMD_PAGE}}
            ButtonMD3 {text: qsTr("6. Тракты ПРД, ПРМ")}
        }

        ButtonMD3 {text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = Navigation.REGULATIONS_PAGE}}
    }
}