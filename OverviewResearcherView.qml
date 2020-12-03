import QtQuick 2.0
import QtCharts 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
Rectangle {
    id: main
    color: "#EAEDED"
    Rectangle {
        id: header
        color: "white"
        height: 70
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
        }
        Text {
            id: titleText
            text: qsTr("Account Overview")
            font.weight: Font.DemiBold
            font.pointSize: 22
            color: "#3A465D"
            anchors {
                top: parent.top
                left: parent.left
                topMargin: 12
                leftMargin: 22
            }
        }
        MouseArea {
            id: cpidButton
            width: cpidText.width + cpidBorder.width + cpidText.anchors.leftMargin
            height: cpidBorder.height
            onClicked: {
                //TextEdit workaround without using C++, should probably be changed in the future
                cpidCopier.selectAll()
                cpidCopier.copy()
            }

            anchors {
                top: titleText.bottom
                left: parent.left
                topMargin: 2
                leftMargin: 22
            }

            Rectangle {
                id: cpidBorder
                border.color: "#3A465D"
                radius: 10
                color: "transparent"
                width: cpidTitleText.implicitWidth + 20
                height: cpidTitleText.implicitHeight + 4
                anchors {
                    top: parent.top
                    left: parent.left
                }
                Text {
                    id: cpidTitleText
                    text: qsTr("CPID")
                    font.weight: Font.Light
                    anchors.centerIn: parent
                }
            }
            ToolTip {
                x: parent.width/2-width/2
                y: 20
                visible: cpidButton.pressed || visible   //Stay visible until timeout
                timeout: 1000
                contentItem: Text {
                    id: cpidCopiedText
                    text: qsTr("CPID copied")
                    color: "#3A465D"
                    font.weight: Font.Light
                }
                background: Rectangle {
                    id: cpidCopiedBackground
                    color: "white"
                    radius: 4
                    height: cpidCopiedText.implicitHeight+10
                    width: cpidCopiedText.implicitWidth+10
                    border.color: "#BFBFBF"
                    anchors.verticalCenter: cpidCopiedText.verticalCenter
                    anchors.horizontalCenter: cpidCopiedText.horizontalCenter
                }
            }

            Text {
                id: cpidText
                color: "#3A465D"
                text: "8fbacfac0e9ed5531a31644db4d3d992"
                clip: true
                font.pointSize: 10
                font.weight: Font.Light
                anchors {
                    left: cpidBorder.right
                    //right: parent.right
                    verticalCenter: cpidBorder.verticalCenter
                    leftMargin: 3
                }
                TextEdit{
                    id: cpidCopier
                    text: cpidText.text
                    visible: false
                }
            }
        }
        RowLayout {
            id: headerStats
            property int separatorHeight: height - 30
            spacing: 10
            layoutDirection: Qt.RightToLeft
            anchors {
                right: parent.right
                top: parent.top
                bottom: parent.bottom
                rightMargin: 20

            }
            Column {
                id: bal
                property real balValue: 54069.27
                Layout.alignment: Qt.AlignVCenter
                Text {
                    id: balanceValue
                    text: bal.balValue.toLocaleString(Qt.locale(), 'f', 2)
                    color: Material.theme === Material.Light ? "#9013FE" : "white"
                    font.pointSize: 18
                    font.weight: Font.Medium
                    horizontalAlignment: Text.AllignHCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                Text {
                    id: balanceLabel
                    text: qsTr("Your Balance")
                    color: "#3A465D"
                    horizontalAlignment: Text.AllignHCenter
                    font.pointSize: 10
                    font.weight: Font.Light
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
            Rectangle {
                id: separator
                color: "#EAEDED"
                width: 1
                height: headerStats.separatorHeight
                Layout.alignment: Qt.AlignVCenter
            }
            Column {
                id: magnitude
                property real mag: 610.00
                Layout.alignment: Qt.AlignVCenter
                Text {
                    id: magValue
                    text: magnitude.mag.toLocaleString(Qt.locale(), 'f', 2)
                    color: "#9013FE"
                    font.pointSize: 18
                    font.weight: Font.Medium
                    horizontalAlignment: Text.AllignHCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                Text {
                    id: magLabel
                    text: qsTr("Magnitude")
                    color: "#3A465D"
                    horizontalAlignment: Text.AllignHCenter
                    font.pointSize: 10
                    font.weight: Font.Light
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
        }

    }
    property int panelSpacing: 10
    property int panelRadius: 4
    property int sideBodyMargin: 20
    property int topBodyMargin: 10
    property int bottomBodyMargin: 10

    Rectangle {
        id: walletDetailsPanel
        color: "white"
        radius: panelRadius
        height: walletDetailsTitle.height+walletDetailsTitle.anchors.topMargin+
                dataTitlesColumn.height+dataTitlesColumn.anchors.topMargin+
                balanceTitlesColumn.height+balanceTitlesColumn.anchors.topMargin+
                walletDetailsSeparator.height+walletDetailsSeparator.anchors.topMargin+
                bottomBodyMargin+topBodyMargin  //topBodyMargin included twice, first from walletDetailsTitle

        anchors {
            top: header.bottom
            left: parent.left
            right: parent.horizontalCenter
            leftMargin: panelSpacing
            topMargin: panelSpacing
            rightMargin: panelSpacing/2
        }
        PanelTitle {
            id: walletDetailsTitle
            text: "Wallet Details"
            anchors {
                left: parent.left
                right: parent.right
                top: parent.top
                topMargin: topBodyMargin
                leftMargin: sideBodyMargin
                rightMargin: sideBodyMargin
            }

            HelpHover{
                id: questionMarkMouseOver
                popupWidth: 300
                text:
                    "
                        <html>
                        <br>
                        <font color='#3A465D'><b>" + qsTr("Status") + ":</b></font> " +
                        qsTr("Current wallet status") + "<br><br>
                        <font color='#3A465D'><b>" + qsTr("Projects")+ ":</b></font> " +
                        qsTr("Your current projects") + "<br><br>
                        <font color='#3A465D'><b>" + qsTr("Est. RR/day")+ ":</b></font> " +
                        qsTr("Estimated research earnings per day") + "<br><br>
                        <font color='#3A465D'><b>" + qsTr("Est. Staking Frequency")+ ":</b></font> " +
                        qsTr("Estimated frequency of staking") + "<br><br>
                        <font color='#3A465D'><b>" + qsTr("Available") + ":</b></font> " +
                        qsTr("Balance available for spending") + "<br><br>
                        <font color='#3A465D'><b>" + qsTr("Stake") + ":</b></font> " +
                        qsTr("Balance that is currently staked") + "<br><br>
                        <font color='#3A465D'><b>" + qsTr("Unconfirmed") + ":</b></font> " +
                        qsTr("Coins that have been received but not yet confirmed") + "<br><br>
                        <font color='#3A465D'><b>" + qsTr("Total") + ":</b></font> " +
                        qsTr("Your total coins") + "<br>
                        </html>
                    "

                anchors {
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                }

            }
        }

        Column {
            id:dataTitlesColumn
            height: statusLabel.height+projectLabel.height+estRRLabel.height+estTTSLabel.height
            spacing: 4
            anchors {
                left: parent.left
                top: walletDetailsTitle.bottom
                topMargin: 10
                leftMargin: sideBodyMargin
            }
            Text {
                id: statusLabel
                color: "#3A465D"
                text: qsTr("Status")+":"
            }
            Text {
                id: projectLabel
                color: "#3A465D"
                text: qsTr("Projects")+":"
            }
            Text {
                id: estRRLabel
                color: "#3A465D"
                text: qsTr("Est. RR/day")+":"
            }
            Text {
                id: estTTSLabel
                color: "#3A465D"
                text: qsTr("Est. Staking Frequency")+":"
            }
        }
        Column {
            id: dataValuesColumn
            property string status: qsTr("BOINC Mining")
            property string projects: "lhc@home"
            property real rr: 442.71
            property real tts: 1.14
            spacing: 4
            clip: true
            anchors {
                left: dataTitlesColumn.right
                top: walletDetailsTitle.bottom
                topMargin: 10
                right: parent.right
                rightMargin: sideBodyMargin
            }
            Text {
                id: statusValue
                text: dataValuesColumn.status
                color: "#9013FE"  //Blue Purple
                horizontalAlignment: Text.AlignRight
                anchors.right: parent.right
            }
            Text {
                id: projectValue
                text: dataValuesColumn.projects
                color: "#5c5f65"
                horizontalAlignment: Text.AlignRight
                anchors.right: parent.right
            }
            Text {
                id: estRRValue
                text: dataValuesColumn.rr.toLocaleString(Qt.locale(), 'f', 2)
                color: "#5c5f65"
                horizontalAlignment: Text.AlignRight
                anchors.right: parent.right
            }
            Text {
                id: estTTSValue
                text: dataValuesColumn.tts.toLocaleString(Qt.locale(), 'f', 1) + qsTr(" days")
                color: "#5c5f65"
                horizontalAlignment: Text.AlignRight
                anchors.right: parent.right
            }
        }
        Rectangle {
            id: walletDetailsSeparator
            height: 1
            width: parent.width-40
            color: "#EAEDED"
            anchors {
                horizontalCenter: parent.horizontalCenter
                top: dataTitlesColumn.bottom
                topMargin: 20
            }
        }

        Column {
            id:balanceTitlesColumn
            spacing: 4
            height: availableLabel.height+stakeLabel.height+unconfirmedLabel.height+totalLabel.height
            anchors {
                left: parent.left
                top: walletDetailsSeparator.bottom
                topMargin: 10
                leftMargin: sideBodyMargin
            }
            Text {
                id: availableLabel
                color: "#3A465D"
                text: qsTr("Available")+":"
            }
            Text {
                id: stakeLabel
                color: "#3A465D"
                text: qsTr("Stake")+":"
            }
            Text {
                id: unconfirmedLabel
                color: "#3A465D"
                text: qsTr("Unconfirmed")+":"
            }
            Text {
                id: totalLabel
                color: "#3A465D"
                font.weight: Font.DemiBold
                text: qsTr("Total")+":"
            }
        }
        Column {
            id: balanceValuesColumn
            property real available: 47197.34593948
            property real stake: 6871.92793688
            property real unconfirmed: 17.02145689
            property real total: available+stake+unconfirmed
            spacing: 4
            clip: true
            anchors {
                left: balanceTitlesColumn.right
                top: walletDetailsSeparator.bottom
                topMargin: 10
                leftMargin: 0
                right: parent.right
                rightMargin: sideBodyMargin
            }
            Text {
                id: availableValue
                text: balanceValuesColumn.available.toLocaleString(Qt.locale(), 'f', 8) + qsTr(" GRC")
                color: "#5c5f65"
                horizontalAlignment: Text.AlignRight
                anchors.right: parent.right
            }



            Text {
                id: stakeValue
                text: balanceValuesColumn.stake.toLocaleString(Qt.locale(), 'f', 8) + qsTr(" GRC")
                color: "#5c5f65"
                horizontalAlignment: Text.AlignRight
                anchors.right: parent.right
            }


            Text {
                id: unconfirmedValue
                text: balanceValuesColumn.unconfirmed.toLocaleString(Qt.locale(), 'f', 8) + qsTr(" GRC")
                color: "#5c5f65"
                horizontalAlignment: Text.AlignRight
                anchors.right: parent.right
            }

            Text {
                id: totalValue
                text: balanceValuesColumn.total.toLocaleString(Qt.locale(), 'f', 8) + qsTr(" GRC")
                color: "#5c5f65"
                font.weight: Font.DemiBold
                horizontalAlignment: Text.AlignRight
                anchors.right: parent.right
            }
        }
    }

    Rectangle {
        id:networkStatePanel
        color: "white"
        radius: panelRadius
        height: networkStateTitle.implicitHeight+networkStateTitle.anchors.topMargin+
                networkTitlesColumn.height+networkTitlesColumn.anchors.topMargin+
                bottomBodyMargin+topBodyMargin
        anchors {
            top: walletDetailsPanel.bottom
            left: parent.left
            right: parent.horizontalCenter
            leftMargin: panelSpacing
            topMargin: panelSpacing
            rightMargin: panelSpacing/2
        }

        PanelTitle {
            id: networkStateTitle
            text: "Network State"
            anchors {
                left: parent.left
                right: parent.right
                top: parent.top
                topMargin: topBodyMargin
                leftMargin: sideBodyMargin
                rightMargin: sideBodyMargin
            }

            HelpHover{
                id: networkStateQuestionMarkMouseOver
                popupWidth: 300
                text:
                    "
                        <html>
                        <br>
                        <font color='#3A465D'><b>" + qsTr("Blocks") + ":</b></font> " +
                        qsTr("The number of blocks your client currently has on the chain") + "<br><br>
                        <font color='#3A465D'><b>" + qsTr("Difficulty")+ ":</b></font> " +
                        qsTr("Current network difficulty. A larger value corresponds to smaller odds of staking") + "<br><br>
                        <font color='#3A465D'><b>" + qsTr("Net Weight")+ ":</b></font> " +
                        qsTr("Total number of coins on the entire network which are actively trying to stake") + "<br><br>
                        <font color='#3A465D'><b>" + qsTr("Coin Weight")+ ":</b></font> " +
                        qsTr("Number of your coins which are actively trying to stake") + "<br><br>
                        <font color='#3A465D'><b>" + qsTr("Magnitude") + ":</b></font> " +
                        qsTr("Relative measure of your mining contributions") + "<br>
                        </html>
                    "

                anchors {
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                }

            }
        }

        Column {
            id:networkTitlesColumn
            spacing: 4
            height: blocksLabel.implicitHeight+difficultyLabel.implicitHeight+netWeightLabel.implicitHeight+coinWeightLabel.implicitHeight
            anchors {
                left: parent.left
                top: networkStateTitle.bottom
                topMargin: topBodyMargin
                leftMargin: sideBodyMargin
            }
            Text {
                id: blocksLabel
                color: "#3A465D"
                text: qsTr("Blocks")+":"
            }
            Text {
                id: difficultyLabel
                color: "#3A465D"
                text: qsTr("Difficulty")+":"
            }
            Text {
                id: netWeightLabel
                color: "#3A465D"
                text: qsTr("Net Weight")+":"
            }
            Text {
                id: coinWeightLabel
                color: "#3A465D"
                text: qsTr("Coin Weight")+":"
            }
        }
        Column {
            id: networkValuesColumn
            property int blocks: 47197
            property real difficulty: 6871.92793688
            property real netWeight: 17.02145689
            property real coinWeight: 72283
            spacing: 5
            clip: true
            anchors {
                left: networkTitlesColumn.right
                top: networkStateTitle.bottom
                topMargin: 10
                leftMargin: 0
                right: parent.right
                rightMargin: sideBodyMargin
            }
            Text {
                id: blockValue
                text: networkValuesColumn.blocks
                color: "#5c5f65"
                horizontalAlignment: Text.AlignRight
                anchors.right: parent.right
            }

            Text {
                id: difficultyValue
                text: networkValuesColumn.difficulty.toLocaleString(Qt.locale(), 'f', 3)
                color: "#5c5f65"
                horizontalAlignment: Text.AlignRight
                anchors.right: parent.right
            }

            Text {
                id: netWeightValue
                text: networkValuesColumn.netWeight.toLocaleString(Qt.locale(), 'f', 8)
                color: "#5c5f65"
                horizontalAlignment: Text.AlignRight
                anchors.right: parent.right
            }

            Text {
                id: coinWeightValue
                text: networkValuesColumn.coinWeight.toLocaleString(Qt.locale(), 'f', 3)
                color: "#5c5f65"
                horizontalAlignment: Text.AlignRight
                anchors.right: parent.right
            }
        }
    }

    Rectangle {
        id: recentTransactionsPanel
        color: "white"
        radius: panelRadius
        height: networkStatePanel.height+walletDetailsPanel.height+panelSpacing
        anchors {
            top: header.bottom
            right: parent.right
            left: parent.horizontalCenter
            topMargin: panelSpacing
            rightMargin: panelSpacing
            leftMargin: panelSpacing/2 
        }
        PanelTitle {
            id: recentTransactionsTitle
            text: "Recent Transactions"
            anchors {
                left: parent.left
                right: parent.right
                top: parent.top
                topMargin: topBodyMargin
                leftMargin: sideBodyMargin
                rightMargin: sideBodyMargin
            }
        }
        ListView {
            id: recentTransactionList
            contentWidth: width
            clip: true
            anchors {
                top: recentTransactionsTitle.bottom
                left: parent.left
                right: parent.right
                bottom: parent.bottom
                topMargin: topBodyMargin
                leftMargin: sideBodyMargin
                rightMargin: sideBodyMargin
                bottomMargin: bottomBodyMargin
            }

            model: RecentTransactionModel{}
            delegate: RecentTransactionItem {
                amount: transactionAmount
                state: transactionType
                account: transactionAccount
                transactionDate: Date.fromLocaleString(Qt.locale(),  transactionTimestamp, "ddd yyyy-MM-dd hh:mm:ss")
            }
        }
    }
    Rectangle {
        id: latestPollsPanel
        color: "white"
        radius: panelRadius
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            top: recentTransactionsPanel.bottom
            leftMargin: panelSpacing
            rightMargin: panelSpacing
            bottomMargin: panelSpacing
            topMargin: panelSpacing
        }
        PanelTitle {
            id: latestPollTitle
            text: "Latest Polls"
            anchors {
                left: parent.left
                right: parent.right
                top: parent.top
                topMargin: topBodyMargin
                leftMargin: sideBodyMargin
                rightMargin: sideBodyMargin
            }
        }

        ListView {
            id: recentPollList
            clip: true
            spacing: 5
            interactive: false
            anchors {
                top: latestPollTitle.bottom
                left: parent.left
                right: parent.right
                bottom: parent.bottom
                topMargin: topBodyMargin
                leftMargin: sideBodyMargin
                rightMargin: sideBodyMargin
                bottomMargin: bottomBodyMargin
            }

            model: PollModel{}
            currentIndex: 0
            preferredHighlightBegin: 0
            highlightRangeMode: ListView.ApplyRange
            delegate: Item {
                id: pollWrapper
                height: pollItemTitle.height
                Circle {
                    id: pollItemCircle
                    radius: 2
                    color: pollWrapper.ListView.isCurrentItem ? "#3A465D" : "transparent"
                    border.color: pollWrapper.ListView.isCurrentItem ? "#3A465D" : "#5c5f65"
                    anchors.verticalCenter: parent.verticalCenter
                }

                Text {
                    id: pollItemTitle
                    text: title
                    color: pollWrapper.ListView.isCurrentItem ? "#3A465D" : "#8b8d91"
                    font.weight: pollWrapper.ListView.isCurrentItem ? Font.Medium : Font.Normal
                    font.pointSize: 12
                    anchors.left: pollItemCircle.right
                    anchors.verticalCenter: pollItemCircle.verticalCenter
                    anchors.leftMargin: 4
                }
            }
        }
    }
}
