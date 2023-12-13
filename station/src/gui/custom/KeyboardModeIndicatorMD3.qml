import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

Rectangle {
    property bool isSelected: false

	anchors.centerIn: parent
	width: parent.width / 4
	height: width
	radius: width / 2

	color: isSelected ? "#d6fd0a" : "#dfc9a2"
}
