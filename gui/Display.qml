import QtQuick 2.15
import QtQuick.Layouts 2.15

Item {
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 8

        RowLayout {
            ButtonMD3 {text: qsTr("(. Приборы - авария")}
            ButtonMD3 {text: qsTr("15-02-2023")}
            ButtonMD3 {text: qsTr("11:36:42")}
        }

        RowLayout {
            ButtonMD3 {text: qsTr("). Обмен")}
            ButtonMD3 {text: qsTr("<. Запрет ПРД")}
            ButtonMD3 {text: qsTr(">. Тракт ПРМ - не норма")}
        }

        Item {height: 10}

        StackLayout {
            id: display_stack

            Main {}

            Monitor {}

            Regulations {}

            Status {}

            StatusDMD {}

            Mode {}

            ModeAGL {}

            DeviceModeAGL {}

            DeviceModeKLU1 {}

            DeviceModeKLU2 {}

            DeviceModeKLU3 {}

            TLF1 {}

            DeviceModeDMDUZOZM1 {}

            DeviceModeDMDUZOZM2 {}

            DeviceModePRMPRD1 {}

            DeviceModePRMPRD2 {}

            L807 {}

            Plume {}

            AGL {}
        }
    }
}