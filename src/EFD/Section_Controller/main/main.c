/*
 * SPDX-FileCopyrightText: 2010-2022 Espressif Systems (Shanghai) CO LTD
 *
 * SPDX-License-Identifier: CC0-1.0
 */
#include "rail_section/section.h"

void app_main(void)
{
    config_rail_sections();
    while(1)
        read_rail_section_states();
}
