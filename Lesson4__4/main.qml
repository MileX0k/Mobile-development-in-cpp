import QtQuick 2.15
import QtQuick.Window 2.15
import github.com.MileX0k 1.0
import QtCharts 2.15
import QtQuick.Controls 2.15

Window {
    width: 1000
    height: 480
    visible: true
    title: qsTr("Lesson 3")


//=============================TASK 1==============================

    function aawdaw()
    {
        var i = Descriptions.addInMap();
        console.log(i);
    }

    Rectangle
    {
        id: task1
        width: parent.width / 2
        height: parent.height
        anchors.left: parent.left
        color: "#7422b2"

        Descriptions
        {
            id: dis
            Component.onCompleted:
            {
                Descriptions.selectedColor
            }
        }


        ChartView
        {
            id: lineChart
            title: qsTr("График функции")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.margins: 50
            width: parent.width - 100
            height: parent.height - 150
            antialiasing: true
//            backgroundColor: Qt.rgba(Descriptions.r, Descriptions.g,Descriptions.b, 1)
            LineSeries
            {
                id: lineSeries
//                XYPoint { x: 0; y: -2;}
//                XYPoint { x: 2; y: 4;}
//                XYPoint { x: 2.4; y: 4.1;}
//                XYPoint { x: 5; y: 8;}
//                XYPoint { x: 5.9; y: 1.2;}
            }
            Component.onCompleted:
            {
                aawdaw();

//                lineSeries.append(2,4);
                //Descriptions.initializingY(Descriptions.sin);

            }

        }

        ComboBox
        {
            id: chartTypeBox
            anchors.top: lineChart.bottom
            anchors.horizontalCenter: task1.horizontalCenter
            anchors.margins: 20
            Component.onCompleted:
            {
                console.log(Descriptions.sin)
            }
        }


    }



//=============================TASK 2==============================
        Rectangle
        {
            id: task2
            width: parent.width / 2
            height: parent.height
            anchors.left: task1.right

        }


}
