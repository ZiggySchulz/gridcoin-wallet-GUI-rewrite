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
        ComboBox {
            id: timeComboBox
            width: 170
            displayText: qsTr("All Time")
            anchors {
                left: parent.left
                verticalCenter: parent.verticalCenter
                leftMargin: 20
            }
        }
        ComboBox {
            id: typeComboBox
            width: 170
            displayText: qsTr("All Types")
            anchors {
                left: timeComboBox.right
                verticalCenter: parent.verticalCenter
                leftMargin: 10
            }
            model: ListModel {
                ListElement { text: "Incoming" }
                ListElement { text: "Outgoing" }
                ListElement { text: "Block Reward" }
                ListElement { text: "Research" }
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
