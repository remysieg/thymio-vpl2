import QtQuick 2.0

QtObject {
    property string name: "newScenario"

    // Time of simulation in seconds
    property double simTime: 10
    // Starting position of the robot (x,y,theta)
    property vector3d initialPosition: Qt.vector3d(10,10,0.0)

    // Size of the world (x,y)
    property vector2d worldSize: Qt.vector2d(20,20)
    // List of walls
    property list<Wall> walls

    // Metric use to score the program
    // Possible choices: none, tiles, linearity, distance, sensors
    property string evaluationMetric: "none"
	// Diverse information to compute score (depend on the chose metric)
    property var tiles: []
    property var tileScores: []
	property double distanceMax: 0.0
}
