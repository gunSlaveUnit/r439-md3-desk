import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

import "navigation.js" as Navigation

Item {
    ColumnLayout {
        GridLayout {
            rows: 3
            columns: 3
            flow: GridLayout.TopToBottom

            Button {text: qsTr("1. Общее"); onClicked: {display_stack.currentIndex = Navigation.MODE_AGL_PAGE}}
            Button {text: qsTr("2. ПГ-Л")}
            Button {text: qsTr("3. КЛ-У"); onClicked: {display_stack.currentIndex = Navigation.DEVICE_MODE_KLU_1_PAGE}}
            Button {text: qsTr("4. ДМД, УЗОЗМ"); onClicked: {display_stack.currentIndex = Navigation.DEVICE_MODE_DMD_UZOZM_1_PAGE}}
            Button {text: qsTr("5. Тракты ПРД, ПРМ")}
            Button {Layout.row: 0; Layout.column: 2; text: qsTr("6. Л807"); onClicked: {display_stack.currentIndex = Navigation.L807_PAGE}}
        }
        Button {text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = Navigation.REGULATIONS_PAGE}}
    }
}