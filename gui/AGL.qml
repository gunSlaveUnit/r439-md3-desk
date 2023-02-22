import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

import "navigation.js" as Navigation

Item {
    StackLayout {
        id: agl_stack_layout

        ColumnLayout {
            anchors.fill: parent

            GridLayout {
                anchors.fill: parent

                rows: 11
                columns: 2

                TextMD3 {text: qsTr("Норма ТЭЗ АГ-БЛ:")}
                TextFieldMD3 {text: "Есть"}

                TextMD3 {text: qsTr("Норма ТЭЗ АГ-АЛ:")}
                TextFieldMD3 {text: "Есть"}

                TextMD3 {text: qsTr("Корректность режима:")}
                TextFieldMD3 {text: "Есть"}

                TextMD3 {text: qsTr("Норма каналов:")}
                TextFieldMD3 {text: "Есть"}

                TextMD3 {text: qsTr("Синхронизация с РТР:")}
                TextFieldMD3 {text: "Пусто"}

                TextMD3 {text: qsTr("Запрос КАУ ПРМ:")}
                TextFieldMD3 {text: "Нет"}

                TextMD3 {text: qsTr("Запрос РАТС:")}
                TextFieldMD3 {text: "Нет"}

                TextMD3 {text: qsTr("Прием ГС основного:")}
                TextFieldMD3 {text: "Норма"}

                TextMD3 {text: qsTr("Ошибки в ГС основном:")}
                TextFieldMD3 {text: "0"}

                TextMD3 {text: qsTr("Прием ГС дополнительного:")}
                TextFieldMD3 {text: "Не задан"}

                TextMD3 {text: qsTr("Ошибки в ГС дополнительном:")}
                TextFieldMD3 {text: "Пусто"}
            }

            RowLayout {
                ButtonMD3 {text: qsTr(">"); onClicked: agl_stack_layout.currentIndex = 1}
                ButtonMD3 {text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = Navigation.STATUS_PAGE}}
            }
        }

        ColumnLayout {
            anchors.fill: parent

            GridLayout {
                anchors.fill: parent

                rows: 9
                columns: 2

                TextMD3 {text: qsTr("Режим ПРМ:")}
                TextFieldMD3 {text: "Задан"}

                TextMD3 {text: qsTr("Сигнал на входе РТР:")}
                TextFieldMD3 {text: "Есть"}

                TextMD3 {text: qsTr("Сигнал абонента:")}
                TextFieldMD3 {text: "Есть"}

                TextMD3 {text: qsTr("Информация:")}
                TextFieldMD3 {text: "Есть"}

                TextMD3 {text: qsTr("Ошибки:")}
                TextFieldMD3 {text: "0"}

                TextMD3 {text: qsTr("Режим ПРД:")}
                TextFieldMD3 {text: "Задан"}

                TextMD3 {text: qsTr("Синхронизация:")}
                TextFieldMD3 {text: "Есть"}

                TextMD3 {text: qsTr("Сигнал на входе:")}
                TextFieldMD3 {text: "Есть"}

                TextMD3 {text: qsTr("Информация на входе:")}
                TextFieldMD3 {text: "Есть"}
            }

            RowLayout {
                ButtonMD3 {text: qsTr("<"); onClicked: agl_stack_layout.currentIndex = 0}
                ButtonMD3 {text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = Navigation.STATUS_PAGE}}
            }
        }
    }
}