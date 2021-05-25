#include "cos.h"
#include <gtest/gtest.h>

TEST(cos, test) {
  EXPECT_EQ(DOcos(60), 0.5);
}
