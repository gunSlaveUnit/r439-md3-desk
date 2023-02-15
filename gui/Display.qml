import QtQuick 2.15
import QtQuick.Layouts 2.15

Item {
    ColumnLayout {
        anchors.fill: parent

        RowLayout {
            HeadButtonMD3 {text: qsTr("(. Приборы - авария")}
            HeadButtonMD3 {text: qsTr("15-02-2023")}
            HeadButtonMD3 {text: qsTr("10:16:37")}
        }

        RowLayout {
            HeadButtonMD3 {text: qsTr("). Обмен")}
            HeadButtonMD3 {text: qsTr("<. Запрет ПРД")}
            HeadButtonMD3 {text: qsTr(">. Тракт ПРМ - не норма")}
        }

        Rectangle {
            Layout.preferredWidth: 240
            Layout.preferredHeight: 30
            color: "transparent"
            border.width: 2
            border.color: "#ffaf00"

            Text {
                font.pointSize: 12
                anchors.centerIn: parent
                text: qsTr("ГЛАВНОЕ")
                color: "#ffaf00"
            }
        }       

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