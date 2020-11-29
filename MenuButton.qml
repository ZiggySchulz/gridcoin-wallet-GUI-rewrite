import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Button {
    id: buttonMain
    property alias imagePath: img.source
    property alias labelText: label.text
    property int topPad: 12
    property int midPad: 0
    property int botPad: 5
    property int svgScale: 50
    property string windowIdentifier: ""
    implicitWidth: col.implicitWidth
    implicitHeight: col.implicitHeight
    onClicked: menuButtonClicked(windowIdentifier)
    background:
        ColumnLayout {
            anchors.fill: parent
            id: col

            Svg {
                id: img
                fillMode: Image.PreserveAspectFit
                smooth: true
                Layout.preferredWidth: parent.width
                Layout.preferredHeight: parent.height-label.height-topPad-midPad-botPad
                Layout.topMargin: topPad
                Layout.bottomMargin: midPad
            }

            Text {
                id: label
                text: ""
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.WordWrap
                Layout.alignment: Qt.AlignHCenter
                Layout.bottomMargin: botPad
            }
        }
}
