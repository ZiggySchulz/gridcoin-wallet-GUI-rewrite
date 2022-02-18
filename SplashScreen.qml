import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import MMPTheme 1.0

Window {
    id: splashScreen
    width: 400
    height: 200
    flags: Qt.SplashScreen | Qt.FramelessWindowHint
    visible: true
    color: "transparent"
    signal loaded
    Rectangle {
        id: background
        anchors.fill: parent
        border.color: "transparent"
        radius: 4
        gradient: Gradient {
            orientation: MMPTheme.isLightTheme ? Gradient.Vertical : Gradient.Horizontal
            GradientStop { position: 0; color: MMPTheme.themeSelect(MMPTheme.cWhite, "#465360") }
            GradientStop { position: 1; color: MMPTheme.themeSelect(MMPTheme.cLilyWhite, "#2c3540") }
        }
    }
    Timer {
        interval: 2000
        running: false
        onTriggered: opacityAnimation.start()
    }
    Timer {
        interval: 10
        running: true
        repeat: true
        onTriggered: {
            blockProgressBar.value += 0.003
            if (blockProgressBar.value>= 1) {
                running=false
                opacityAnimation.start()
            }
        }
    }
    function openMainWindow() {
//        var component = Qt.createComponent("MainWindow.qml")
//        var windowObj = component.createObject(splashScreen.parent, {opacity: 0})
//        windowObj.opacity = 1
        loaded()
        splashScreen.close()
    }
    NumberAnimation {
        id: opacityAnimation
        target: splashScreen
        properties: "opacity"
        duration: 1000
        from: 1
        to: 0
        running: false
        onFinished: openMainWindow()
    }
    ProgressBar {
        id: blockProgressBar
        value: 0
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        background: Item{}
        contentItem: Item {
            implicitWidth: 200
            implicitHeight: 4
            Rectangle {
                id: mainBarRect
                width: blockProgressBar.visualPosition * parent.width
                height: 2
                color: MMPTheme.highlightColor
            }
            Rectangle {
                width: blockProgressBar.visualPosition * parent.width
                height: parent.height
                color: MMPTheme.highlightColor
                radius: 4
            }
            Rectangle {
                width: 4
                height: parent.height
                anchors.right: mainBarRect.right
                color: MMPTheme.highlightColor
                visible: blockProgressBar.value<0.99
            }
        }
    }
    Image {
        id: logo
        source: "qrc:/resources/icons/logos/ic_logo_app_gradient_white.svg"
        sourceSize: Qt.size(80, 80)
        anchors {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
            topMargin: 30
        }
    }
    Text {
        id: gridcoinText
        text: qsTr("Gridcoin")
        color: MMPTheme.themeSelect("#4e2fad", MMPTheme.cWhite)
        font.pixelSize: 34
        font.weight: Font.Bold
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: logo.bottom
            topMargin: 5
        }
    }
}
