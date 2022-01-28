import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import MMPTheme 1.0

Window {
    id: window
    title: qsTr("Create Poll")
    width: 700
    height: 600
    minimumWidth: 480
    minimumHeight: 450
    flags: Qt.Dialog
    Shortcut {
        sequence: StandardKey.Close
        onActivated: window.close()
    }

    StackView {
        id: stackView
        initialItem: pollChoiceView
        anchors.fill: parent
        onCurrentItemChanged: {
            if (currentItem.defaultFocusItem) currentItem.defaultFocusItem.forceActiveFocus()
        }
    }

    Component {
        id: pollChoiceView
        Rectangle {
            id: choiceBackground
            color: MMPTheme.backgroundColor
            property Item defaultFocusItem: pollTypeComboBox
            Rectangle {
                id: choiceBody
                color: MMPTheme.bodyColor
                radius: 4
                anchors {
                    top: parent.top
                    bottom: nextButton.top
                    left: parent.left
                    right: parent.right
                    margins: 10
                }
                ScrollView {
                    id: contentScrollView
                    anchors.fill: parent
                    clip: true
                    contentWidth: availableWidth
                    contentHeight: createPollTitleLabel.implicitHeight + createPollTitleLabel.anchors.topMargin +
                                   communityGuidelinesLabel.implicitHeight + communityGuidelinesLabel.anchors.topMargin +
                                   guidelinesLink.implicitHeight + guidelinesLink.anchors.topMargin +
                                   separator.height + separator.anchors.topMargin +
                                   pollTypeLabel.implicitHeight + pollTypeLabel.anchors.topMargin +
                                   pollTypeDescription.implicitHeight + pollTypeDescription.anchors.topMargin +
                                   pollRequirementLabel.implicitHeight + pollRequirementLabel.anchors.topMargin

                    Text {
                        id: createPollTitleLabel
                        text: qsTr("Create a poll")
                        color: MMPTheme.textColor
                        font.weight: Font.DemiBold
                        font.pixelSize: 15
                        clip: true
                        anchors {
                            top: parent.top
                            left: parent.left
                            leftMargin: 30
                            topMargin: 20
                        }
                    }
                    Text {
                        id: communityGuidelinesLabel
                        text: qsTr("The Gridcoin community established guidelines for polls with requirements for each type. Please read the wiki for more information:")
                        color: MMPTheme.textColor
                        wrapMode: Text.WordWrap
                        anchors {
                            top: createPollTitleLabel.bottom
                            left: createPollTitleLabel.left
                            right: parent.right
                            topMargin: 20
                            rightMargin: 20

                        }
                    }
                    ClickableLink {
                        id: guidelinesLink
                        urlString: "https://gridcoin.us/wiki/voting.html"
                        anchors {
                            top: communityGuidelinesLabel.bottom
                            left: communityGuidelinesLabel.left
                            topMargin: 10
                        }
                    }
                    Rectangle {
                        id: separator
                        height: 1
                        color: MMPTheme.separatorColor
                        anchors {
                            top: guidelinesLink.bottom
                            left: parent.left
                            right: parent.right
                            leftMargin: 30
                            rightMargin: 30
                            topMargin: 20
                        }
                    }
                    Text {
                        id: pollTypeLabel
                        text: qsTr("Poll Type:")
                        color: MMPTheme.textColor
                        anchors {
                            top: separator.bottom
                            left: separator.left
                            topMargin: 20
                        }
                    }
                    ComboBox {
                        id: pollTypeComboBox
                        focus: true
                        Component.onCompleted: forceActiveFocus()
                        KeyNavigation.tab: nextButton
                        model: [qsTr("Project Listing"), qsTr("Protocol Development"), qsTr("Governance"), "Marketing", "Outreach", "Community", "Survey"]
                        anchors {
                            left: pollTypeLabel.right
                            leftMargin: 10
                            verticalCenter: pollTypeLabel.verticalCenter
                        }
                    }
                    Text {
                        id: pollTypeDescription
                        color: MMPTheme.textColor
                        wrapMode: Text.WordWrap
                        anchors {
                            top: pollTypeLabel.bottom
                            left: parent.left
                            right: parent.right
                            leftMargin: 30
                            rightMargin: 30
                            topMargin: 20
                        }
                        text: {
                            switch (pollTypeComboBox.currentIndex) {
                            case 0:
                                return qsTr("Polls to remove or add projects to the whitelist. For an overview of the process that must be completed beforehand to add a project, please view the whitelist process wiki page. For the removal of a project, there must be an attempt at contact with the project admin before making the poll.")
                            case 1:
                                return qsTr("Development polls are for changing some parts of Gridcoin at a protocol level. For instance changing the amounts for rewards would be a development poll.")
                            case 2:
                                return qsTr("Mostly for changing the requirements of the polls. Defined in the currently voted in standard as “any proposal which seeks to modify the management or organizational structure of Gridcoin.”")
                            case 3:
                                return qsTr("Polls that propose marketing initiatives. For instance could be a plan to run an ad.")
                            case 4:
                                return qsTr("Polls about community outreach, representation, etc. Can be proactively trying to reach out to new places or keep up relations. Can also be retroactive to reimburse outreach as well.")
                            case 5:
                                return qsTr("Proposals or initiatives related to the Gridcoin community, but not to the other poll types.")
                            case 6:
                                return qsTr("These polls are non-binding so they don’t have any particular requirements. They can be specific or can focus on the broader picture. They can also be used to gauge community interest on something for development before more work is put in.")
                            default:
                                return ""
                            }
                        }
                    }
                    Text {
                        id: pollRequirementLabel
                        color: MMPTheme.textColor
                        wrapMode: Text.WordWrap
                        anchors {
                            top: pollTypeDescription.bottom
                            left: parent.left
                            right: parent.right
                            bottom: parent.bottom
                            leftMargin: 30
                            rightMargin: 30
                            topMargin: 10
                        }
                        text: {
                            switch (pollTypeComboBox.currentIndex) {
                            case 0:
                                return qsTr(
                                            "<p>Whitelist polls to add a project must have a project that meets the following criteria:</p>
        <ul>
        <li>Project Work Availability Score is green</li>
        <li>Number of Zero Credit Days is less than or equal to 7 out of the last 20 days</li>
        <li>The project has a clear description of the work and the work is as described</li>
        <li>The project allows new user registration</li>
        <li>Project complies with the BOINC terms of service</li>
        <li>All crunchers that comply with the terms of service of both BOINC and the project have equal access to work units</li>
        </ul>
        <p>Additionally, before a poll is made to whitelist there must be:</p>
        <ul>
        <li>Direct contact with a project administrator</li>
        <li>An affirmative public response to whitelisting by a project administrator</li>
        <li>An agreed add date with both the Gridcoin whitelist administrator and project admin</li>
        </ul>
        <p>Whitelist polls have a minimum duration of 3 weeks (21 days) and require an
        AVW of 40% or more</p>"
                                            )
                            case 1:
                                return qsTr("These types of polls require a minimum duration of 6 weeks (42 days) and development polls require an AVW of more than 50% to pass.")
                            case 2:
                                return qsTr("Governance polls require a minium duration of 3 weeks (21 days) and an AVW of 20% or more to pass")
                            case 3:
                                return qsTr("Marketing polls require a minimum duration of 3 weeks (21 days) and an AWV of 40% or more to pass")
                            case 4:
                                return qsTr("Outreach polls require a minimum duration of 3 weeks (21 days) and an AVW of 40% or more to pass")
                            case 5:
                                return qsTr("Requires a minimum duration of 3 weeks (21 days) and an AVW of 10% or more to pass")
                            case 6:
                            default:
                                return ""
                            }
                        }
                    }
                }
            }
            Button {
                id: nextButton
                text: qsTr("Next")
                icon.source: MMPTheme.themeSelect("/resources/icons/generic/ic_chevron_right_light.svg", "/resources/icons/generic/ic_chevron_right_dark.svg")
                onClicked: activate()
                Keys.onEnterPressed: activate()
                Keys.onReturnPressed: activate()
                KeyNavigation.tab: pollTypeComboBox
                function activate () {
                    var minPollLength
                    var weightTypeVal   //0: Balance, 1: Mag+Bal
                    var responseTypeVal //0: Y/N/Abs, 1: Single Choice, 2: Multiple Choice
                    switch (pollTypeComboBox.currentIndex){
                    case 0: //Project Listing
                        //                        stackView.push(ProjectSelectionVIew)
                        return
                    case 1: //Protocol Development
                        minPollLength = 42
                        weightTypeVal = 1
                        break
                    case 2: //Governance
                    case 3: //Marketing
                    case 4: //Outreach
                    case 5: //Community
                        minPollLength = 21
                        weightTypeVal = 1
                        break;
                    case 6: //Survey
                    default:
                        break
                    }
                    stackView.push(pollCreationDetailView, {pollTypeString: pollTypeComboBox.currentText, minimumPollLength: minPollLength, weightType: weightTypeVal, responseType: responseTypeVal})
                }
                anchors {
                    bottom: parent.bottom
                    right: parent.right
                    margins: 10
                }
            }
        }
    }

    Component {
        id: pollCreationDetailView
        Rectangle {
            id: detailBackground
            color: MMPTheme.backgroundColor
            property Item defaultFocusItem: durationSpinbox
            property string pollTypeString: "Default"
            property string pollTitle
            property int minimumPollLength
            property int weightType
            property int responseType

            Rectangle {
                id: detailBody
                color: MMPTheme.bodyColor
                radius: 4
                clip: true
                anchors {
                    top: parent.top
                    bottom: createPollButton.top
                    left: parent.left
                    right: parent.right
                    margins: 10
                }
                ScrollView {
                    id: contentScrollView
                    anchors.fill: parent
                    clip: true
                    contentWidth: availableWidth
                    contentHeight: createPollTitleLabel.implicitHeight + createPollTitleLabel.anchors.topMargin +
                                   separator.implicitHeight + separator.anchors.topMargin +
                                   formGrid.implicitHeight + formGrid.anchors.topMargin +
                                   20


                    Text {
                        id: createPollTitleLabel
                        text: qsTr("Poll Details")
                        color: MMPTheme.textColor
                        font.weight: Font.DemiBold
                        font.pixelSize: 15
                        clip: true
                        anchors {
                            top: parent.top
                            left: parent.left
                            leftMargin: 30
                            topMargin: 20
                        }
                    }
                    Rectangle {
                        id: separator
                        height: 1
                        color: MMPTheme.separatorColor
                        anchors {
                            top: createPollTitleLabel.bottom
                            left: parent.left
                            right: parent.right
                            leftMargin: 30
                            rightMargin: 30
                            topMargin: 20
                        }
                    }
                    GridLayout {
                        id: formGrid
                        rowSpacing: 20
                        columnSpacing: 20
                        columns: 2
                        anchors {
                            top: separator.bottom
                            left: parent.left
                            right: parent.right
                            leftMargin: 30
                            rightMargin: 30
                            topMargin: 20
                        }
                        Text {
                            id: lockedFieldsLabel
                            color: MMPTheme.highlightColor
                            visible: pollTitle || weightType || responseType
                            Layout.columnSpan: 2
                            text: qsTr("Some fields are locked for the selected poll type")
                            wrapMode: Text.WordWrap
                        }
                        Text {
                            id: pollTypeLabel
                            text: qsTr("Poll Type:")
                            color: MMPTheme.textColor
                        }
                        Item {
                            id: pollTypeDurationItem
                            height: pollTypeBackgroundRect.height
                            Layout.fillWidth: true
                            Rectangle {
                                id: pollTypeBackgroundRect
                                color: MMPTheme.lightTextColor
                                height: pollTypeDataLabel.implicitHeight + 12
                                width: pollTypeDataLabel.implicitWidth + 20
                                radius: 4
                                anchors {
                                    left: parent.left
                                    verticalCenter: parent.verticalCenter
                                }
                                Text {
                                    id: pollTypeDataLabel
                                    text: pollTypeString
                                    font.weight: Font.DemiBold
                                    color: MMPTheme.themeSelect(MMPTheme.cWhite, "#161b24")
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    anchors.fill: parent
                                }
                            }
                            SpinBox {
                                id: durationSpinbox
                                width: 60
                                value: minimumPollLength ? minimumPollLength : 21
                                from: minimumPollLength ? minimumPollLength : 1
                                to: 90
                                editable: true
                                anchors {
                                    right: parent.right
                                    verticalCenter: parent.verticalCenter
                                }
                            }
                            Text {
                                id: durationLabel
                                text: qsTr("Duration (days):")
                                color: MMPTheme.textColor
                                elide: Text.ElideRight
                                horizontalAlignment: Text.AlignRight
                                anchors {
                                    right: durationSpinbox.left
                                    rightMargin: 10
                                    left: pollTypeBackgroundRect.right
                                    leftMargin: 10
                                    verticalCenter: parent.verticalCenter
                                }
                            }
                        }
                        Text {
                            id: titleLabel
                            text: qsTr("Title: ")
                            color: MMPTheme.textColor
                        }
                        TextField {
                            id: titleTextEdit
                            text: pollTitle ? pollTitle : ""
                            Layout.fillWidth: true
                        }
                        Text {
                            id: questionLabel
                            text: qsTr("Question:")
                            color: MMPTheme.textColor
                        }
                        TextField {
                            id: questionTextField
                            Layout.fillWidth: true
                        }
                        Text {
                            id: discussionURLLabel
                            text: qsTr("Discussion URL:")
                            color: MMPTheme.textColor
                        }
                        TextField {
                            id: discussionURLTextField
                            Layout.fillWidth: true
                            KeyNavigation.tab: weightTypeComboBox
                        }
                        Text {
                            id: weightTypeLabel
                            text: qsTr("Weight Type:")
                            color: MMPTheme.textColor
                        }
                        ComboBox {
                            id: weightTypeComboBox
                            currentIndex: weightType ? weightType : 0
                            enabled: !weightType
                            model: [qsTr("Balance"), qsTr("Magnitude + Balance")]
                            KeyNavigation.tab: responseTypeComboBox
                        }
                        Text {
                            id: responseTypeLabel
                            text: qsTr("Response Type:")
                            color: MMPTheme.textColor
                        }
                        ComboBox {
                            id: responseTypeComboBox
                            currentIndex: responseType ? responseType : 0
                            enabled: !responseType
                            model: [qsTr("Yes/No/Abstain"), qsTr("Single Choice"), qsTr("Multiple Choice")]
                            KeyNavigation.tab: backButton
                        }
                        Text {
                            id: choicesLabel
                            Layout.alignment: Qt.AlignTop
                            text: qsTr("Choices:")
                            color: MMPTheme.textColor
                            visible: responseTypeComboBox.currentIndex != 0
                        }
                        Rectangle {
                            id: choicesListRect
                            Layout.fillWidth: true
                            implicitHeight: Math.max(27+25*choicesListView.count, 102)
                            color: MMPTheme.themeSelect(MMPTheme.cWhite, "#17222c")
                            //                        border.color: MMPTheme.themeSelect("#c3c7ce", "#3b475d")
                            border.color: MMPTheme.lightBorderColor
                            radius: 4
                            visible: responseTypeComboBox.currentIndex != 0
                            ListView {
                                id: choicesListView
                                clip: true
                                currentIndex: 0
                                interactive: false
                                ScrollIndicator.vertical: ScrollIndicator {
                                    parent: choicesListView.parent
                                    anchors {
                                        top: choicesListView.top
                                        bottom: choicesListView.bottom
                                        right: choicesListView.right
                                        rightMargin: 1
                                    }
                                }
                                anchors {
                                    top: parent.top
                                    left: parent.left
                                    right: parent.right
                                    bottom: tableFooterRect.top
                                    leftMargin: 1
                                    rightMargin: 1
                                    topMargin: 1
                                }
                                model: ListModel{
                                    id: choicesListModel
                                    ListElement{choiceText: ""}
                                    ListElement{choiceText: ""}
                                }
                                delegate: MouseArea {
                                    width: choicesListView.width
                                    height: 25
                                    onClicked: choicesListView.currentIndex=index
                                    Rectangle {
                                        anchors.fill: parent
                                        color: choicesListView.currentIndex===index ? MMPTheme.themeSelect(MMPTheme.cFrostWhite, "#212c3b") : "transparent"
                                        radius: 4
                                        RowLayout {
                                            spacing: 10
                                            anchors {
                                                fill: parent
                                                leftMargin: 10
                                                rightMargin: 10
                                            }
                                            Text {
                                                id: choiceNumberLabel
                                                height: parent.height
                                                Layout.preferredWidth: 10
                                                Layout.alignment: Qt.AlignVCenter
                                                text: (index + 1) + "."
                                                color: MMPTheme.textColor
                                                horizontalAlignment: Text.AlignHCenter
                                                verticalAlignment: Text.AlignVCenter
                                            }
                                            TextField {
                                                id: choiceTextEdit
                                                Layout.preferredHeight: parent.height - 3
                                                Layout.fillWidth: true
                                                Layout.alignment: Qt.AlignVCenter
                                                placeholderText: qsTr("Poll Answer")
                                                color: MMPTheme.textColor
                                                verticalAlignment: Text.AlignVCenter
                                                selectByMouse: true
                                                onFocusChanged: {
                                                    if (focus){
                                                        choicesListView.currentIndex=index
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }

                            Rectangle {
                                id: tableFooterRect
                                x:1
                                height: 25
                                width: parent.width-2
                                radius: parent.radius
                                anchors {
                                    bottom: parent.bottom
                                    bottomMargin: 1
                                }
                                gradient: Gradient {
                                    GradientStop { position: 0; color: MMPTheme.themeSelect(MMPTheme.cWhite, MMPTheme.cMirage)}
                                    GradientStop { position: 1; color: MMPTheme.themeSelect(MMPTheme.cLilyWhite, MMPTheme.cMirage)}
                                }
                                Rectangle {
                                    id: borderTopRect
                                    width: parent.width
                                    height: 1
                                    color: choicesListRect.border.color
                                }

                                RowLayout {
                                    id: buttonRow
                                    height: parent.height
                                    spacing: 0
                                    Button {
                                        id: addChoiceButton
                                        Layout.fillHeight: true
                                        implicitWidth: 30
                                        icon.source: MMPTheme.themeSelect("/resources/icons/buttons/ic_btn_add_light.svg","/resources/icons/buttons/ic_btn_add_dark.svg")
                                        background: Item{}
                                        onClicked: choicesListModel.append({})
                                    }
                                    Rectangle {
                                        id: buttonSeparator
                                        color: MMPTheme.lightBorderColor
                                        width: 1
                                        Layout.fillHeight: true
                                    }
                                    Button {
                                        id: removeChoiceButton
                                        Layout.fillHeight: true
                                        implicitWidth: 30
                                        icon.source: MMPTheme.themeSelect("/resources/icons/buttons/ic_btn_remove_light.svg","/resources/icons/buttons/ic_btn_remove_dark.svg")
                                        background: Item{}
                                        onClicked: choicesListModel.remove(choicesListView.currentIndex)
                                    }
                                    Rectangle {
                                        id: buttonSeparator2
                                        color: MMPTheme.lightBorderColor
                                        width: 1
                                        Layout.fillHeight: true
                                    }
                                }
                            }
                        }
                    }
                }
            }
            Button {
                id: createPollButton
                text: qsTr("Create Poll")
                icon.source: MMPTheme.themeSelect("/resources/icons/buttons/ic_btn_create_light.svg", "/resources/icons/buttons/ic_btn_create_dark.svg")
                KeyNavigation.tab: durationSpinbox
                anchors {
                    bottom: parent.bottom
                    right: parent.right
                    margins: 10
                }
            }
            Button {
                id: backButton
                text: qsTr("Back")
                onClicked: stackView.pop()
                icon.source: MMPTheme.themeSelect("/resources/icons/generic/ic_chevron_left_light.svg", "/resources/icons/generic/ic_chevron_left_dark.svg")
                KeyNavigation.tab: createPollButton
                anchors {
                    bottom: parent.bottom
                    right: createPollButton.left
                    margins: 10
                }
            }
        }
    }
}
