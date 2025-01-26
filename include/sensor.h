#ifndef SENSOR_H
#define SENSOR_H

#include <stdint.h>

void read_sensor_data(uint16_t *data);
void process_data(uint16_t *data);
void print_data(uint16_t *data, int size);

#endif
