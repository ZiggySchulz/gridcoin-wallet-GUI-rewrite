import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import MMPTheme 1.0

Window {
    id: window
    title: qsTr("Create Poll")
    width: 700
    height: 600
    minimumWidth: 450
    minimumHeight: 250
    flags: Qt.Dialog

    Shortcut {
        sequence: StandardKey.Close
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
                bottom: nextButton.top
                left: parent.left
                right: parent.right
                margins: 10
            }
            ScrollView {
                id: contentScrollView
                anchors.fill: parent
                clip: true
                focus: true
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
            anchors {
                bottom: parent.bottom
                right: parent.right
                margins: 10
            }
        }
    }
}
