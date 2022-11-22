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
    property bool multipleChoice: false
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
                bottom: submitVoteButton.top
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
                spacing: 10
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
                        checked: false
                    }
                    ListElement {
                        answerTitle: "No"
                        checked: false
                    }
                    ListElement {
                        answerTitle: "Abstain"
                        checked: false
                    }
                }
                ButtonGroup { //Provises mutually exclusive buttons
                    id: optionButtonGroup
                }

                delegate: Item {
                    id: optionDelegate
                    height: votechoiceLoader.implicitHeight
                    width: parent.width
                    Loader {
                        id: votechoiceLoader
                        sourceComponent: multipleChoice ? votecheckboxComponent : voteradioComponent
                        Component {
                            id: votecheckboxComponent
                            CheckBox {
                                id: voteCheckBox
                                width: voteOptionsListView.width
                                text: model.answerTitle
                                onCheckedChanged: model.checked = checked
                            }
                        }
                        Component {
                            id: voteradioComponent
                            RadioButton {
                                id: voteRadioButton
                                text: model.answerTitle
                                width: voteOptionsListView.width
                                ButtonGroup.group: optionButtonGroup
                                onCheckedChanged: model.checked = checked
                            }
                        }
                    }
                }
            }

        }

        Button {
            id: submitVoteButton
            icon.source: MMPTheme.themeSelect("qrc:/resources/icons/buttons/ic_btn_vote_light.svg", "qrc:/resources/icons/buttons/ic_btn_vote_dark.svg")
            text: qsTr("Vote")
            onPressed: {
                //TODO: Send vote and show confirmation
                window.close()
            }
            anchors {
                bottom: parent.bottom
                right: parent.right
                margins: 10
            }
        }
    }
}
