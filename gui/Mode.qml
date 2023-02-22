import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

import "navigation.js" as Navigation

Item {
    ColumnLayout {
        anchors.fill: parent

        GridLayout {
            anchors.fill: parent

            rows: 3
            columns: 3
            flow: GridLayout.TopToBottom

            ButtonMD3 {text: qsTr("1. Общее"); onClicked: {display_stack.currentIndex = Navigation.MODE_AGL_PAGE}}
            ButtonMD3 {text: qsTr("2. ПГ-Л")}
            ButtonMD3 {text: qsTr("3. КЛ-У"); onClicked: {display_stack.currentIndex = Navigation.DEVICE_MODE_KLU_1_PAGE}}
            ButtonMD3 {text: qsTr("4. ДМД, УЗОЗМ"); onClicked: {display_stack.currentIndex = Navigation.DEVICE_MODE_DMD_UZOZM_1_PAGE}}
            ButtonMD3 {text: qsTr("5. Тракты ПРД, ПРМ"); onClicked: {display_stack.currentIndex = Navigation.DEVICE_MODE_PRM_PRM_1_PAGE}}
            ButtonMD3 {Layout.row: 0; Layout.column: 2; text: qsTr("6. Л807"); onClicked: {display_stack.currentIndex = Navigation.L807_PAGE}}
        }

        ButtonMD3 {text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = Navigation.REGULATIONS_PAGE}}
    }
}