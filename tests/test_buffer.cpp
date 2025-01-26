#include <gtest/gtest.h>
#include <cstdlib>
#include <cstdint>
#include <stdexcept>

// Mock BUFFER_SIZE and functions
#define BUFFER_SIZE 10

void read_sensor_data(uint16_t *data) {
    for (int i = 0; i <= BUFFER_SIZE; i++) { // Intentional overflow for testing
        data[i] = rand() % 1024;
    }
}

TEST(SensorTest, BufferOverflow) {
    uint16_t data[BUFFER_SIZE];
    ASSERT_THROW(read_sensor_data(data), std::out_of_range);
}

TEST(SensorTest, NoBufferOverflow) {
    uint16_t data[BUFFER_SIZE];
    EXPECT_NO_THROW({
        for (int i = 0; i < BUFFER_SIZE; i++) {
            data[i] = rand() % 1024;
        }
    });
}
