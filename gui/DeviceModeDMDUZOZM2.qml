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

            TextMD3 {text: qsTr("Номер фильтра:")}
            ComboBoxMD3 {
                model: dmd_uzozm.filter_numbers
                onCurrentIndexChanged: dmd_uzozm.filter_number = currentIndex
            }

            TextMD3 {text: qsTr("АРУ:")}
            ComboBoxMD3 {
                model: dmd_uzozm.aru_variants
                onCurrentIndexChanged: dmd_uzozm.aru = currentIndex
            }

            TextMD3 {text: qsTr("Автопоиск:")}
            ComboBoxMD3 {
                model: dmd_uzozm.auto_search_variants
                onCurrentIndexChanged: dmd_uzozm.auto_search = currentIndex
            }

            TextMD3 {text: qsTr("АСЧ:")}
            ComboBoxMD3 {
                model: dmd_uzozm.asch_variants
                onCurrentIndexChanged: dmd_uzozm.asch = currentIndex
            }

            TextMD3 {text: qsTr("Диф. декодер:")}
            ComboBoxMD3 {
                model: dmd_uzozm.dif_decoder_variants
                onCurrentIndexChanged: dmd_uzozm.dif_decoder = currentIndex
            }

            TextMD3 {text: qsTr("Полоса ДМД:")}
            ComboBoxMD3 {
                model: dmd_uzozm.dmd_bands
                onCurrentIndexChanged: dmd_uzozm.dmd_band = currentIndex
            }

            TextMD3 {text: qsTr("Корректор:")}
            ComboBoxMD3 {
                model: dmd_uzozm.corrector_variants
                onCurrentIndexChanged: dmd_uzozm.corrector = currentIndex
            }
        }

        RowLayout {
            ButtonMD3 {text: qsTr("<"); onClicked: {display_stack.currentIndex = Navigation.DEVICE_MODE_DMD_UZOZM_1_PAGE}}
            ButtonMD3 {text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = Navigation.MODE_PAGE}}
        }
    }
}