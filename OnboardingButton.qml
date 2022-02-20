import QtQuick 2.15
import QtQuick.Controls 2.15
import MMPTheme 1.0

Button {
    id: control
    horizontalPadding: 10
    background: Rectangle {
        implicitWidth: 110
        implicitHeight: 40
        radius: height/2
        color: MMPTheme.translucent(MMPTheme.cWhite, 0.3)
        border.color: MMPTheme.translucent(MMPTheme.cWhite, control.hovered ? 1 : 0.7)
    }
    contentItem: Text {
        text: control.text
        color: MMPTheme.translucent(MMPTheme.cWhite, control.hovered ? 1 : 0.8)
        font.pixelSize: 14
        font.weight: Font.Medium
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
}
