import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import MMPTheme 1.0

Window {
    id: window
    title: qsTr("Vote")
    width: 700
    height: 600
    minimumWidth: 480
    minimumHeight: 450
    flags: Qt.Dialog

    property string moreInfoURL: "https://gridcoin.us"
    property bool multipleChoice: true
    property alias pollTitle: pollTitleLabel.text
    Shortcut {
        sequences: [StandardKey.Close]
        onActivated: window.close()
    }

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
                bottom: parent.bottom
                left: parent.left
                right: parent.right
                margins: 10
            }
            Text {
                id: pollTitleLabel
                text: "Poll" //Placeholder
                color: MMPTheme.textColor
                font.weight: Font.DemiBold
                font.pixelSize: 14
                wrapMode: Text.WordWrap
                anchors {
                    top: parent.top
                    topMargin: 20
                    left: parent.left
                    leftMargin:20
                    right: parent.right
                    rightMargin: 20
                }
            }
            ClickableLink {
                id: moreInfoLink
                urlString: moreInfoURL
                anchors {
                    top: pollTitleLabel.bottom
                    topMargin: 10
                    left: pollTitleLabel.left
                }
            }
            Rectangle {
                id: titleSeparator
                height:1
                color: MMPTheme.separatorColor
                anchors {
                    top: moreInfoLink.bottom
                    topMargin: 20
                    left: parent.left
                    leftMargin:20
                    right: parent.right
                    rightMargin: 20
                }
            }
            ListView {
                id: voteOptionsListView
                clip: true
                anchors {
                    left: parent.left
                    right: parent.right
                    top: titleSeparator.bottom
                    bottom: parent.bottom
                    margins: 20
                }
                model: ListModel {
                    id: answerModel
                    ListElement {
                        answerTitle: "Yes"
                    }
                    ListElement {
                        answerTitle: "No"
                    }
                    ListElement {
                        answerTitle: "Abstain"
                    }
                }
            }



        }
    }
}
