import QtQuick 2.0
import Sailfish.Silica 1.0
import custom.QuadraticEquation 1.0

Page {
    id: page

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All

    QuadraticEquation {
        id: qe
    }

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: qsTr("Show Page 2")
                onClicked: pageStack.push(Qt.resolvedUrl("SecondPage.qml"))
            }
        }

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
//        PageHeader {
//            text: "График квадратного уравнения"
//        }

        Column {
            id: column
            width: page.width
            spacing: 20
            Label {
                text: "Enter an equation:"
                font.pixelSize: 50
            }

            Row {
                TextField {
                    id: a_coeff
                }
                Label {
                    text: "x^2 + "
                }
                TextField {
                    id: b_coeff
                }
                Label {
                    text: "x + "
                }
                TextField {
                    id: c_coeff
                }
            }
//            Row {
//                Label {
//                    text: "minX: "
//                }
//                TextField {
//                    id: min_x
//                }
//                Label {
//                    text: "maxX: "
//                }
//                TextField {
//                    id: max_x
//                }
//                Label {
//                    text: "minY: "
//                }
//                TextField {
//                    id: min_y
//                }
//                Label {
//                    text: "maxY: "
//                }
//                TextField {
//                    id: max_y
//                }
//            }

            Button {
                text: "Run"
                onClicked: {
                    if (b_coeff.text * b_coeff.text - 4 * a_coeff.text * c_coeff.text >= 0) {
                        qe.findRoots(a_coeff.text, b_coeff.text, c_coeff.text)
                        res_1.text = qe.res1
                        res_2.text = qe.res2
                        mycanvas.a = a_coeff.text
                        mycanvas.b = b_coeff.text
                        mycanvas.c = c_coeff.text
                        mycanvas.requestPaint()
                    } else {
                        error.text = "Error: discriminant is less than zero!"
                    }
                }
            }

            Row {
                Label {
                    text: "x1 = "
                }
                Label {
                    id: res_1
                }
                Label {
                    text: " x2 = "
                }
                Label {
                    id: res_2
                }
            }

            Label {
                id: error
            }

            Canvas {
                id: mycanvas
                width: parent.width
                height: parent.width
                property double a: 0
                property double b: 0
                property double c: 0
                onPaint: {
                    var ctx = getContext("2d")
                    var canvWidth = mycanvas.width - 20
                    var canvHeight = mycanvas.height - 20
                    var stepX = 70
                    var stepY = 70
                    var minX = -50
                    var maxX = 50
                    var minY = -50
                    var maxY = 50

                    ctx.fillStyle = "white"
                    ctx.fillRect(0, 0, mycanvas.width, mycanvas.height)
                    ctx.fillText("Plot", mycanvas.width/2, 10)

                    // Ось X
                    ctx.beginPath()
                    ctx.moveTo(0, mycanvas.height/2)
                    ctx.lineTo(mycanvas.width, mycanvas.height/2)
                    ctx.strokeStyle = "black"
                    ctx.lineWidth = 1
                    ctx.stroke()

                    // Ось Y
                    ctx.beginPath()
                    ctx.moveTo(mycanvas.width/2, 0)
                    ctx.lineTo(mycanvas.width/2, mycanvas.height)
                    ctx.strokeStyle = "black"
                    ctx.lineWidth = 1
                    ctx.stroke()

                    // Разметка по x
                    ctx.font = "normal 12pt sans-serif";
                    var m = 0, n = 0
                    var i, j
                    ctx.beginPath()
                    ctx.strokeStyle = "black"
                    ctx.lineWidth = 1
                    for (i = mycanvas.width/2, j = mycanvas.width/2; i < mycanvas.width, j > 0; i += stepX, j -= stepX) {
                        ctx.moveTo(i, mycanvas.height/2);
                        ctx.lineTo(i, mycanvas.height/2 + 5);
                        ctx.strokeText(m, i, mycanvas.height/2 + 10);
                        ctx.moveTo(j, mycanvas.height/2);
                        ctx.lineTo(j, mycanvas.height/2 + 5);
                        ctx.strokeText(n, j, mycanvas.height/2 + 10);
                        m += 10;
                        n -= 10;
                    }
                    ctx.stroke()

                    // Разметка по y
                    ctx.font = "normal 12pt sans-serif";
                    var k = 0, l = 0
                    ctx.beginPath()
                    ctx.strokeStyle = "black"
                    ctx.lineWidth = 1
                    for (i = mycanvas.height/2, j = mycanvas.height/2; i < mycanvas.height, j > 0; i += stepY, j -= stepY) {
                        ctx.moveTo(mycanvas.width/2, i);
                        ctx.lineTo(mycanvas.width/2 + 5, i);
                        ctx.strokeText(l, mycanvas.width/2 + 10, i);
                        ctx.moveTo(mycanvas.width/2, j);
                        ctx.lineTo(mycanvas.width/2 + 5, j);
                        ctx.strokeText(k, mycanvas.width/2 + 10, j);
                        k += 10;
                        l -= 10;
                    }
                    ctx.stroke()
                    ctx.closePath()

                    // График функции
                    ctx.beginPath()
                    if(a != 0 || b != 0 || c != 0)
                    {
                        ctx.strokeStyle = "red"
                        ctx.lineWidth = 2
                    }
                    var stX = stepX / 10
                    var stY = stepY / 10
                    var y = 0
                    var newX, newY
                    var count = 0
                    for (var x0 = minX, s = 0; x0 < maxX, s < maxX - minX; x0++, s++) {
                        y = a * x0 * x0 + b * x0 + c;

                        newX = 10 + s * stX;

                        if (y >= 0)
                            newY = 10 + stY * (maxY - y)
                        else
                            newY = 360 + stY * (-y)

                        if (newY > 10 && newY < mycanvas.height - 10) {
                            count++;
                            if (count === 1)
                                ctx.moveTo(newX, newY)
                            else
                                ctx.lineTo(newX, newY)
                        }
                    }
                    ctx.stroke()
                    ctx.closePath()
                }
            }
        }
    }
}
