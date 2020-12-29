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
            //height: implicitHeight+2
            text: qsTr("Receive Funds")
            font.weight: Font.DemiBold
            font.pixelSize: 22
            color: MMPTheme.textColor
            //verticalAlignment: Text.AlignTop
            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: 22
            }
        }
        Rectangle {
            id: recordSeparator
            color: MMPTheme.separatorColor
            height: titleText.height*0.625
            width: 1
            anchors {
                bottom: titleText.baseline
                bottomMargin: -1
                left: titleText.right
                leftMargin: 8
            }
        }

        //Num used temporarily
        property int num: 4
        property string recordString: qsTr("%n record(s)", "", num)
        Text {
            id: recordNumText
            text: parent.recordString.slice(0,1)
            color: MMPTheme.highlightColor
            font.weight: Font.DemiBold
            anchors {
                baseline: titleText.baseline
                baselineOffset: -2
                left: recordSeparator.right
                leftMargin: 8
            }
        }
        Text {
            id: recordLabelText
            height: recordSeparator.height
            text:  parent.recordString.slice(1)
            color: MMPTheme.textColor
            anchors {
                baseline: recordNumText.baseline
                left: recordNumText.right
            }
        }

        SearchBox {
            placeholderText: qsTr("Search by label or address")
            anchors {
                verticalCenter: parent.verticalCenter
                right: parent.right
                rightMargin: 20
            }
        }
    }
    Rectangle {
        id: receivePanel
        color: MMPTheme.bodyColor
        radius: 4
        anchors {
            top: header.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            topMargin: 10
            leftMargin: 10
            rightMargin: 10
            bottomMargin: 10
        }
    }
}
