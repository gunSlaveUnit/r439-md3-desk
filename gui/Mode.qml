import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

import "navigation.js" as Navigation

Item {
    ColumnLayout {
        anchors.fill: parent

        ButtonMD3 {
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("ВВОД РЕЖИМНЫХ ПАРАМЕТРОВ")
        }

        Item {height: 10}

        GridLayout {
            rows: 6
            columns: 3
            Layout.fillWidth: true

            ButtonMD3 {Layout.fillWidth: true; Layout.row: 0; Layout.column: 0; text: qsTr("1. Общее"); onClicked: {display_stack.currentIndex = Navigation.MODE_AGL_PAGE}}
            ButtonMD3 {Layout.fillWidth: true; Layout.row: 1; Layout.column: 0; text: qsTr("2. ПГ-Л")}
            ButtonMD3 {Layout.fillWidth: true; Layout.row: 2; Layout.column: 0; text: qsTr("3. КЛ-У"); onClicked: {display_stack.currentIndex = Navigation.DEVICE_MODE_KLU_1_PAGE}}
            ButtonMD3 {Layout.fillWidth: true; Layout.row: 0; Layout.column: 1; text: qsTr("4. ДМД, УЗОЗМ"); onClicked: {display_stack.currentIndex = Navigation.DEVICE_MODE_DMD_UZOZM_1_PAGE}}
            ButtonMD3 {Layout.fillWidth: true; Layout.row: 1; Layout.column: 1; text: qsTr("5. Тракты ПРД, ПРМ"); onClicked: {display_stack.currentIndex = Navigation.DEVICE_MODE_PRM_PRM_1_PAGE}}
            ButtonMD3 {Layout.fillWidth: true; Layout.row: 0; Layout.column: 2; text: qsTr("6. Л807"); onClicked: {display_stack.currentIndex = Navigation.L807_PAGE}}
            ColumnLayout {
                Layout.fillWidth: true; Layout.fillHeight: true;
                Layout.row: 2; Layout.column: 1;
                Layout.rowSpan: 4; Layout.columnSpan: 2;
                Text {
                    text: qsTr("Внимание!")
                    font.pointSize: 14
                    color: "#ffaf00"
                }
                TextMD3 {
                    font.pointSize: 14
                    text: qsTr("Вы вошли в технологический режим\nуправления станцией.\nКоррекция режимных параметров\nможет привести к нарушению\n рабочего режима")
                }
            }
        }

        ButtonMD3 {Layout.alignment: Qt.AlignRight; text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = Navigation.REGULATIONS_PAGE}}
    }
}