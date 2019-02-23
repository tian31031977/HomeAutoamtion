import QtQuick 2.0

Item {
    id:root
    //Button Dimensions
    property int buttonW: 40
    property int buttonH: 20
    property int buttonRad:4
    property int buttonX: 0
    property int buttonY: 0
    //Button Appearance
    property string textColorInActive : "black"
    property string textColorActive : "lime"
    property string buttonText : "ChBeButton"
    property real buttonTextSize : 8.0
    //Button Coloring
    property color gradColorInActive: "white"
    property color gradColorActive: "gray"
    property color buttonColorInActive: "gray"
    property color buttonColorActive: "white"
    property color borderColor: "black"
    property int borderWidth: 2
    property color statusActiveColor: "lime"
    property color statusInActiveColor: "gray"
    //Button Signal Emitted and Status
    property bool statusButton:false
    signal activated(int number);
    signal deactivated(int number);

    Rectangle{
        id:rect
        width:root.buttonW
        height:root.buttonH
        radius:root.buttonRad
        antialiasing:false
        x:root.buttonX
        y:root.buttonY
        property color gradColor : root.gradColorInActive
        property color mainColor : root.buttonColorInActive
        gradient: Gradient {
                GradientStop { position: 0.0; color: rect.mainColor}
                GradientStop { position: 1.0; color: rect.gradColor }
        }
        border.color: root.borderColor
        border.width: root.borderWidth

        Rectangle{
            id:rectText
            width:root.buttonW - statusRect.width - statusRect.x
            height:root.buttonH
            x:statusRect.width + statusRect.x
            y:0
            color:"transparent"

            Text{
                id:btntext
                anchors.centerIn: parent
                color:root.textColorInActive
                text:root.buttonText
                style: Text.Outline
                font.family: "Verdana"
                renderType: Text.NativeRendering
                font.weight:  Font.DemiBold
                font.pointSize:  root.buttonTextSize
            }
        }

        Rectangle{
            id:statusRect
            width:16
            height:8
            x:4
            y:rect.height/2 - height/2
            border.color: "black"
            border.width: 1

            color : {
                if(root.statusButton==true){
                    statusRect.color = root.statusActiveColor
                }
                else{
                    statusRect.color = root.statusInActiveColor
                }
            }
            radius:2.0
            antialiasing:false
        }

        MouseArea{
            id:ma
            anchors.fill: parent
            onEntered: {
                btntext.color = root.textColorActive
                rect.gradColor = root.gradColorActive
                rect.mainColor = root.buttonColorActive
            }
            onReleased: {
                btntext.color = root.textColorInActive
                rect.gradColor = root.gradColorInActive
                rect.mainColor = root.buttonColorInActive
            }
            onClicked: {
                if(root.statusButton==false){
                    statusRect.color = root.statusActiveColor
                    root.statusButton = true
                    root.activated(0);//is dummy gets overwritten via qml data
                }
                else{
                    statusRect.color = root.statusInActiveColor
                    root.statusButton = false
                    root.deactivated(0);//is dummy gets overwritten via qml data
                }
            }
        }


    }







}

