import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

import "navigation.js" as Navigation

Item {
    ColumnLayout {
        ButtonMD3 {
            anchors.horizontalCenter: parent.horizontalCenter
            implicitWidth: 244
            text: qsTr("ГЛАВНОЕ")
        }

        Item {height: 10}

        GridLayout {
            rows: 6
            columns: 2
            flow: GridLayout.TopToBottom

            ButtonMD3 {implicitWidth: 244; text: qsTr("1. СХОС")}
            ButtonMD3 {implicitWidth: 244; text: qsTr("2. Монитор"); onClicked: {display_stack.currentIndex = Navigation.MONITOR_PAGE}}
            ButtonMD3 {implicitWidth: 244; text: qsTr("3. Сл. связь")}
            ButtonMD3 {implicitWidth: 244; text: qsTr("4. Архив команд")}
            ButtonMD3 {implicitWidth: 244; text: qsTr("5. РАТС")}
            ButtonMD3 {implicitWidth: 244; text: qsTr("6. ПРД")}
            ButtonMD3 {implicitWidth: 244; text: qsTr("7. Установка")}
            ButtonMD3 {implicitWidth: 244; text: qsTr("8. Регламент"); onClicked: {display_stack.currentIndex = Navigation.REGULATIONS_PAGE}}
            ButtonMD3 {implicitWidth: 244; text: qsTr("9. Антенна")}
            ButtonMD3 {implicitWidth: 244; text: qsTr("0. Ок. сеанса"); Layout.row: 4; Layout.column: 1}
        }
    }
}