import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15
import MMPTheme 1.0
Button {
    id: buttonMain
    property alias imagePath: img.source
    property alias labelText: label.text
    property int svgScale: 50
    property bool current: false
    implicitWidth: col.implicitWidth
    implicitHeight: col.implicitHeight
    background: Column {
        id: col
        property int topPad: 10
        property int midPad: 3
        property int botPad: 3
        //anchors.fill: parent
        height: parent.height
        width: parent.width
        anchors.centerIn: parent
        Item {
            //id: topPadding
            height: parent.topPad
            width: parent.width
        }
        Item {
            //id: buttonIcon
            width: parent.width
            height: parent.height-label.height-col.topPad-col.midPad-col.botPad
            Image {
                id: img
                width: parent.width
                height: parent.height
                sourceSize: Qt.size(width,height)
                fillMode: Image.PreserveAspectFit
            }
            ColorOverlay {
                anchors.fill: img
                source: img
                color: {
                    if (current) {
                        return MMPTheme.themeSelect(MMPTheme.cWhite, MMPTheme.cHavelockBlue)
                    } else {
                        return MMPTheme.themeSelect("#c3b2d2", "#babec1")
                    }
                }
            }
        }

        Item {
            //id: midPadding
            height: parent.midPad
            width: parent.width
        }
        Text {
            id: label
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            font: MMPTheme.font
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.Wrap

            color: {
                if (current) {
                    return MMPTheme.themeSelect(MMPTheme.cWhite, MMPTheme.cHavelockBlue)
                } else {
                    return MMPTheme.translucent(MMPTheme.cWhite, 0.7)
                }
            }
        }
        Item {
            //id: bottomPadding
            height: parent.botPad
            width: parent.width
        }
    }
}
