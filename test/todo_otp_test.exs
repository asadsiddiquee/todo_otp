defmodule TodoOtpTest do
  use ExUnit.Case
  doctest TodoOtp

  test "greets the world" do
    assert TodoOtp.hello() == :world
  end
end
