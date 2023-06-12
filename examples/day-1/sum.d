/*
  Example sum program with unit tests
*/

uint sum(ubyte[] nums) {
  uint result;
  for (int i=0; i!=nums.length; ++i) {
    result += nums[i];
  }
  return result;
}

// Reference Implementation or Reference Function
uint sum_test(ubyte[] nums) {
  uint result;
  foreach (num; nums) {
    result += num;
  }
  return result;
}

unittest {
  import std.stdio;
  import std.random;

  ubyte[] nn;

  for (size_t i=0; i!=10; ++i) {
    nn.length = uniform(0, 1024); // Uniform distribution randomness
    foreach (ref n; nn) {
      n = uniform!"[]"(cast(ubyte) 0U, cast(ubyte) 255U); // 255U -> all tests pass, 256U -> some tests fail
    }

    if (sum(nn) == sum_test(nn)) {
      writeln("Test passed!");
    }
    else {
      assert (false, "Test failed!");
    }
  }
}

unittest {
  import std.stdio;
  if (sum([0x42, 0x23, 0x12, 0x02]) == 0x79) { // 0x42 passes, 0x40 fails
    writeln("Test passed!");
  }
  else {
    assert(false, "Test failed!");
  }
}

unittest {
  import std.stdio;
  if (sum([]) == 0x0) { // tests with operands as 0
    writeln("Test passed!");
  }
  else {
    assert(false, "Test failed!");
  }
}
