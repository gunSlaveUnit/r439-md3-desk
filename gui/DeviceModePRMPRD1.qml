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

            rows: 5
            columns: 2

            TextMD3 {text: qsTr("Автоконтроль CAN:")}
            ComboBoxMD3 {
                model: tract_prm_prd.auto_check_can_variants
                onCurrentIndexChanged: {tract_prm_prd.auto_check_can = currentIndex}
            }

            TextMD3 {text: qsTr("Поддиппазон приема:")}
            ComboBoxMD3 {
                model: tract_prm_prd.receive_subbands
                onCurrentIndexChanged: {tract_prm_prd.receive_subband = currentIndex}
            }

            TextMD3 {text: qsTr("Генератор сдвига:")}
            ComboBoxMD3 {
                model: tract_prm_prd.shift_generator_variants
                onCurrentIndexChanged: {tract_prm_prd.shift_generator = currentIndex}
            }

            TextMD3 {text: qsTr("Ствольный фильтр:")}
            ComboBoxMD3 {
                model: tract_prm_prd.barrel_filter_variants
                onCurrentIndexChanged: {tract_prm_prd.barrel_filter = currentIndex}
            }

            TextMD3 {text: qsTr("Усилитель мощности:")}
            ComboBoxMD3 {
                model: tract_prm_prd.amplifier_variants
                onCurrentIndexChanged: {tract_prm_prd.amplifier = currentIndex}
            }
        }

        RowLayout {
            ButtonMD3 {text: qsTr(">"); onClicked: {display_stack.currentIndex = Navigation.DEVICE_MODE_PRM_PRM_2_PAGE}}
            ButtonMD3 {text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = Navigation.MODE_PAGE}}
        }
    }
}