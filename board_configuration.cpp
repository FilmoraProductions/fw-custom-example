#include "pch.h"

Gpio getWarningLedPin() {
	// this board has no warning led
	return Gpio::Unassigned;
}

Gpio getCommsLedPin() {
	return Gpio::E3;
}

Gpio getRunningLedPin() {
	return Gpio::Unassigned;
}
