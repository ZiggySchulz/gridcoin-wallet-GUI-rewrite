import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import MMPTheme 1.0

Window {
    id: window
    width: 650
    height: 300
    minimumWidth: 400
    minimumHeight: 250
    title: qsTr("Address QR Code")
    property string address
    Rectangle {
        id: background
        color: MMPTheme.backgroundColor
        anchors.fill: parent
        Rectangle {
            id: body
            color: MMPTheme.bodyColor
            radius: 4
            anchors {
                top: parent.top
                bottom: saveButton.top
                left: parent.left
                right: parent.right
                margins: 10
            }
            Rectangle {
                id: qrRect
                width: height
                color: "green"
                anchors {
                    top: parent.top
                    bottom: parent.bottom
                    left: parent.left
                    margins: 10
                }
            }
            Text {
                id: urlText
                text: "gridcoin:"+address+"?label:Zigzagoon Balloon"
                wrapMode: Text.WrapAnywhere
                color: MMPTheme.textColor
                font.weight: Font.Medium
                anchors {
                    left: qrRect.right
                    top: parent.top
                    right: parent.right
                    margins: 10
                }
            }
            Text {
                id: titleLabel
                text: qsTr("Title:")
                color: MMPTheme.textColor
                horizontalAlignment: Text.AlignRight
                anchors {
                    left: qrRect.right
                    right: messageLabel.right
                    top: urlText.bottom
                    leftMargin: 10
                    topMargin: 20
                }
            }
            TextField {
                id: titleField
                anchors {
                    left: titleLabel.right
                    right: parent.right
                    verticalCenter: titleLabel.verticalCenter
                    margins: 10
                }
            }
            Text {
                id: messageLabel
                text: qsTr("Message:")
                color: MMPTheme.textColor
                anchors {
                    left: qrRect.right
                    top: titleLabel.bottom
                    leftMargin: 10
                    topMargin: 20
                }
            }
            TextArea {
                id: messageArea
                wrapMode: Text.WordWrap
                anchors {
                    left: messageLabel.right
                    top: titleField.bottom
                    right: parent.right
                    bottom: parent.bottom
                    margins: 10
                }
            }
        }
        Button {
            id: saveButton
            text: qsTr("Save to File")
            icon.source: MMPTheme.themeSelect("resources/icons/buttons/ic_btn_save_qr_light.svg","resources/icons/buttons/ic_btn_save_qr_dark.svg")
            anchors {
                right: parent.right
                bottom: parent.bottom
                margins: 10
            }
        }
    }
}
