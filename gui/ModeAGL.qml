import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

import "navigation.js" as Navigation

Item {
    ColumnLayout {
        anchors.fill: parent

        ButtonMD3 {
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("РЕЖИМ АГ-Л")
        }

        Item {height: 10}

        GridLayout {
            Layout.fillWidth: true

            rows: 6
            columns: 3
            flow: GridLayout.TopToBottom

            ButtonMD3 {Layout.fillWidth: true; text: qsTr("1. Режим прибора"); onClicked: {display_stack.currentIndex = Navigation.DEVICE_MODE_AGL_PAGE}}
            ButtonMD3 {Layout.fillWidth: true; text: qsTr("2. ТЛФ1"); onClicked: {display_stack.currentIndex = Navigation.TLF1_PAGE}}
            ButtonMD3 {Layout.fillWidth: true; text: qsTr("3. ТЛФ2")}
            ButtonMD3 {Layout.fillWidth: true; text: qsTr("4. ТЛФ3")}
            ButtonMD3 {Layout.fillWidth: true; text: qsTr("5. ТЛФ4")}
            ButtonMD3 {Layout.fillWidth: true; text: qsTr("6. ТЛФ5")}
            ButtonMD3 {Layout.fillWidth: true; text: qsTr("7. КАУ1")}
            ButtonMD3 {Layout.fillWidth: true; text: qsTr("8. КАУ2")}
            ButtonMD3 {Layout.fillWidth: true; text: qsTr("9. КАУ3")}
            ButtonMD3 {Layout.fillWidth: true; text: qsTr("10. КАУ4")}
            ButtonMD3 {Layout.fillWidth: true; text: qsTr("11. КАУ5")}
            ButtonMD3 {Layout.fillWidth: true; text: qsTr("12. ТЛГ1")}
            ButtonMD3 {Layout.fillWidth: true; text: qsTr("13. ТЛГ2")}
            ButtonMD3 {Layout.fillWidth: true; text: qsTr("14. ТЛГ3")}
            ButtonMD3 {Layout.fillWidth: true; text: qsTr("15. ТЛГ4")}
            ButtonMD3 {Layout.fillWidth: true; text: qsTr("16. Синх. вход")}
        }

        Item {height: 10}

        ButtonMD3 {text: qsTr("0. Выход"); onClicked: display_stack.currentIndex = Navigation.MODE_PAGE}
    }
}