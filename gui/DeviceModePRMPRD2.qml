import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

import "navigation.js" as Navigation

Item {
    Connections {
        target: tract_prm_prd
    }

    ColumnLayout {
        anchors.fill: parent

        GridLayout {
            anchors.fill: parent

            rows: 6
            columns: 2

            TextMD3 {text: qsTr("Тип радиосигнала:")}
            ComboBoxMD3 {
                model: tract_prm_prd.radio_signal_types
                onCurrentIndexChanged: {tract_prm_prd.radio_signal = currentIndex}
            }

            TextMD3 {text: qsTr("Вид сигнала ОФТ:")}
            ComboBoxMD3 {
                model: tract_prm_prd.signal_types
                onCurrentIndexChanged: {tract_prm_prd.signal_type = currentIndex}
            }

            TextMD3 {text: qsTr("Скорость ЗС:")}
            ComboBoxMD3 {
                model: tract_prm_prd.zs_speeds
                onCurrentIndexChanged: {tract_prm_prd.zs_speed = currentIndex}
            }

            TextMD3 {text: qsTr("Выход У205Д:")}
            ComboBoxMD3 {
                model: tract_prm_prd.outputs_u205d
                onCurrentIndexChanged: {tract_prm_prd.output_u205d = currentIndex}
            }

            TextMD3 {text: qsTr("Номер волны ПРД:")}
            TextFieldMD3 {
                text: tract_prm_prd.prd_wave_number
                onEditingFinished: {tract_prm_prd.prd_wave_number = text}
            }

            TextMD3 {text: qsTr("Номер волны ПРМ:")}
            TextFieldMD3 {
                text: tract_prm_prd.prm_wave_number
                onEditingFinished: {tract_prm_prd.prm_wave_number = text}
            }
        }

        RowLayout {
            ButtonMD3 {text: qsTr("<"); onClicked: {display_stack.currentIndex = Navigation.DEVICE_MODE_PRM_PRM_1_PAGE}}
            ButtonMD3 {text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = Navigation.MODE_PAGE}}
        }
    }
}