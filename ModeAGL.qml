import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

Item {
    ColumnLayout {
        GridLayout {
            rows: 6
            columns: 3
            flow: GridLayout.TopToBottom

            Button {text: qsTr("1. Режим прибора"); onClicked: {display_stack.currentIndex = 4}}
            Button {text: qsTr("2. ТЛФ1"); onClicked: {display_stack.currentIndex = 5}}
            Button {text: qsTr("3. ТЛФ2")}
            Button {text: qsTr("4. ТЛФ3")}
            Button {text: qsTr("5. ТЛФ4")}
            Button {text: qsTr("6. ТЛФ5")}
            Button {text: qsTr("7. КАУ1")}
            Button {text: qsTr("8. КАУ2")}
            Button {text: qsTr("9. КАУ3")}
            Button {text: qsTr("10. КАУ4")}
            Button {text: qsTr("11. КАУ5")}
            Button {text: qsTr("12. ТЛГ1")}
            Button {text: qsTr("13. ТЛГ2")}
            Button {text: qsTr("14. ТЛГ3")}
            Button {text: qsTr("15. ТЛГ4")}
            Button {text: qsTr("16. Синх. вход")}
        }
        Button {text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = 2}}
    }
}