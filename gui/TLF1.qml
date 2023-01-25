import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

import "navigation.js" as Navigation

Item {
    ColumnLayout {
        anchors.fill: parent

        GridLayout {
            anchors.fill: parent
            columns: 2

            Column {
                TextMD3 {text: qsTr("Тип сигнала ПРМ")}
                ComboBoxMD3 {model: [qsTr("канал не задан"), qsTr("Закреп. непрер.")]}

                TextMD3 {text: qsTr("Скорость")}
                ComboBoxMD3 {model: [4.8, 9.6]}

                TextMD3 {text: qsTr("Адрес в ГС")}
                RowLayout {
                    ComboBoxMD3 {model: [0]}
                    ComboBoxMD3 {model: [0]}
                    ComboBoxMD3 {model: [qsTr(""), 1]}
                }
            }

            Column {
                TextMD3 {text: qsTr("Тип сигнала ПРД")}
                ComboBoxMD3 {model: [qsTr("канал не задан"), qsTr("Закреп. непрер.")]}

                TextMD3 {text: qsTr("Скорость")}
                ComboBoxMD3 {model: [4.8, 9.6]}

                TextMD3 {text: qsTr("Адрес в ГС")}
                RowLayout {
                    ComboBoxMD3 {model: [0]}
                    ComboBoxMD3 {model: [qsTr(""), 1]}
                }
            }
        }


        ButtonMD3 {text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = Navigation.MODE_AGL_PAGE}}
    }
}