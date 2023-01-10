import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    StackView {
        id: display_stack
        initialItem: main

        Main {id: main}
    }
}