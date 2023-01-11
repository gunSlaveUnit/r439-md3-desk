import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

import "navigation.js" as Navigation

Item {
    id: plume_page

    signal enteredPRDWaveNumber

    ColumnLayout {
        GridLayout {
            rows: 4
            columns: 2

            Text {text: qsTr("Генератор сдвига:")}
            ComboBox {model: [qsTr("Вкл.")]}

            Text {text: qsTr("Усилитель мощности:")}
            ComboBox {model: [qsTr("Откл.")]}

            Text {text: qsTr("Выход У205Д:")}
            ComboBox {model: [qsTr("Вкл.")]}

            Text {text: qsTr("Номер волны ПРД:")}
            TextField {text: "0"; onEditingFinished: {plume_page.enteredPRDWaveNumber()}}
        }

        GridLayout {
            rows: 2
            columns: 4

            Text {text: qsTr("Ствол. фильтр:")}
            TextField {
                id: stem_filter
                text: "1"
                Connections {
                    target: plume_page
                    onEnteredPRDWaveNumber: {stem_filter.text = "8"}
                }
            }

            Text {text: qsTr("№ волны ПРМ:")}
            TextField {
                id: prm_wave_number
                text: "2500"
                Connections {
                    target: plume_page
                    onEnteredPRDWaveNumber: {prm_wave_number.text = "2216"}
                }
            }

            Text {text: qsTr("Поддиап. приема:")}
            TextField {
                id: receive_subband
                text: "1"
                Connections {
                    target: plume_page
                    onEnteredPRDWaveNumber: {receive_subband.text = "34"}
                }
            }

            Text {text: qsTr("№ фильтра ДМД:")}
            TextField {
                id: dmd_filter_number
                text: "3"
                Connections {
                    target: plume_page
                    onEnteredPRDWaveNumber: {dmd_filter_number.text = "3"}
                }
            }
        }

        Button {text: qsTr("0. Выход"); onClicked: {display_stack.currentIndex = Navigation.REGULATIONS_PAGE}}
    }
}