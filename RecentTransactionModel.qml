import QtQuick 2.0
import QtQml 2.0
ListModel {
    ListElement {
        transactionType: "incomingTransaction"
        transactionAmount: 17.0214
        transactionTimestamp: "Tue 2013-09-17 15:56:06"
        transactionAccount: "Main Wallet"
    }
    ListElement {
        transactionType: "incomingTransaction"
        transactionAmount: 34928.123
        transactionTimestamp: "Tue 2013-09-17 10:56:06"
        transactionAccount: "Not Main Wallet"
    }
    ListElement {
        transactionType: "sentTransaction"
        transactionAmount: -17.0214
        transactionTimestamp: "Tue 2013-09-17 10:56:06"
        transactionAccount: "Second Address"
    }
    ListElement {
        transactionType: "proofOfStake"
        transactionAmount: 10.0
        transactionTimestamp: "Tue 2013-09-17 10:56:06"
        transactionAccount: "Main Wallet"
    }
    ListElement {
        transactionType: "proofOfResearch"
        transactionAmount: 666.123
        transactionTimestamp: "Tue 2013-09-17 10:56:06"
        transactionAccount: "Main Wallet"
    }
    ListElement {
        transactionType: "inOut"
        transactionAmount: 12.123
        transactionTimestamp: "Tue 2013-09-17 10:56:06"
        transactionAccount: "This is just a string"
    }
    ListElement {
        transactionType: "incomingTransaction"
        transactionAmount: 420.69
        transactionTimestamp: "Tue 2013-09-17 07:56:06"
        transactionAccount: "SBPvphumk9BmzdLqCBy4b7U62tj39iynLo"
    }
    ListElement {
        transactionType: "beaconAdvertisement"
        transactionAmount: -0.5
        transactionTimestamp: "Tue 2013-09-17 02:56:06"
        transactionAccount: "SBPvphumk9BmzdLqCBy4b7U62tj39iynLo"
    }
}
