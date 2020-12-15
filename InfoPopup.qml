import QtQuick 2.12
import QtQuick.Controls 2.15
import QtQuick.Shapes 1.15
import QtGraphicalEffects 1.15
import MMPTheme 1.0
ToolTip {
    id: main
    delay: 200
    contentWidth: infoTextItem.implicitWidth
    contentHeight: infoTextItem.implicitHeight
    verticalPadding: 1
    horizontalPadding: 3
    property alias infoText: infoTextItem.text
    background: Item {
        id: background
        DropShadow {
            id: rightShadow
            anchors.fill: backgroundRect
            horizontalOffset: 2
            verticalOffset: 2
            radius: 5
            samples: 2*radius+1
            cached: true
            source: backgroundRect
            color: "#44000000"
        }
        DropShadow {
            id: leftShadow
            anchors.fill: backgroundRect
            horizontalOffset: -2
            verticalOffset: 2
            radius: 5
            samples: 2*radius+1
            cached: true
            source: backgroundRect
            color: "#44000000"
        }
        Rectangle {
            id: backgroundRect
            color: MMPTheme.bodyColor
            radius: 4
            border.color: MMPTheme.translucent(MMPTheme.themeSelect(MMPTheme.cLilyWhite,MMPTheme.cOxfordOffBlue), 1)
            border.width: 1
            anchors.fill: parent
        }


    }
    contentItem:
        Text {
            id: infoTextItem
            font.pixelSize: 11
            wrapMode: Text.WordWrap
            textFormat: Text.RichText
            color: MMPTheme.lightTextColor
            //horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter

        }
}
