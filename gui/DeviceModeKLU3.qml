import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

import "navigation.js" as Navigation

Item {
    Connections {
        target: klu
    }

    ColumnLayout {
        anchors.fill: parent

        GridLayout {
            anchors.fill: parent

            rows: 8
            columns: 2

            TextMD3 {text: qsTr("Тестпроверка:")}
            ComboBoxMD3 {
                model: klu.test_check_modes
                onCurrentIndexChanged: {klu.test_check = currentIndex}
            }

            TextMD3 {text: qsTr("Режим теста:")}
            ComboBoxMD3 {model: [qsTr("ПР")]}

            TextMD3 {text: qsTr("ПРД 70:")}
            ComboBoxMD3 {
                model: klu.prd70_modes
                onCurrentIndexChanged: {klu.prd70 = currentIndex}
            }

            TextMD3 {text: qsTr("Сброс счетчика ошибок:")}
            ComboBoxMD3 {model: [qsTr("Откл.")]}

            TextMD3 {text: qsTr("Служебный 1:")}
            ComboBoxMD3 {model: [qsTr("Откл.")]}

            TextMD3 {text: qsTr("Служебный 2:")}
            ComboBoxMD3 {model: [qsTr("Откл.")]}

            TextMD3 {text: qsTr("Тип сигнала ПРД:")}
            ComboBoxMD3 {
                model: klu.prd_signal_types
                onCurrentIndexChanged: {klu.prd_signal_type = currentIndex}
            }

            TextMD3 {text: qsTr("Ft ПСП ШПС ПРД:")}
            ComboBoxMD3 {model: [qsTr("Ft2")]}
        }

        RowLayout {
            ButtonMD3 {text: qsTr("<"); onClicked: {display_stack.currentIndex = Navigation.DEVICE_MODE_KLU_2_PAGE}}
            ButtonMD3 {text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = Navigation.MODE_PAGE}}
        }
    }
}