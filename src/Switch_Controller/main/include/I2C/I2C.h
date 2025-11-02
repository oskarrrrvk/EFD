#ifndef I2C_H
#define I2C_H

#include "driver/i2c_master.h"

void config_i2c_bus(i2c_master_bus_handle_t *, i2c_master_dev_handle_t *);
esp_err_t read_i2c_sensor(i2c_master_dev_handle_t, uint8_t, uint8_t *, size_t);

#endif