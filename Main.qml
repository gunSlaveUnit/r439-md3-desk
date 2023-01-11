import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

import "navigation.js" as Navigation

Item {
    GridLayout {
        rows: 6
        columns: 2
        flow: GridLayout.TopToBottom

        Button {text: qsTr("1. СХОС")}
        Button {text: qsTr("2. Монитор"); onClicked: {display_stack.currentIndex = Navigation.MONITOR_PAGE}}
        Button {text: qsTr("3. Сл. связь")}
        Button {text: qsTr("4. Архив команд")}
        Button {text: qsTr("5. РАТС")}
        Button {text: qsTr("6. ПРД")}
        Button {text: qsTr("7. Установка")}
        Button {text: qsTr("8. Регламент"); onClicked: {display_stack.currentIndex = Navigation.REGULATIONS_PAGE}}
        Button {text: qsTr("9. Антенна")}
        Button {text: qsTr("0. Ок. сеанса"); Layout.row: 4; Layout.column: 1}
    }
}