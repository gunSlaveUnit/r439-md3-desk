import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

import "navigation.js" as Navigation

Item {
    ColumnLayout {
        GridLayout {
            rows: 8
            columns: 2

            Text {text: qsTr("Норма УПЧ:")}
            Text {text: qsTr("Есть")}

            Text {text: qsTr("Норма ДМД:")}
            Text {text: qsTr("Есть")}

            Text {text: qsTr("Захват ПЧ")}
            Text {text: qsTr("Есть")}

            Text {text: qsTr("Захват ТЧ:")}
            Text {text: qsTr("Есть")}

            Text {text: qsTr("Поиск:")}
            Text {text: qsTr("Нет")}

            Text {text: qsTr("Качество сигнала:")}
            Text {text: qsTr("Норма")}

            Text {text: qsTr("Расстройка, Гц:")}
            Text {text: qsTr("-100")}

            Text {text: qsTr("Уровень ПРМ:")}
            Text {text: qsTr("16513")}
        }

        RowLayout {
            Button {text: qsTr(">")}
            Button {text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = Navigation.STATUS_PAGE}}
        }
    }
}