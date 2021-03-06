#ifndef SIMULATOR_H
#define SIMULATOR_H

#include <enki/enki/PhysicalEngine.h>
#include <aseba/targets/playground/EnkiGlue.h>
#include <aseba.h>

#include <QVariantMap>
#include <QVector>
#include <QVector2D>
#include <QVector3D>
#include <QFile>

class Simulator: public QObject {
	Q_OBJECT

    struct Program {
        QVariantMap events;
        QString source;
        Aseba::BytecodeVector bytecode;
    };

	// TODO: remove struct
    struct Scenario {
        Scenario() : name("newScenario"), simTime(0), initialPosition(20,20,0), worldSize(20,20), evaluationMetric("none") {}

        QString name;
        int simTime;
        QVector3D initialPosition;

        QVector2D worldSize;
        QVector<Enki::PhysicalObject> walls;

        QString evaluationMetric;
        QVector<QVector2D> tiles;
        QVector<int> tileScores;
		double distanceMax;
    };

public slots:
	// Write a string in a log file
	void setNewLogFile(QString newFileName);
	void writeLog(QString logLine);
	// Run the simulation
	double testProgram(QVariant newScenario, QVariantMap newEvents, QString newSource);
	//QString testProgram(QVariant newScenario);
    // Update program information in the simulator (events and source)
	void setProgram(QVariantMap newEvents, QString newSource);
	// Update scenario information in the simulator
	void setScenario(QVariant newScenario);

private:
	double compute_score(QVector<QVector3D> positionLog, QVector<QVector<double>> sensorLog);

	// TODO: remove scenario (so it can be multithreaded)
	QFile logFile;
	Program program;
	Scenario scenario;
};

#endif // SIMULATOR_H
