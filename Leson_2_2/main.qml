import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.15

Window {
    id: root
    width: 1100
    minimumWidth: 600
    height: 520
    visible: true
    title: qsTr("Hello World")

//===============Task 1==========================
    readonly property int defMargin: 10
    property string gender: "Man"
    property string searchGen: "Any"
    Rectangle
    {
        id: task1
        width: parent.width / 2
        anchors.left: parent.left
        anchors.top: parent.top
        height: parent.height
        color: "#fffa9e"
        border.color: "#ddfa9e"
        ColumnLayout
        {
            id: regField
            anchors.left: task1.left
            anchors.top: task1.top
            width: 275
            height: task1.height
            anchors.margins: defMargin
            spacing: defMargin
            Label
            {
                Layout.alignment: Qt.AlignCenter
                rightPadding: defMargin
                text: qsTr("Анкета для заполнения")
                font.pointSize: 15
                font.bold: true
            }
            TextField
            {
                id: familyField
                Layout.preferredWidth: regField.width - defMargin
                height: defMargin * 3
                font.pixelSize: 14
                leftPadding: defMargin / 2
                selectByMouse: true
                placeholderText: qsTr("Введите фамилию")
            }
            TextField
            {
                id: nameField
                Layout.preferredWidth: regField.width - defMargin
                height: defMargin * 3
                font.pixelSize: 14
                leftPadding: defMargin / 2
                selectByMouse: true
                placeholderText: qsTr("Введите имя")
            }
            TextField
            {
                id: patronymicField
                Layout.preferredWidth: regField.width - defMargin
                height: defMargin * 3
                leftPadding: defMargin / 2
                font.pixelSize: 14
                selectByMouse: true
                placeholderText: qsTr("Введите отчество")
            }
            Row
            {
                id: genderField
                width: nameField.width
                spacing: defMargin
                Label
                {
                    text: qsTr("Пол:")
                    height: parent.height
                    width: defMargin * 3
                    font.pixelSize: 15
                }

                RadioButton
                {
                    id: manButton
                    text: qsTr("Мужской")
                    checked: true
                    font.pixelSize: 12
                }
                RadioButton
                {
                    id: womanButton
                    text: qsTr("Женский")
                    font.pixelSize: 12
                }
            }
            Label
            {
                text: qsTr("Дата рождения:")
                height: parent.height
                width: defMargin * 3
                font.pixelSize: 14
            }
            Row
            {
                id: birthField
                width: regField.width
                spacing: defMargin
                ComboBox
                {
                    id: dayBirth
                    width: nameField.width / 4
                    model: ListModel{ id: listmodelDay }
                    Component.onCompleted:
                    {
                        for (var i = 1; i <= 31; ++i)
                        {
                            listmodelDay.append({value: i})
                        }
                        currentIndex = 0;
                    }
                    background: Rectangle
                    {
                        color: "white"; border.color: "black"
                        width: nameField.width / 4
                    }
                }
                ComboBox
                {
                    id: monthBirth
                    width: nameField.width / 4
                    model: ListModel{ id: listmodelMonth }
                    Component.onCompleted:
                    {
                        for (var i = 1; i <= 12; ++i)
                        {
                            listmodelMonth.append({value: i})
                        }
                        currentIndex = 0;
                    }
                    background: Rectangle
                    {
                        color: "white"; border.color: "black"
                        width: dayBirth.width
                    }
                }
                ComboBox
                {
                    id: yearBirth
                    width: nameField.width / 4
                    model: ListModel{ id: listmodelYear }
                    Component.onCompleted:
                    {
                        for (var i = 1900; i <= 2004; ++i)
                        {
                            listmodelYear.append({value: i})
                        }
                        currentIndex = 104;
                    }
                    background: Rectangle
                    {
                        color: "white"; border.color: "black"
                        width: dayBirth.width
                    }
                }
            }
            TextField
            {
                id: cityField
                Layout.preferredWidth: regField.width - defMargin
                height: defMargin * 3
                font.pixelSize: 14
                leftPadding: defMargin / 2
                placeholderText: qsTr("Город проживания")
                selectByMouse: true
            }
            TextField
            {
                id: educationField
                Layout.preferredWidth: regField.width - defMargin
                height: defMargin * 3
                font.pixelSize: 14
                leftPadding: defMargin / 2
                placeholderText: qsTr("Образование")
                selectByMouse: true
            }
            Label
            {
                text: qsTr("О себе:")
                height: parent.height
                width: defMargin * 3
                font.pixelSize: 14
            }
            TextInput
            {
                id: aboutYourselfField
                Layout.preferredWidth: regField.width - defMargin
                Layout.rightMargin: defMargin
                maximumLength: 150
                height: 100
                Row
                {
                    anchors.fill: aboutYourselfField
                }
                font.pixelSize: 14
                wrapMode: TextEdit.Wrap
                leftPadding: defMargin / 2
                rightPadding: defMargin / 2
                selectByMouse: true
                Rectangle
                {
                    z: -1
                    anchors.fill: aboutYourselfField
                    color: "white"
                    border.color: "black"
                }
            }
            Button
            {
                id: completeRegistrationButton
                Layout.preferredHeight: 40
                Layout.alignment: Qt.AlignCenter
                text: qsTr("Завершить регистрацию")
                onClicked:
                {
                    if (womanButton.checked) gender = "Woman"
                    if (nameField.text !== "" && familyField.text !== "" && cityField.text !== "" )
                    {
                        console.log("\nName: " + nameField.text + "\n" +
                                    "Family: " + familyField.text + "\n" +
                                    "Patronymic: " + patronymicField.text + "\n" +
                                    "Gender: " + gender + "\n" +
                                    "Birthday: " + dayBirth.currentText + "." + monthBirth.currentText + "." + yearBirth.currentText + "\n" +
                                    "City: " + cityField.text + "\n" +
                                    "Education: " + educationField.text + "\n" +
                                    "About yourself: " + aboutYourselfField.text + "\n"
                                    )
                        borderRect.visible = true;
                        hint.visible = false
                    }
                    else
                    {
                        console.log("Ошибка при регистрации! Обязательные поля: Имя, Фамилия, Город")
                    }
                }
            }
            Item { id: filler; Layout.fillHeight: true }
        }

        Label
        {
            id: hint
            anchors.left: regField.right
            font.pointSize: 14
            font.bold: true
            anchors.margins: defMargin * 2
            text: qsTr("Поиск появится после\n заполнения анкеты")
        }

        Rectangle
        {
            id: borderRect
            width: parent.width / 2
            height: parent.height
            anchors.top: parent.top
            anchors.left: regField.right
            color: "transparent"
            visible: false
            ColumnLayout
            {
                id: searchField
                anchors.fill: borderRect
                anchors.margins: defMargin
                spacing: defMargin
                Label
                {
                    Layout.alignment: Qt.AlignCenter
                    rightPadding: defMargin
                    text: qsTr("Анкета поиска")
                    font.pointSize: 15
                    font.bold: true
                }
                TextField
                {
                    id: citySearchField
                    Layout.preferredWidth: searchField.width - defMargin
                    height: defMargin * 3
                    font.pixelSize: 14
                    leftPadding: defMargin / 2
                    placeholderText: qsTr("Город проживания")
                    selectByMouse: true
                }
                Column
                {
                    id: searchGender
                    Layout.preferredWidth: searchField.width
                    spacing: defMargin
                    Label
                    {
                        text: qsTr("Пол:")
                        height: defMargin * 2
                        width: defMargin * 3
                        font.pixelSize: 14
                    }
                    RadioButton
                    {
                        id: searchManButton
                        text: qsTr("Мужской")
                        font.pixelSize: 12
                    }
                    RadioButton
                    {
                        id: searchWomanButton
                        text: qsTr("Женский")
                        font.pixelSize: 12
                    }
                    RadioButton
                    {
                        id: searchAnyButton
                        text: qsTr("Любой")
                        checked: true
                        font.pixelSize: 12
                    }
                }
                Row
                {
                    id: rowAge
                    width: searchField.width - defMargin
                    spacing: defMargin
                    Label
                    {
                        text: qsTr("От:")
                        font.pointSize: 13
                    }
                    ComboBox
                    {
                        id: fromAge
                        width: citySearchField.width / 4
                        model: ListModel{ id: listFromAge }
                        Component.onCompleted:
                        {
                            for (var i = 18; i <= 122; ++i)
                            {
                                listFromAge.append({value: i})
                            }
                            currentIndex = 0;
                        }
                        background: Rectangle
                        {
                            color: "white"; border.color: "black"
                            width: citySearchField.width / 4
                        }
                    }
                    Label
                    {
                        text: qsTr("До:")
                        font.pointSize: 13
                    }
                    ComboBox
                    {
                        id: toAge
                        width: citySearchField.width / 4
                        model: ListModel{ id: listToAge }
                        Component.onCompleted:
                        {
                            for (var i = fromAge.currentIndex + 19; i <= 122; ++i)
                            {
                                listToAge.append({value: i})
                            }
                            currentIndex = 0;
                        }
                        background: Rectangle
                        {
                            color: "white"; border.color: "black"
                            width: citySearchField.width / 4
                        }
                    }
                }
                Button
                {
                    id: completeSearchButton
                    Layout.preferredHeight: 40
                    Layout.alignment: Qt.AlignCenter
                    text: qsTr("Поиск")
                    onClicked:
                    {
                        if (searchManButton.checked) searchGen = "Man"
                        else if (searchWomanButton.checked) searchGen = "Woman"
                        if (citySearchField.text !== "" && fromAge.currentText <= toAge.currentText)
                        {
                            console.log("\nCity: " + citySearchField.text + "\n" +
                                        "Age from: " + fromAge.currentText + "\n" +
                                        "Age to: " + toAge.currentText + "\n" +
                                        "Gender: " + searchGen
                                        )
                        }
                        else
                        {
                            if (fromAge.currentText > toAge.currentText)
                                console.log("Ошибка поиска! Возраст поиска ОТ должен быть меньше ДО")
                            else
                            console.log("Ошибка поиска! Обязательные поля: Город")
                        }
                    }
                }
                Item { id: filler2; Layout.fillHeight: true }
            }
        }
    }

//===============Task 2==========================
        Rectangle
        {
            id: task2
            width: parent.width / 2
            anchors.left: task1.right
            anchors.top: task1.top
            height: parent.height
            color: "white"
            border.color: "#ddfa9e"
            Rectangle
            {
                id: rectan
                width: 150
                height: width
                anchors.centerIn: task2
                z: 2
                color: "red"
            }
            MouseArea
            {
                id: mouseA
                anchors.fill: rectan
                acceptedButtons: Qt.LeftButton | Qt.RightButton
                property var r
                property var g
                property var b
                onClicked: (mouse)=>
                {
                    if (mouse.button === Qt.LeftButton)
                    {
                        r = Math.random();
                        g = Math.random();
                        b = Math.random();
                        rectan.color = Qt.rgba(r, g, b, 1)
                    } else if (mouse.button === Qt.RightButton)
                    {
                        if (rectan.rotation < 360) rotatLeft.start()
                                   else rotatRight.start()
                    }
                }
                onDoubleClicked:
                {
                    if (rectan.radius < 1) toCircle.start()
                    else toRect.start()
                }
            }
        }
        PropertyAnimation
        {
            id: toCircle
            target: rectan
            property: "radius"
            from: 0
            to: rectan.width / 2
            duration: 500
        }
        PropertyAnimation
        {
            id: toRect
            target: rectan
            property: "radius"
            from: rectan.width / 2
            to: 0
            duration: 500
        }
        PropertyAnimation
        {
            id: rotatLeft
            target: rectan
            property: "rotation"
            to: 360
            duration: 1000
        }
        PropertyAnimation
        {
            id: rotatRight
            target: rectan
            property: "rotation"
            to: 0
            duration: 1000
        }
}

