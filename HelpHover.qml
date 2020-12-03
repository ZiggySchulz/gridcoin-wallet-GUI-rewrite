import QtQuick 2.0

MouseArea {
    id: helpHoverMouseArea
    property alias iconSize: helpIcon.maxSize
    property alias text: popup.infoText
    property alias imageSource: helpIcon.source
    property alias popupWidth: popup.width
    implicitWidth: helpIcon.implicitWidth
    implicitHeight: helpIcon.implicitHeight
    hoverEnabled: true

    Svg {
        id: helpIcon
        source: "resources/Icons/Generic/ic_help.svg"
        maxSize: 15
    }

    InfoPopup {
        id: popup
        visible: helpHoverMouseArea.containsMouse
        y: helpIcon.height + 5
        x: -width/2+helpIcon.width/2
    }

}
