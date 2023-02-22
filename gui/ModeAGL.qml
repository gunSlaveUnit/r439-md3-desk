import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

import "navigation.js" as Navigation

Item {
    ColumnLayout {
        anchors.fill: parent

        GridLayout {
            anchors.fill: parent

            rows: 6
            columns: 3
            flow: GridLayout.TopToBottom

            ButtonMD3 {text: qsTr("1. Режим прибора"); onClicked: {display_stack.currentIndex = Navigation.DEVICE_MODE_AGL_PAGE}}
            ButtonMD3 {text: qsTr("2. ТЛФ1"); onClicked: {display_stack.currentIndex = Navigation.TLF1_PAGE}}
            ButtonMD3 {text: qsTr("3. ТЛФ2")}
            ButtonMD3 {text: qsTr("4. ТЛФ3")}
            ButtonMD3 {text: qsTr("5. ТЛФ4")}
            ButtonMD3 {text: qsTr("6. ТЛФ5")}
            ButtonMD3 {text: qsTr("7. КАУ1")}
            ButtonMD3 {text: qsTr("8. КАУ2")}
            ButtonMD3 {text: qsTr("9. КАУ3")}
            ButtonMD3 {text: qsTr("10. КАУ4")}
            ButtonMD3 {text: qsTr("11. КАУ5")}
            ButtonMD3 {text: qsTr("12. ТЛГ1")}
            ButtonMD3 {text: qsTr("13. ТЛГ2")}
            ButtonMD3 {text: qsTr("14. ТЛГ3")}
            ButtonMD3 {text: qsTr("15. ТЛГ4")}
            ButtonMD3 {text: qsTr("16. Синх. вход")}
        }

        Item {Layout.fillHeight: true}

        ButtonMD3 {text: qsTr("0. Выход"); onClicked: display_stack.currentIndex = Navigation.REGULATIONS_PAGE}
    }
}