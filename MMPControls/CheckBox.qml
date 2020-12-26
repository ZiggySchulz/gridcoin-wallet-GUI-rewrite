import QtQuick 2.15
import QtQuick.Templates 2.15 as T
import QtQuick.Controls 2.15
import QtQuick.Controls.impl 2.15
import MMPTheme 1.0

// TODO Consider adding check.down indicators
T.CheckBox {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding,
                             implicitIndicatorHeight + topPadding + bottomPadding)
    //padding: 6
    spacing: 5

    property bool active: visualFocus || hovered

    indicator: Rectangle {
        implicitWidth: 16
        implicitHeight: 16

        x: control.text ? (control.mirrored ? control.width - width - control.rightPadding : control.leftPadding) : control.leftPadding + (control.availableWidth - width) / 2
        y: control.topPadding + (control.availableHeight - height) / 2

        color: MMPTheme.themeSelect(MMPTheme.translucent(MMPTheme.cBluePurple, 0.7), MMPTheme.cHavelockBlue)

        border.width: 1
        border.color: MMPTheme.translucent(
                          control.checked ? MMPTheme.themeSelect(MMPTheme.cBluePurple, MMPTheme.cOxfordBlue): MMPTheme.cOxfordBlue,
                          control.checked ? control.active ? 1.0 : 0.8 : control.active ? 0.7 : 0.3)
        radius: 4

        Image {
            x: (parent.width - width) / 2
            y: (parent.height - height) / 2
            source: "qrc:/resources/icons/generic/ic_checkbox_tick.svg"
            visible: control.checked
            sourceSize: Qt.size(15, 15)
        }

        property Gradient backgroundGradient: Gradient {
            orientation: Gradient.Vertical
            GradientStop { position: 0; color: control.active ? MMPTheme.cLilyWhite : MMPTheme.cWhite }
            GradientStop { position: 1; color: control.active ? MMPTheme.cWhite : MMPTheme.cLilyWhite }
        }

        gradient: !control.checked ? backgroundGradient : null
    }

    contentItem: CheckLabel {
        leftPadding: control.indicator && !control.mirrored ? control.indicator.width + control.spacing : 0
        rightPadding: control.indicator && control.mirrored ? control.indicator.width + control.spacing : 0

        text: control.text
        font: MMPTheme.font
        color: MMPTheme.textColor
    }
}
