import QtQuick 2.12
import QtQuick.Controls 2.15
import QtQuick.Shapes 1.15
import QtGraphicalEffects 1.15
ToolTip {
    id: main
    delay: 200
    width: 300
    height: infoTextItem.implicitHeight
    property alias infoText: infoTextItem.text
    background: Item {
        id: background
        DropShadow {
            id: rightShadow
            anchors.fill: backgroundRect
            horizontalOffset: 2
            verticalOffset: 2
            radius: 3
            samples: 2*radius+1
            cached: true
            source: backgroundRect
            color: "#22000000"
        }
        DropShadow {
            id: leftShadow
            anchors.fill: backgroundRect
            horizontalOffset: -2
            verticalOffset: 2
            radius: 3
            samples: 2*radius+1
            cached: true
            source: backgroundRect
            color: "#22000000"
        }
        Rectangle {
            id: backgroundRect
            color: "#FBFBFB"
            radius: 4
            border.color: "#BFBFBF"
            border.width: 1
            anchors.fill: parent
        }


    }
    contentItem:
        Text {
            id: infoTextItem
            width: parent.width-20
            font.pointSize: 11
            anchors {
                top: parent.top
                horizontalCenter: parent.horizontalCenter
                topMargin: 10
            }
            wrapMode: Text.WordWrap
            textFormat: Text.RichText
            color: "#5c5f65"

        }
}
