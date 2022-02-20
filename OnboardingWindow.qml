import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import MMPTheme 1.0
import QtGraphicalEffects 1.15

Window {
    id: window
    flags: Qt.FramelessWindowHint
    height: 640
    width: 720
    visible: true
    color: "transparent"
    Rectangle {
        id: background
        anchors.fill: parent
        border.color: "transparent"
        radius: 4
        LinearGradient {
            id: backgroundGradient
            anchors.fill: parent
            source: background
            cached: true
            start: Qt.point(0, 0)
            end: Qt.point(width, height)
            gradient: Gradient {
                GradientStop { position: 0.1; color: "#c76dd7" }
                GradientStop { position: 1.0; color: "#3324ae" }
            }
        }
        StackView {
            id: stackView
            initialItem: welcomeView
            anchors.fill: parent
        }
    }

    Component {
        id: welcomeView
        Item {
            Image {
                id: logoImage
                source: "qrc:/resources/icons/logos/ic_logo_app_gradient_white.svg"
                sourceSize: Qt.size(120, 120)
                Layout.alignment: Qt.AlignHCenter
                anchors {
                    top: parent.top
                    horizontalCenter: parent.horizontalCenter
                    topMargin: 40
                }
            }
            ColumnLayout {
                id: welcomeInfoColumnLayout
                spacing: 20
                anchors {
                    top: logoImage.bottom
                    left: parent.left
                    right: parent.right
                    margins: 50
                    topMargin: 30
                }
                Text {
                    id: welcomeText
                    text: qsTr("Welcome to Gridcoin!")
                    color: MMPTheme.cWhite
                    font.pixelSize: 24
                    font.weight: Font.Medium
                    Layout.alignment: Qt.AlignHCenter
                }
                Text {
                    color: MMPTheme.cWhite
                    text: qsTr("The next few screens will guide you through the setup of your Gridcoin wallet.")
                    font.pixelSize: 15
                    Layout.alignment: Qt.AlignHCenter
                }
                Text {
                    id: gridcoinInfoText
                    color: MMPTheme.translucent(MMPTheme.cWhite, 0.6)
                    wrapMode: Text.WordWrap
                    Layout.fillWidth: true
                    font.pixelSize: 14
                    text: qsTr(
"Gridcoin was offically launched in 2013. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam quis velit in arcu ullamcorper placerat. Nullam mattis tempor mi, vitae suscipit sapien. Phasellus convallis porta ante vel ullamcorper. Fusce lobortis fermentum dolor non gravida. Ut placerat lacus ac ante venenatis ornare.

Morbi nec sollicitudin leo. In hac habitasse platea dictumst. Nunc id ultricies dui, sed porta purus. Phasellus condimentum feugiat orci id blandit. Phasellus vitae mi sit amet lacus facilisis fringilla vel non nisi. Proin et diam vel orci dictum scelerisque. Ut ultricies elit quis dolor condimentum volutpat. Sed a nisl nulla. Mauris tincidunt ultricies mi, quis pulvinar purus rutrum eget. Duis porta erat a tincidunt pretium.

Etiam convallis lectus magna, quis scelerisque augue dapibus sit amet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer et est porttitor, tempor sem et, varius sapien. Etiam faucibus justo non sollicitudin gravida. In in ullamcorper eros, et cursus odio. Proin non fermentum nibh.
")
                }
            }
            Item {
                id: buttonRow
                height: exitButton.implicitHeight
                anchors {
                    bottom: parent.bottom
                    left: parent.left
                    right: parent.right
                    margins: 40
                    bottomMargin: 30
                }
                OnboardingButton {
                    id: exitButton
                    text: qsTr("Exit")
                    onPressed: Qt.quit()
                    anchors.left: parent.left
                }
                OnboardingPageIndicator {
                    currentPage: 1
                    anchors.centerIn: parent
                }

                OnboardingButton {
                    id: continueButton
                    text: qsTr("Continue")
                    anchors.right: parent.right
                    focus: true
                    onPressed: stackView.push(participationView)
                }
            }
        }
    }
    Component {
        id: participationView
        Item {
            Image {
                id: logoImage
                source: "qrc:/resources/icons/logos/ic_logo_app_gradient_white.svg"
                sourceSize: Qt.size(120, 120)
                Layout.alignment: Qt.AlignHCenter
                anchors {
                    top: parent.top
                    horizontalCenter: parent.horizontalCenter
                    topMargin: 40
                }
            }
            Text {
                id: participateText
                text: qsTr("How would you like to participate?")
                color: MMPTheme.cWhite
                font.pixelSize: 24
                font.weight: Font.Medium
                anchors {
                    top: logoImage.bottom
                    horizontalCenter: parent.horizontalCenter
                    topMargin: 30
                }
            }
            Item {
                id: buttonRow
                height: backButton.implicitHeight
                anchors {
                    bottom: parent.bottom
                    left: parent.left
                    right: parent.right
                    margins: 40
                    bottomMargin: 30
                }
                OnboardingButton {
                    id: backButton
                    text: qsTr("Back")
                    onPressed: stackView.pop()
                    anchors.left: parent.left
                }
                OnboardingPageIndicator {
                    currentPage: 2
                    anchors.centerIn: parent
                }

                OnboardingButton {
                    id: continueButton
                    text: qsTr("Continue")
                    anchors.right: parent.right
                    focus: true
                    onPressed: stackView.push(participationView)
                }
            }
        }
    }
}
