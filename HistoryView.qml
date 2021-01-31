import QtQuick 2.15
import QtQuick.Controls 2.15
import MMPTheme 1.0
Rectangle {
    id: main
    color: MMPTheme.backgroundColor
    Rectangle {
        id: header
        color: MMPTheme.themeSelect(MMPTheme.cWhite, MMPTheme.cSpaceBlack)
        height: 70
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
        }
        Rectangle {
            id: bottomBorder
            height: 1
            color: MMPTheme.themeSelect("transparent", MMPTheme.cBlack)
            anchors {
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }
        }

        Text {
            id: titleText
            text: qsTr("Transaction History")
            font.weight: Font.DemiBold
            font.pixelSize: 22
            color: MMPTheme.textColor
            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: 22
            }
        }
        SearchBox {
            placeholderText: qsTr("Search by address")
            anchors {
                verticalCenter: parent.verticalCenter
                right: parent.right
                rightMargin: 20
            }
        }
    }
    Rectangle {
        id: filterRect
        color: MMPTheme.secondaryBodyColor
        height: 40
        width: parent.width
        anchors.top: header.bottom
//        ComboBox {
//            id: timeComboBox
//            width: 170
//            displayText: datePicker.currentSelectionType
//            onPressedChanged: datePicker.open()
//            anchors {
//                left: parent.left
//                verticalCenter: parent.verticalCenter
//                leftMargin: 20
//            }
//            DatePicker {
//                id: datePicker
//                x: -width/2+timeComboBox.width*0.9
//                y: timeComboBox.height + 20
//                visible: false
//            }
//        }
        MouseArea {
            id: timeSelectionBox
            width: 170
            height: 24
            onPressed: {
                datePicker.open()
                forceActiveFocus()
            }
            anchors {
                left: parent.left
                verticalCenter: parent.verticalCenter
                leftMargin: 20
            }
            Rectangle {
                border.width: 1
                radius: 4
                color: MMPTheme.themeSelect(MMPTheme.cWhite, MMPTheme.cOxfordOffBlue)
                border.color: MMPTheme.themeSelect(MMPTheme.translucent(MMPTheme.cOxfordBlue, timeSelectionBox.activeFocus ? 0.7 : 0.3),
                                                   timeSelectionBox.activeFocus ? MMPTheme.translucent(MMPTheme.cWhite, 0.7) : MMPTheme.cOxfordBlue)
                anchors.fill: parent
                Image {
                    id: calendarIcon
                    source: MMPTheme.themeSelect("resources/icons/generic/ic_date_light.svg","resources/icons/generic/ic_date_dark.svg")
                    sourceSize: Qt.size(10, 10)
                    opacity: timeSelectionBox.activeFocus ? 1 : 0.7
                    anchors {
                        verticalCenter: parent.verticalCenter
                        left: parent.left
                        leftMargin: 10
                    }
                }
                Image {
                    id: calenderDownChevron
                    source: MMPTheme.themeSelect("qrc:/resources/icons/generic/ic_chevron_down_light.svg", "qrc:/resources/icons/generic/ic_chevron_down_dark.svg")
                    opacity: timeSelectionBox.activeFocus ? 1 : 0.7
                    sourceSize: Qt.size(15, 15)
                    anchors {
                        verticalCenter: parent.verticalCenter
                        right: parent.right
                        rightMargin: 5
                    }
                }
                Text {
                    id: calendarDisplayText
                    text: datePicker.currentSelectionType
                    verticalAlignment: Text.AlignVCenter
                    color: MMPTheme.textColor
                    opacity: timeSelectionBox.activeFocus ? 1 : 0.7
                    anchors {
                        left: calendarIcon.right
                        right: calenderDownChevron.left
                        top: parent.top
                        bottom: parent.bottom
                        leftMargin: 6
                        rightMargin: 5
                    }
                }
            }
            DatePicker {
                id: datePicker
                x: -width/2 + timeSelectionBox.width*0.9
                y: timeSelectionBox.height + 20
                visible: false
            }
        }
        ComboBox {
            id: typeComboBox
            width: 170
            height: 24
            currentIndex: 0
            focus: false
            anchors {
                left: timeSelectionBox.right
                verticalCenter: parent.verticalCenter
                leftMargin: 10
            }
            model: ListModel {
                ListElement { text: qsTr("All Types") }
                ListElement { text: qsTr("Incoming") }
                ListElement { text: qsTr("Outgoing") }
                ListElement { text: qsTr("Block Reward") }
                ListElement { text: qsTr("Research") }
            }
        }
        TextField {
            id: minAmount
            width: 140
            placeholderText: qsTr("Min. Amount")
            validator: DoubleValidator { bottom: 0 }
            anchors {
                right: parent.right
                verticalCenter: parent.verticalCenter
                rightMargin: 10
            }
        }
    }

    Rectangle {
        id: historyPanel
        color: MMPTheme.bodyColor
        radius: 4
        anchors {
            top: filterRect.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            margins: 10
        }
    }
}
