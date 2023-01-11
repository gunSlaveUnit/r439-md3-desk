import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

import "navigation.js" as Navigation

Item {
    GridLayout {
        rows: 6
        columns: 2
        flow: GridLayout.TopToBottom
        anchors.fill: parent

        StretchedButton {text: qsTr("1. СХОС")}
        StretchedButton {text: qsTr("2. Монитор"); onClicked: {display_stack.currentIndex = Navigation.MONITOR_PAGE}}
        StretchedButton {text: qsTr("3. Сл. связь")}
        StretchedButton {text: qsTr("4. Архив команд")}
        StretchedButton {text: qsTr("5. РАТС")}
        StretchedButton {text: qsTr("6. ПРД")}
        StretchedButton {text: qsTr("7. Установка")}
        StretchedButton {text: qsTr("8. Регламент"); onClicked: {display_stack.currentIndex = Navigation.REGULATIONS_PAGE}}
        StretchedButton {text: qsTr("9. Антенна")}
        StretchedButton {text: qsTr("0. Ок. сеанса"); Layout.row: 4; Layout.column: 1}
    }
}