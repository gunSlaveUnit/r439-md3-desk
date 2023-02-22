import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

import "navigation.js" as Navigation

Item {
    ColumnLayout {
        anchors.fill: parent

        ButtonMD3 {
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("РЕГЛАМЕНТ")
        }

        Item {height: 10}

        GridLayout {
            rows: 3
            columns: 2
            flow: GridLayout.TopToBottom
            Layout.fillWidth: true

            ButtonMD3 {Layout.fillWidth: true; text: qsTr("1. Состояние"); onClicked: {display_stack.currentIndex = Navigation.STATUS_PAGE}}
            ButtonMD3 {Layout.fillWidth: true; text: qsTr("2. Режим"); onClicked: {display_stack.currentIndex = Navigation.MODE_PAGE}}
            ButtonMD3 {Layout.fillWidth: true; text: qsTr("3. Режим АГ-Л"); onClicked: {display_stack.currentIndex = Navigation.MODE_AGL_PAGE}}
            ButtonMD3 {Layout.fillWidth: true; text: qsTr("4. Монитор")}
            ButtonMD3 {Layout.fillWidth: true; text: qsTr("5. Шлейф"); onClicked: {display_stack.currentIndex = Navigation.PLUME_PAGE}}
            ButtonMD3 {Layout.fillWidth: true; text: qsTr("6. Управление")}
        }

        ButtonMD3 {Layout.alignment: Qt.AlignRight; text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = Navigation.MAIN_PAGE}}
    }
}