import QtQuick 2.15
import QtQuick.Layouts 2.15

Item {
    StackLayout {
        id: display_stack

        Main {}

        Regulations {}

        Mode {}

        ModeAGL {}

        DeviceModeAGL {}

        TLF1 {}

        L807 {}
    }
}