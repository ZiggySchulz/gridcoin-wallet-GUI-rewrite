import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import QtQml 2.15
import MMPTheme 1.0

Rectangle {
    id: main
    color: MMPTheme.backgroundColor
    Rectangle {
        id: header
        color: MMPTheme.themeSelect(MMPTheme.cWhite, MMPTheme.cSpaceBlack)
        height: 70
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
        }
        Rectangle {
            id: bottomBorder
            height: 1
            color: MMPTheme.themeSelect("transparent", MMPTheme.cBlack)
            anchors {
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }
        }

        Text {
            id: titleText
            //height: implicitHeight+2
            text: qsTr("Receive Funds")
            font.weight: Font.DemiBold
            font.pixelSize: 22
            color: MMPTheme.textColor
            //verticalAlignment: Text.AlignTop
            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: 22
            }
        }
        Rectangle {
            id: recordSeparator
            color: MMPTheme.separatorColor
            height: titleText.height*0.625
            width: 1
            anchors {
                bottom: titleText.baseline
                bottomMargin: -1
                left: titleText.right
                leftMargin: 8
            }
        }

        //Num used temporarily
        property string recordString: qsTr("%n record(s)", "", addressListView.count)
        Text {
            id: recordNumText
            text: parent.recordString.slice(0,1)
            color: MMPTheme.highlightColor
            font.weight: Font.DemiBold
            anchors {
                baseline: titleText.baseline
                baselineOffset: -2
                left: recordSeparator.right
                leftMargin: 8
            }
        }
        Text {
            id: recordLabelText
            height: recordSeparator.height
            text:  parent.recordString.slice(1)
            color: MMPTheme.textColor
            anchors {
                baseline: recordNumText.baseline
                left: recordNumText.right
            }
        }

        SearchBox {
            placeholderText: qsTr("Search by label or address")
            anchors {
                verticalCenter: parent.verticalCenter
                right: parent.right
                rightMargin: 20
            }
        }
    }
    Rectangle {
        id: receivePanel
        color: MMPTheme.bodyColor
        radius: 4
        anchors {
            top: header.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            topMargin: 10
            leftMargin: 10
            rightMargin: 10
            bottomMargin: 10
        }
        Text {
            id: listInfoText
            text: qsTr("These are your Gridcoin addresses for receiving payments. You may want to give a different one to each sender so you can keep track of who is paying you.")
            color: MMPTheme.textColor
            wrapMode: Text.WordWrap
            anchors {
                left: parent.left
                top: parent.top
                right: parent.right
                leftMargin: 10
                topMargin: 10
                rightMargin: 10
            }
        }
        Rectangle {
            id: addressListRect
            property int labelColumnWidth: width-lastUsedColumnWidth-addressColumnWidth
            property int lastUsedColumnWidth: Math.max(90, width*0.15)
            property int addressColumnWidth: Math.max(300, width*0.5)
            property var columnWidths: [labelColumnWidth, lastUsedColumnWidth, addressColumnWidth]
            color: MMPTheme.themeSelect(MMPTheme.cWhite, "#17222c")
            border.color: MMPTheme.themeSelect("#c3c7ce", "#3b475d")
            radius: 4
            anchors {
                top: listInfoText.bottom
                left: parent.left
                right: parent.right
                bottom: bottomAccentItem.top
                topMargin: 10
                leftMargin: 10
                rightMargin: 10
                bottomMargin: 10
            }

            //This was a lot of effort for such a inconspicuous element
            Rectangle {
                id: tableHeaderRect
                property int currentSortIndex: 0
                height: 25
                width: parent.width
                color: "transparent"
                border.color: parent.border.color
                radius: parent.radius
                Rectangle {
                    id: tableHeaderInnerRect
                    height: parent.height
                    width: parent.width
                    border.color: parent.border.color
                    gradient: Gradient {
                        GradientStop { position: 0; color: MMPTheme.themeSelect(MMPTheme.cWhite, MMPTheme.cMirage)}
                        GradientStop { position: 1; color: MMPTheme.themeSelect(MMPTheme.cLilyWhite, MMPTheme.cMirage)}
                    }
                    layer {
                        enabled: true
                        effect: OpacityMask {
                            maskSource: Item {
                                width: tableHeaderInnerRect.width
                                height: tableHeaderInnerRect.height
                                Rectangle {
                                    id: radiusRect
                                    y:1
                                    width: parent.width
                                    height: 8
                                    radius: 4
                                }
                                Rectangle {
                                    width: parent.width
                                    anchors {
                                        top: radiusRect.verticalCenter
                                        bottom: parent.bottom
                                    }
                                }
                            }
                        }
                    }

                    TableColumnHeader {
                        id: labelHeaderItem
                        height: parent.height
                        width: addressListRect.labelColumnWidth
                        index: 0
                        active: tableHeaderRect.currentSortIndex === index
                        text: qsTr("Label")
                        anchors {
                            left: parent.left
                            leftMargin: 1
                        }
                        onClicked: {
                            if (active){
                                if (accending) { accending=false }
                                else { accending=true }
                            } else {
                                tableHeaderRect.currentSortIndex = index
                            }
                            //c++Model.sort(index, accending)
                        }
                    }
                    TableColumnHeader {
                        id: lastUsedHeaderItem
                        height: parent.height
                        width: addressListRect.lastUsedColumnWidth
                        index: 1
                        active: tableHeaderRect.currentSortIndex === index
                        text: qsTr("Last Used")
                        anchors.left: labelHeaderItem.right
                        onClicked: {
                            if (active){
                                if (accending) { accending=false }
                                else { accending=true }
                            } else {
                                tableHeaderRect.currentSortIndex = index
                            }
                            //c++Model.sort(index, accending)
                        }
                    }
                    TableColumnHeader {
                        id: addressHeaderItem
                        height: parent.height
                        width: addressListRect.addressColumnWidth
                        index: 2
                        active: tableHeaderRect.currentSortIndex === index
                        text: qsTr("Address")
                        anchors.left: lastUsedHeaderItem.right
                        onClicked: {
                            if (active){
                                if (accending) { accending=false }
                                else { accending=true }
                            } else {
                                tableHeaderRect.currentSortIndex = index
                            }
                            //c++Model.sort(index, accending)
                        }
                    }
                }
            }
            ListView {
                id: addressListView
                clip: true
                currentIndex: 0
                Keys.onDownPressed: {currentIndex = Math.min(count-1, currentIndex+1)
                    console.log("Down pressed")}
                Keys.onUpPressed: currentIndex = Math.max(0, currentIndex-1)
                ScrollIndicator.vertical: ScrollIndicator {
                    parent: addressListView.parent
                    anchors {
                        top: addressListView.top
                        bottom: addressListView.bottom
                        right: addressListView.right
                        rightMargin: 1
                    }
                }
                anchors {
                    top: tableHeaderRect.bottom
                    left: parent.left
                    right: parent.right
                    bottom: tableFooterRect.top
                    leftMargin: 1
                    rightMargin: 1
                }

                model: ListModel {
                    ListElement {
                        label: "Donation"
                        lastUsed: 1609723156
                        address: "SBPvphumk9BmzdLqCBy4b7U62tj39iynLo"
                    }
                    ListElement {
                        label: "Inbox"
                        lastUsed: 1605743156
                        address: "SGMMMMMMMMMMMMMMMMMMMMMMMMMMMMfqtz"
                    }
                }
                delegate: MouseArea {
                    width: parent.width
                    height: 25
                    onClicked: addressListView.currentIndex=index
                    Rectangle {
                        anchors.fill: parent
                        color: addressListView.currentIndex===index ? MMPTheme.themeSelect(MMPTheme.cFrostWhite, "#212c3b") : "transparent"
                        Item {
                            id: labelTextItem
                            height: parent.height
                            width: addressListRect.labelColumnWidth
                            Text {
                                id: labelText
                                height: parent.height
                                text: label
                                color: MMPTheme.translucent(MMPTheme.textColor, addressListView.currentIndex===index ? 1 : 0.7)
                                verticalAlignment: Text.AlignVCenter
                                elide: Text.ElideRight
                                anchors {
                                    left: parent.left
                                    leftMargin: 10
                                }
                            }
                        }
                        Item {
                            id: lastUsedTextItem
                            height: parent.height
                            width: addressListRect.lastUsedColumnWidth
                            anchors.left: labelTextItem.right
                            Text {
                                id: lastUsedText
                                height: parent.height
                                text: (new Date(lastUsed*1000)).toLocaleDateString(Qt.locale(), "d MMM yyyy")
                                color: MMPTheme.translucent(MMPTheme.textColor, addressListView.currentIndex===index ? 1 : 0.7)
                                verticalAlignment: Text.AlignVCenter
                                anchors {
                                    left: parent.left
                                    leftMargin: 10
                                }
                            }
                        }
                        Text {
                            id: addressText
                            height: parent.height
                            text: address
                            color: MMPTheme.translucent(MMPTheme.textColor, addressListView.currentIndex===index ? 1 : 0.7)
                            verticalAlignment: Text.AlignVCenter
                            elide: Text.ElideRight
                            anchors {
                                left: lastUsedTextItem.right
                                leftMargin: 10
                                right: copyButton.visible ? copyButton.left : parent.right
                                rightMargin: 1
                            }
                        }
                        Button {
                            id: copyButton
                            visible: addressListView.currentIndex===index
                            icon.source: MMPTheme.themeSelect("resources/icons/generic/ic_copy_light.svg","resources/icons/generic/ic_copy_dark.svg")
                            anchors {
                                top: parent.top
                                bottom: parent.bottom
                                right: parent.right
                                rightMargin: 2
                            }
                            background: Item {}
                        }
                    }
                }
            }
            Rectangle {
                id: tableFooterRect
                height: 25
                width: parent.width
                color: "transparent"
                border.color: parent.border.color
                radius: parent.radius
                anchors.bottom: parent.bottom
                Rectangle {
                    id: tableFooterInnerRect
                    height: parent.height
                    width: parent.width
                    border.color: parent.border.color
                    gradient: Gradient {
                        GradientStop { position: 0; color: MMPTheme.themeSelect(MMPTheme.cWhite, MMPTheme.cMirage)}
                        GradientStop { position: 1; color: MMPTheme.themeSelect(MMPTheme.cLilyWhite, MMPTheme.cMirage)}
                    }
                    layer {
                        enabled: true
                        effect: OpacityMask {
                            maskSource: Item {
                                width: tableHeaderInnerRect.width
                                height: tableHeaderInnerRect.height
                                Rectangle {
                                    width: parent.width
                                    anchors {
                                        top: parent.top
                                        bottom: radiusRect.verticalCenter
                                    }
                                }
                                Rectangle {
                                    id: radiusRect
                                    width: parent.width
                                    height: 2*radius
                                    radius: tableFooterRect.radius
                                    anchors {
                                        bottom: parent.bottom
                                        bottomMargin: 1
                                    }
                                }
                            }
                        }
                    }
                    Button {
                        id: addAddressButton
                        height: parent.height
                        width: 30
                        anchors.left: parent.left
                        icon.source: MMPTheme.themeSelect("resources/icons/generic/ic_add_light.svg","resources/icons/generic/ic_add_dark.svg")
                        background: Item{}
                    }
                    Rectangle {
                        id: buttonSeparator
                        color: parent.border.color
                        width: 1
                        height: parent.height
                        anchors.left: addAddressButton.right
                    }
                }
            }
        }
        Item {
            id: bottomAccentItem
            height: 40
            width: parent.width
            anchors.bottom: parent.bottom
            //Background
            Rectangle {
                id: bottomCurvedRect
                color: MMPTheme.themeSelect(MMPTheme.cFrostWhite, MMPTheme.cMirage)
                width: parent.width
                height: 2*radius
                radius: receivePanel.radius
                anchors.bottom: parent.bottom
            }
            Rectangle {
                id: bottomAccentRect
                width: parent.width
                height: 40
                color: MMPTheme.themeSelect(MMPTheme.cFrostWhite, MMPTheme.cMirage)
                anchors {
                    top: parent.top
                    bottom: bottomCurvedRect.verticalCenter
                }
            }

            Button {
                text: qsTr("Show QR Code")
                icon.source: MMPTheme.themeSelect("resources/icons/buttons/ic_btn_qr_code_light.svg","resources/icons/buttons/ic_btn_qr_code_dark.svg")
                anchors {
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                    leftMargin: 10
                }
            }
            Button {
                text: qsTr("Sign Message")
                icon.source: MMPTheme.themeSelect("resources/icons/buttons/ic_btn_sign_light.svg","resources/icons/buttons/ic_btn_sign_dark.svg")
                anchors {
                    verticalCenter: parent.verticalCenter
                    right: parent.right
                    rightMargin: 10
                }
            }
        }
    }
}