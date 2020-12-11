import QtQuick 2.0
import MMPTheme 1.0
Rectangle {
    id: latestPollsPanel
    property int sideBodyMargin: 20
    color: MMPTheme.bodyColor
    radius: 4

    PanelTitle {
        id: latestPollTitle
        text: "Latest Polls"
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
            topMargin: topBodyMargin
            leftMargin: sideBodyMargin
            rightMargin: sideBodyMargin
        }
    }

    ListView {
        id: recentPollList
        anchors {
            top: latestPollTitle.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            topMargin: topBodyMargin
            leftMargin: sideBodyMargin
            rightMargin: sideBodyMargin
            bottomMargin: bottomBodyMargin
        }
        clip: true
        spacing: 5
        interactive: false

        model: PollModel{}
        delegate: Item {
            id: pollWrapper
            property bool current: new Date(expires*1000) > MMPTheme.currentTime
            height: pollItemTitle.height
            Circle {
                id: pollItemCircle
                radius: 2
                color: current ? MMPTheme.textColor : "transparent"
                border.color: current ? MMPTheme.textColor : MMPTheme.lightTextColor
                anchors.verticalCenter: parent.verticalCenter
            }

            Text {
                id: pollItemTitle
                text: title
                color: pollItemCircle.border.color
                font.weight: current ? Font.Medium : Font.Normal
                font.pointSize: 12
                anchors.left: pollItemCircle.right
                anchors.verticalCenter: pollItemCircle.verticalCenter
                anchors.leftMargin: 4
            }
        }
    }
}
