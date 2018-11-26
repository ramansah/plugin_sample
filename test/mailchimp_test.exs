defmodule MailchimpTest do
  use ExUnit.Case
  doctest Mailchimp

  test "greets the world" do
    assert Mailchimp.hello() == :world
  end
end
