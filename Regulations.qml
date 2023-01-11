import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

import "navigation.js" as Navigation

Item {
    ColumnLayout {
        anchors.fill: parent

        GridLayout {
            rows: 3
            columns: 2
            flow: GridLayout.TopToBottom
            anchors.fill: parent

            StretchedButton {text: qsTr("1. Состояние"); onClicked: {display_stack.currentIndex = Navigation.STATUS_PAGE}}
            StretchedButton {text: qsTr("2. Режим"); onClicked: {display_stack.currentIndex = Navigation.MODE_PAGE}}
            StretchedButton {text: qsTr("3. Режим АГ-Л"); onClicked: {display_stack.currentIndex = Navigation.MODE_AGL_PAGE}}
            StretchedButton {text: qsTr("4. Монитор")}
            StretchedButton {text: qsTr("5. Шлейф"); onClicked: {display_stack.currentIndex = Navigation.PLUME_PAGE}}
            StretchedButton {text: qsTr("6. Управление")}
        }
        StretchedButton {text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = Navigation.MAIN_PAGE}}
    }
}