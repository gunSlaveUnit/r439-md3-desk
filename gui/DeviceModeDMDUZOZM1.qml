import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

import "navigation.js" as Navigation

Item {
    Connections {
        target: dmd_uzozm
    }

    ColumnLayout {
        anchors.fill: parent

        GridLayout {
            anchors.fill: parent

            rows: 7
            columns: 2

            TextMD3 {text: qsTr("Тип радиосигнала ПРМ:")}
            ComboBoxMD3 {
                model: dmd_uzozm.prm_signal_types
                onCurrentIndexChanged: dmd_uzozm.prm_signal_type = currentIndex
            }

            TextMD3 {text: qsTr("Декодер:")}
            ComboBoxMD3 {
                model: dmd_uzozm.decoder_variants
                onCurrentIndexChanged: dmd_uzozm.decoder = currentIndex
            }

            TextMD3 {text: qsTr("Скорость ДМД, кбит/с:")}
            ComboBoxMD3 {
                model: dmd_uzozm.dmd_speeds
                onCurrentIndexChanged: dmd_uzozm.dmd_speed = currentIndex
            }

            TextMD3 {text: qsTr("Режим ДМД:")}
            ComboBoxMD3 {
                model: dmd_uzozm.dmd_modes
                onCurrentIndexChanged: dmd_uzozm.dmd_mode = currentIndex
            }

            TextMD3 {text: qsTr("Скорость ПРД УЗОЗМ, кбит/с:")}
            ComboBoxMD3 {
                model: dmd_uzozm.prd_uzozm_speeds
                onCurrentIndexChanged: dmd_uzozm.prd_uzozm_speed = currentIndex
            }

            TextMD3 {text: qsTr("Режим УЗОЗМ:")}
            ComboBoxMD3 {
                model: dmd_uzozm.uzozm_modes
                onCurrentIndexChanged: dmd_uzozm.uzozm_mode = currentIndex
            }

            TextMD3 {text: qsTr("Служебный канал в ФТ4:")}
            ComboBoxMD3 {
                model: dmd_uzozm.service_channel_ft4_variants
                onCurrentIndexChanged: dmd_uzozm.service_channel_ft4 = currentIndex
            }
        }

        RowLayout {
            ButtonMD3 {text: qsTr(">"); onClicked: {display_stack.currentIndex = Navigation.DEVICE_MODE_DMD_UZOZM_2_PAGE}}
            ButtonMD3 {text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = Navigation.MODE_PAGE}}
        }
    }
}