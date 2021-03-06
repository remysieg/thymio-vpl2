import QtQuick 2.0

QtObject {
    id: userTask
    property string name: "labyrinth"
	property string image: "qrc:/thymio-vpl2/images/userhints/userTask.png"

	property int levelNumber: 4
	property var unitTestLevel: [1,2,3,3,4]
	property var levelDuration: [300,600,300,300]
	//property var levelDuration: [10,10,10,10]    // for debug purpose

    property list<UnitTest> unitTests: [
		UnitTest {
            name: "test_emptyMap"
			image: "qrc:/thymio-vpl2/images/userhints/emptyMap.png"
            combinationRule: "max"
			scoreMax: 0.3
			scoreAverage: 0.1

            scenarios: [
                Scenario {
                    name: "emptyMap"
					simTime: 5
                    initialPosition: Qt.vector3d(100,100,0.0)
                    worldSize: Qt.vector2d(200,200)
                    walls: []
					evaluationMetric: "distance"
					distanceMax: 80
                }
            ]
        },

        UnitTest {
            name: "test_corridor"
			image: "qrc:/thymio-vpl2/images/userhints/corridor.png"
            combinationRule: "mean"

			scoreMax: 0.3
			scoreAverage: 0.1

            scenarios: [
                Scenario {
                    name: "alignedCorridor"
					simTime: 5
					initialPosition: Qt.vector3d(30,10,1.57)
                    worldSize: Qt.vector2d(60,200)
                    walls: [
						Wall {position: Qt.vector2d(20,100); size: Qt.vector3d(2,200,10)},
						Wall {position: Qt.vector2d(40,100); size: Qt.vector3d(2,200,10)}
                    ]
                    evaluationMetric: "tiles"
					tiles: [Qt.vector2d(30,10),Qt.vector2d(30,30),Qt.vector2d(30,50),Qt.vector2d(30,70),Qt.vector2d(30,90),Qt.vector2d(30,110)]
					tileScores: [0,20,40,60,80,100]
                },
                Scenario {
                    name: "UnalignedCorridor"
                    simTime: 5
                    initialPosition: Qt.vector3d(30,10,1.6)
                    worldSize: Qt.vector2d(60,200)
                    walls: [
						Wall {position: Qt.vector2d(20,100); size: Qt.vector3d(2,200,10)},
						Wall {position: Qt.vector2d(40,100); size: Qt.vector3d(2,200,10)}
                    ]
                    evaluationMetric: "tiles"
                    tiles: [Qt.vector2d(30,10),Qt.vector2d(30,30),Qt.vector2d(30,50),Qt.vector2d(30,70),Qt.vector2d(30,90),Qt.vector2d(30,110)]
                    tileScores: [0,20,40,60,80,100]
                }
            ]
        },

        UnitTest {
            name: "test_leftCorner"
			image: "qrc:/thymio-vpl2/images/userhints/cornerLeft.png"
            combinationRule: "mean"

			scoreMax: 0.6
			scoreAverage: 0.3

            scenarios: [
                Scenario {
                    name: "simpleLeftCorner"
					simTime: 7
                    initialPosition: Qt.vector3d(50,50,3.17)
                    worldSize: Qt.vector2d(80,80)
                    walls: [
						Wall {position: Qt.vector2d(20,30); size: Qt.vector3d(2,60,10)},
						Wall {position: Qt.vector2d(40,20); size: Qt.vector3d(2,40,10)},
						Wall {position: Qt.vector2d(50,60); size: Qt.vector3d(60,2,10)},
						Wall {position: Qt.vector2d(60,40); size: Qt.vector3d(40,2,10)}
                    ]
                    evaluationMetric: "tiles"
                    tiles: [Qt.vector2d(70,50),Qt.vector2d(50,50),Qt.vector2d(30,50),Qt.vector2d(30,30),Qt.vector2d(30,10)]
                    tileScores: [0,0,20,40,60]
                },
                Scenario {
                    name: "hardLeftCorner"
					simTime: 7
                    initialPosition: Qt.vector3d(50,50,3.11)
                    worldSize: Qt.vector2d(80,80)
                    walls: [
						Wall {position: Qt.vector2d(20,30); size: Qt.vector3d(2,60,10)},
						Wall {position: Qt.vector2d(40,20); size: Qt.vector3d(2,40,10)},
						Wall {position: Qt.vector2d(50,60); size: Qt.vector3d(60,2,10)},
						Wall {position: Qt.vector2d(60,40); size: Qt.vector3d(40,2,10)}
                    ]
                    evaluationMetric: "tiles"
                    tiles: [Qt.vector2d(70,50),Qt.vector2d(50,50),Qt.vector2d(30,50),Qt.vector2d(30,30),Qt.vector2d(30,10)]
                    tileScores: [0,0,20,40,60]
                }
            ]
        },

        UnitTest {
            name: "test_rightCorner"
			image: "qrc:/thymio-vpl2/images/userhints/cornerRight.png"
            combinationRule: "mean"

			scoreMax: 0.6
			scoreAverage: 0.3

            scenarios: [
                Scenario {
                    name: "simpleRightCorner"
					simTime: 7
                    initialPosition: Qt.vector3d(30,30,1.54)
                    worldSize: Qt.vector2d(80,80)
                    walls: [
						Wall {position: Qt.vector2d(20,30); size: Qt.vector3d(2,60,10)},
						Wall {position: Qt.vector2d(40,20); size: Qt.vector3d(2,40,10)},
						Wall {position: Qt.vector2d(50,60); size: Qt.vector3d(60,2,10)},
						Wall {position: Qt.vector2d(60,40); size: Qt.vector3d(40,2,10)}
                    ]
                    evaluationMetric: "tiles"
                    tiles: [Qt.vector2d(30,10),Qt.vector2d(30,30),Qt.vector2d(30,50),Qt.vector2d(50,50),Qt.vector2d(70,50)]
                    tileScores: [0,0,20,40,60]
                },
                Scenario {
                    name: "hardRightCorner"
					simTime: 7
                    initialPosition: Qt.vector3d(30,30,1.6)
                    worldSize: Qt.vector2d(80,80)
                    walls: [
						Wall {position: Qt.vector2d(20,30); size: Qt.vector3d(2,60,10)},
						Wall {position: Qt.vector2d(40,20); size: Qt.vector3d(2,40,10)},
						Wall {position: Qt.vector2d(50,60); size: Qt.vector3d(60,2,10)},
						Wall {position: Qt.vector2d(60,40); size: Qt.vector3d(40,2,10)}
                    ]
                    evaluationMetric: "tiles"
                    tiles: [Qt.vector2d(30,10),Qt.vector2d(30,30),Qt.vector2d(30,50),Qt.vector2d(50,50),Qt.vector2d(70,50)]
                    tileScores: [0,0,20,40,60]
                }
            ]
		},

		UnitTest {
			name: "test_labyrinth"
			image: "qrc:/thymio-vpl2/images/userhints/labyrinth.png"
			combinationRule: "max"

			scoreMax: 0.4
			scoreAverage: 0.2

			scenarios: [
				Scenario {
					name: "labyrinth"
					simTime: 10
					initialPosition: Qt.vector3d(30,50,-1.57)
					worldSize: Qt.vector2d(120,100)
					walls: [
						Wall {position: Qt.vector2d(60,80); size: Qt.vector3d(80,0.8,10)},
						Wall {position: Qt.vector2d(60,20); size: Qt.vector3d(80,0.8,10)},
						Wall {position: Qt.vector2d(20,50); size: Qt.vector3d(0.8,60,10)},
						Wall {position: Qt.vector2d(100,50); size: Qt.vector3d(0.8,60,10)},
						Wall {position: Qt.vector2d(40,60); size: Qt.vector3d(0.8,40,10)},
						Wall {position: Qt.vector2d(50,40); size: Qt.vector3d(20,0.8,10)},
						Wall {position: Qt.vector2d(70,60); size: Qt.vector3d(20,0.8,10)},
						Wall {position: Qt.vector2d(80,40); size: Qt.vector3d(0.8,40,10)}
					]
					evaluationMetric: "tiles"
					tiles: [Qt.vector2d(30,70),Qt.vector2d(30,50),Qt.vector2d(30,30),Qt.vector2d(50,30),Qt.vector2d(70,30),Qt.vector2d(70,50),
							Qt.vector2d(50,50),Qt.vector2d(50,70),Qt.vector2d(70,70),Qt.vector2d(90,70),Qt.vector2d(90,50),Qt.vector2d(90,30)]
					tileScores:  [-20,0,20,40,60,80,100,120,140,160,180,200]
				}
			]
		}
    ]
}
