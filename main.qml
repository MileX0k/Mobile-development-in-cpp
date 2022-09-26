import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window
{
    id: root
    width: 1000
    height: 400
    visible: true
    title: qsTr("Homework")
    color: "lightgrey"

//=================TASK 1===============================
    property string login: "123"
    property string password: "321"
    function checkLoginPassword()
    {
        if (login === loginTextField.text && password === passwordTextField.text)
            animSuccessful.start()
        else
        {
            animUnsuccessful.start()
        }
    }
    readonly property int defMargin: 10
    readonly property string textColor: "535353"

    Rectangle
    {
        id: task1
        anchors.left: parent.left
        anchors.top: parent.top
        width: parent.width / 3
        height: parent.height
        color: "transparent"
        border.color: "red"
    }

    Rectangle
    {
        id: rectTask1
        color: "white"
        anchors.centerIn: task1
        width: 300
        radius: 10
        height: width
        Column
        {
            id: entranceColumn
            anchors.fill: rectTask1
            padding: defMargin * 2
            spacing: defMargin * 3
            anchors.margins: defMargin
            TextField
            {
                id: loginTextField
                width: rectTask1.width - defMargin * 2
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: qsTr("Login")
                color: textColor
                font.pointSize: 11
                selectByMouse: true
                height: loginTextField.font.pointSize + defMargin
                Keys.onEnterPressed: checkLoginPassword()
                Keys.onReturnPressed: checkLoginPassword()
            }
            TextField
            {
                id: passwordTextField
                width: loginTextField.width
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: qsTr("Password")
                color: textColor
                font.pointSize: 11
                selectByMouse: true
                height: passwordTextField.font.pointSize + defMargin
                echoMode: TextInput.Password
                Keys.onEnterPressed: checkLoginPassword()
                Keys.onReturnPressed: checkLoginPassword()
            }
            Button
            {
                id: entranceButton
                anchors.horizontalCenter: parent.horizontalCenter
                width: loginTextField.width
                height: 40
                text: qsTr("Enter")
                onClicked:
                {
                    checkLoginPassword();
                }
                background: Rectangle
                {
                    anchors.fill: entranceButton
                    color: parent.down ? "#25bbbb" : (parent.hovered ? "#d6d6d6" : "#f6f6f6")
                }
            }
            Button
            {
                id: showLoginAndPassword
                text: qsTr("Показать логин и пароль")
                width: loginTextField.width
                height: entranceButton.height
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked:
                {
                    showLoginAndPassword.text = qsTr("Login: " + login + "\nPassword: " + password)
                }
            }
        }

        ParallelAnimation
        {
            id: animUnsuccessful
            SequentialAnimation
            {
                PropertyAnimation
                {
                    targets: [loginTextField, passwordTextField]
                    property: "color"
                    to: "dark red"
                    duration: 0
                }
                PropertyAnimation
                {
                    targets: [loginTextField, passwordTextField]
                    property: "color"
                    to: root.textColor
                    duration: 800
                }
            }
            SequentialAnimation
            {
                PropertyAnimation
                {
                    target: rectTask1
                    property: "anchors.horizontalCenterOffset"
                    to: -5
                    duration: 50
                }
                PropertyAnimation
                {
                    target: rectTask1
                    property: "anchors.horizontalCenterOffset"
                    to: 5
                    duration: 50
                }
                PropertyAnimation
                {
                    target: rectTask1
                    property: "anchors.horizontalCenterOffset"
                    to: 0
                    duration: 50
                }
            }
        }
        SequentialAnimation
        {
            id: animSuccessful
            PropertyAnimation
            {
                targets: [loginTextField, passwordTextField, entranceButton, showLoginAndPassword]
                property: "visible"
                to: false
                duration: 400
            }
            PropertyAnimation
            {
                target: rectTask1
                property: "visible"
                to: false
                duration: 600
            }
        }
    }
//=================TASK 2===============================

    readonly property int elemHeight: 30
    property double p: 0
    property double s: 0
    function calculation()
    {
        p = (aValue.text*1 + bValue.text*1 + cValue.text*1) / 2
        s = Math.sqrt(p*(p-aValue.text*1)*(p-bValue.text*1)*(p-cValue.text*1))
        resultValue.text = s
    }

    Rectangle
    {
        id: task2
        anchors.left: task1.right
        anchors.top: parent.top
        width: parent.width / 3
        height: parent.height
        color: "transparent"
        border.color: "red"

        Column
        {
            id: columnValue
            anchors.fill: task2
            anchors.margins: defMargin
            spacing: defMargin * 3

            TextField
            {
                id: aValue
                width: columnValue.width
                anchors.horizontalCenter: parent.horizontalCenter
                height: elemHeight
                placeholderText: qsTr("Введите значение 'a'")
                selectByMouse: true
                leftPadding: defMargin * 2
                topPadding: height / 4
                activeFocusOnTab: true
            }
            TextField
            {
                id: bValue
                width: columnValue.width
                anchors.horizontalCenter: parent.horizontalCenter
                height: elemHeight
                placeholderText: qsTr("Введите значение 'b'")
                selectByMouse: true
                leftPadding: defMargin * 2
                topPadding: height / 4
                activeFocusOnTab: true
            }
            TextField
            {
                id: cValue
                width: columnValue.width
                anchors.horizontalCenter: parent.horizontalCenter
                height: elemHeight
                placeholderText: qsTr("Введите значение 'c'")
                selectByMouse: true
                leftPadding: defMargin * 2
                topPadding: height / 4
                activeFocusOnTab: true
                Keys.onEnterPressed: calculation()
                Keys.onReturnPressed: calculation()
            }

            Button
            {
                id: calculateButton
                width: columnValue.width
                height: elemHeight
                text: qsTr("Рассчитать площадь треугольника")
                onClicked:
                {
                    calculation()
                }
            }

            TextField
            {
                id: resultValue
                width: columnValue.width
                anchors.horizontalCenter: parent.horizontalCenter
                height: elemHeight
                wrapMode: TextEdit.Wrap
                text: qsTr("Площадь треугольника")
                selectByMouse: true
                leftPadding: defMargin * 2
                topPadding: height / 4
                background: Rectangle
                {
                    border.color: "black"
                    color: root.color
                }
            }
        }
    }

//=================TASK 3===============================

    function calc()
    {
        var s = Math.abs((x1.text-x3.text)*(y2.text-y3.text) - (x2.text-x3.text)*(y1.text-y3.text)) / 2
        resultLabel.text = s
    }
    Rectangle
    {
        id: task3
        anchors.left: task2.right
        anchors.top: parent.top
        width: parent.width / 3
        height: parent.height
        color: "transparent"
        border.color: "red"

        Column
        {
            id: columnTask3
            anchors.fill: task3
            anchors.margins: defMargin
            spacing: defMargin * 3

            Rectangle
            {
                id: dotA
                width: columnTask3.width
                anchors.horizontalCenter: parent.horizontalCenter
                height: 30
                Label
                {
                    id: labelDotA
                    width: dotA.width/3
                    height: dotA.height
                    anchors.left: dotA.left
                    text: "A:"
                    leftPadding: defMargin * 2
                    topPadding: height / 4
                    activeFocusOnTab: false
                }
                TextField
                {
                    id: x1
                    width: dotA.width/3
                    height: dotA.height
                    anchors.left: labelDotA.right
                    placeholderText: qsTr("x1")
                    selectByMouse: true
                    leftPadding: defMargin * 2
                    topPadding: height / 4
                    activeFocusOnTab: true
                }
                TextField
                {
                    id: y1
                    width: dotA.width/3
                    height: dotA.height
                    anchors.left: x1.right
                    placeholderText: qsTr("y1")
                    selectByMouse: true
                    leftPadding: defMargin * 2
                    topPadding: height / 4
                    activeFocusOnTab: true
                }

            }
            Rectangle
            {
                id: dotB
                width: columnTask3.width
                anchors.horizontalCenter: parent.horizontalCenter
                height: 30
                Label
                {
                    id: labelDotB
                    width: dotA.width/3
                    height: dotA.height
                    anchors.left: dotA.left
                    text: "B:"
                    leftPadding: defMargin * 2
                    topPadding: height / 4
                    activeFocusOnTab: false
                }
                TextField
                {
                    id: x2
                    width: dotA.width/3
                    height: dotA.height
                    anchors.left: labelDotB.right
                    placeholderText: qsTr("x2")
                    selectByMouse: true
                    leftPadding: defMargin * 2
                    topPadding: height / 4
                    activeFocusOnTab: true
                }
                TextField
                {
                    id: y2
                    width: dotA.width/3
                    height: dotA.height
                    anchors.left: x2.right
                    placeholderText: qsTr("y2")
                    selectByMouse: true
                    leftPadding: defMargin * 2
                    topPadding: height / 4
                    activeFocusOnTab: true
                }

            }
            Rectangle
            {
                id: dotC
                width: columnTask3.width
                anchors.horizontalCenter: parent.horizontalCenter
                height: 30
                Label
                {
                    id: labelDotC
                    width: dotA.width/3
                    height: dotA.height
                    anchors.left: dotC.left
                    text: "C:"
                    leftPadding: defMargin * 2
                    topPadding: height / 4
                    activeFocusOnTab: false
                }
                TextField
                {
                    id: x3
                    width: dotA.width/3
                    height: dotA.height
                    anchors.left: labelDotC.right
                    placeholderText: qsTr("x3")
                    selectByMouse: true
                    leftPadding: defMargin * 2
                    topPadding: height / 4
                    activeFocusOnTab: true
                }
                TextField
                {
                    id: y3
                    width: dotA.width/3
                    height: dotA.height
                    anchors.left: x3.right
                    placeholderText: qsTr("y3")
                    selectByMouse: true
                    leftPadding: defMargin * 2
                    topPadding: height / 4
                    activeFocusOnTab: true
                }
            }

            Button
            {
                id: calcButton
                width: columnValue.width
                height: elemHeight
                text: qsTr("Рассчитать площадь треугольника по координатам")
                onClicked:
                {
                    calc()
                }
            }
            Label
            {
                id: resultLabel
                width: columnValue.width
                anchors.horizontalCenter: parent.horizontalCenter
                height: elemHeight
                text: qsTr("Площадь треугольника")
                leftPadding: defMargin * 2
                topPadding: height / 4
                background: Rectangle
                {
                    border.color: "black"
                    color: root.color
                }
            }
        }
    }
}
