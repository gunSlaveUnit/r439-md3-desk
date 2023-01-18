import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

import "navigation.js" as Navigation

Item {
    id: plume_page

    signal enteredPRDWaveNumber

    ColumnLayout {
        anchors.fill: parent

        GridLayout {
            anchors.fill: parent

            rows: 4
            columns: 2

            TextMD3 {text: qsTr("Генератор сдвига:")}
            ComboBoxMD3 {model: [qsTr("Вкл.")]}

            TextMD3 {text: qsTr("Усилитель мощности:")}
            ComboBoxMD3 {model: [qsTr("Откл.")]}

            TextMD3 {text: qsTr("Выход У205Д:")}
            ComboBoxMD3 {model: [qsTr("Вкл.")]}

            TextMD3 {text: qsTr("Номер волны ПРД:")}
            TextFieldMD3 {text: "0"; onEditingFinished: {plume_page.enteredPRDWaveNumber()}}
        }

        Item {Layout.fillHeight: true}

        GridLayout {
            rows: 2
            columns: 4

            TextMD3 {text: qsTr("Ствол. фильтр:")}
            TextMD3 {
                id: stem_filter
                text: "1"
                Connections {
                    target: plume_page
                    onEnteredPRDWaveNumber: {stem_filter.text = "8"}
                }
            }

            TextMD3 {text: qsTr("№ волны ПРМ:")}
            TextMD3 {
                id: prm_wave_number
                text: "2500"
                Connections {
                    target: plume_page
                    onEnteredPRDWaveNumber: {prm_wave_number.text = "2216"}
                }
            }

            TextMD3 {text: qsTr("Поддиап. приема:")}
            TextMD3 {
                id: receive_subband
                text: "1"
                Connections {
                    target: plume_page
                    onEnteredPRDWaveNumber: {receive_subband.text = "34"}
                }
            }

            TextMD3 {text: qsTr("№ фильтра ДМД:")}
            TextMD3 {
                id: dmd_filter_number
                text: "3"
                Connections {
                    target: plume_page
                    onEnteredPRDWaveNumber: {dmd_filter_number.text = "3"}
                }
            }
        }

        Item {Layout.fillHeight: true}

        ButtonMD3 {text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = Navigation.REGULATIONS_PAGE}}
    }
}