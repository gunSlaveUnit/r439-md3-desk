import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

import "navigation.js" as Navigation

Item {
    ColumnLayout {
        GridLayout {
            rows: 3
            columns: 2
            flow: GridLayout.TopToBottom

            Button {text: qsTr("1. Состояние")}
            Button {text: qsTr("2. Режим"); onClicked: {display_stack.currentIndex = Navigation.MODE_PAGE}}
            Button {text: qsTr("3. Режим АВУР")}
            Button {text: qsTr("4. Монитор")}
            Button {text: qsTr("5. Шлейф")}
            Button {text: qsTr("6. Управление")}
        }
        Button {text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = Navigation.MAIN_PAGE}}
    }
}