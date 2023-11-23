import QtQuick 2.0
import QtQuick.Layouts 1.11
import QtQuick.Controls 2.1
import QtQuick.Window 2.1
import QtQuick.Controls.Material 2.1
import QtQuick.Shapes 1.6

import io.qt.textproperties 1.0

import 'UI/components/buttons'
import 'UI/components/header'
import 'UI/components/progressBar'



ApplicationWindow {
    id:mainWindow
    width: 640
    height: 500
    visible: true

    property int timeButtonSize: 100;
    property int pauseButtonSize: 80;
    property int otherButtonSize: 60;
    property int progressBarSize: 250;

    property string buttonColor: "transparent";
    property string borderColor: "black";
    property int buttonWidth: 100
    property int buttonHeight: 40

    property string color0: "#00000000";
    property string color1: "#FDED00";
    property string color2: "#444444"
    property string color3: "#6FA8DC";
    property string color4: "#3D257B";
    property string color5: "#FF8400";

    property string title_x_sm: "./UI/src/assets/images/small.png";



    Bridge {
        id: bridge
    }

    Rectangle{
        height: mainWindow.height
        width: mainWindow.width
        color: color1

        anchors.left: mainWindow.left
        anchors.right: mainWindow.right
        ColumnLayout{
            id:mainLayout
            spacing:20

            // Title container
            Rectangle{
                id:titleContainer
                anchors.bottomMargin: 50
                Layout.alignment: Qt.AlignCenter
                color:color0;

                width:  640
                height: 50
                // Program Title
                Rectangle{
                    id:titleImageContainer
                    height: parent.height
                    width: parent.width/2
                    anchors.topMargin: 10
                    anchors.horizontalCenter:parent.horizontalCenter
                    color:color0

                    Image {
                        id: titleImage
                        width: parent.width
                        height: parent.height
                        source: title_x_sm;
                    }
                    Shape {
                        width: 640
                        height: 60
                        anchors.centerIn: parent
                        ShapePath {
                            strokeColor:"black"
                            fillColor: color0
                            startX: 0; startY: 0
                            PathLine { x: 640; y: 0 }
                            PathLine { x: 640; y: 60 }

                            PathLine { x: 140; y: 60 }

                            PathLine { x: 120; y: 40 }
                            PathLine { x: 0; y:40  }
                            PathLine { x: 0; y:0  }

                        }
                    }
                }

            }

            // Top Body container
            Rectangle{
                id:topBodyContainer
                width:progressBarSize
                height:progressBarSize
                Layout.alignment: Qt.AlignCenter
                color:color0

                // Timer container
                Rectangle{
                    id:timerContainer
                    anchors.topMargin: 10
                    anchors.right: topBodyContainer.right
                    anchors.left: topBodyContainer.left
                    width:progressBarSize
                    height:progressBarSize
                    color:color0

                    // Timer
                    RoundProgressBar{
                        size:250;
                        timeText: qsTr("15:30")
                        bgStrokeColor:color3;
                        color1: color2
                        color2: color5
                    }
                }
            }

            Rectangle{
                id:pauseMainContainer

                width: 100 *3
                height: 40;
                Layout.alignment: Qt.AlignCenter

                color:color0
                // Restart Button
                Rectangle{
                    id:tripleButtonContainer
                    width: buttonWidth * 3
                    height: buttonHeight
                    color: "transparent"

                    Rectangle{
                        id:leftButtonContainer
                        height: buttonWidth/2
                        width:buttonWidth
                        color:buttonColor

                        anchors.left: tripleButtonContainer.left
                        LeftButton{
                            id:leftButton
                            buttonHeight: 40
                            buttonWidth: 100
                            displayedText: qsTr("left")
                            buttonColor: buttonColor
                            borderColor: borderColor
                        }
                    }


                    Rectangle{
                        id:centerButtonContainer
                        height: buttonWidth/2
                        width:buttonWidth

                        anchors.right: rightButtonContainer.left
                        anchors.left: leftButtonContainer.right


                        color:buttonColor
                        SquareButton{
                            id:centerButton
                            buttonHeight: 40
                            buttonWidth: 100
                            displayedText:qsTr("pause");
                            buttonColor:buttonColor
                            borderColor: borderColor

                            onPressed: bridge.clock_coundown()
                        }
                    }

                    Rectangle{
                        id:rightButtonContainer
                        height: buttonWidth/2
                        width:buttonWidth
                        color:buttonColor
                        //            anchors.left: centerButtonContainer.right
                        anchors.right: tripleButtonContainer.right

                        RoundButton{
                            id:rightButton
                            buttonHeight: 40
                            buttonWidth: 100
                            displayedText:qsTr("Right");
                            buttonColor: buttonColor
                            borderColor: borderColor



                        }
                    }
                }
            }

            Rectangle{
                id:buttonContainer

                width: fiveMinContainer.width * 2;
                height: fiveMinContainer.height;

                Layout.alignment: Qt.AlignCenter;
                color: color0

                // Time button Layout
                RowLayout{
                    // Add 10 minutes
                    Rectangle{
                        id:fiveMinContainer
                        height: 40
                        width:timeButtonSize
                        color:color0

                        LeftButton{
                            id:fiveMinuteButton
                            displayedText:"+10";
                            buttonColor:color0
                            borderColor: "black"

                            anchors.top: fiveMinContainer.top
                            anchors.bottom: fiveMinContainer.bottom
                            anchors.left: fiveMinContainer.left
                            anchors.right: fiveMinContainer.right
                            onPressed: bridge.add_time(10)

                        }
                    }
                    // Add 15 minutes
                    Rectangle{
                        id:tenMinContainer
                        height: 40
                        width:timeButtonSize
                        color:color0

                        RoundButton{
                            id:tenMinuteButton
                            displayedText: "+15"
                            buttonColor:color0
                            borderColor: "black"

                            anchors.top: tenMinContainer.top
                            anchors.bottom: tenMinContainer.bottom
                            anchors.left: tenMinContainer.left
                            anchors.right: tenMinContainer.right
                            onPressed: bridge.add_time(15)

                        }
                    }

                }

            }
        }

    }
}








