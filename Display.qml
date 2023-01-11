import QtQuick 2.15
import QtQuick.Layouts 2.15

Item {
    StackLayout {
        id: display_stack

        anchors.fill: parent

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
    }
}