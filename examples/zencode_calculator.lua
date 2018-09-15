-- Zencode test

Calculator = { numbers = {} }

function Calculator:Reset ()
   self.numbers = {}
end

function Calculator:Enter (number)
   table.insert(self.numbers, number)
end

function Calculator:Add ()
   self.result = 0
   for i = 1, #self.numbers do
      self.result = self.result + self.numbers[i]
   end
end

-- steps

Before(function()
	  Calculator:Reset()
end)

Given("I have entered '(%w+)' into the calculator", function (number)
         Calculator:Enter(tonumber(number))
end)

When("I press add", function ()
		Calculator:Add()
end)

Then("the result should be '(%w+)' on the screen", function (number)
		assert(Calculator.result == tonumber(number),
			   "Expected " .. number .. ", was " .. Calculator.result)
end)


-- execution
content(ZEN)
print "=== Zencode begin"
ZEN:begin()


addition = [[
Feature: Addition
  In order to avoid silly mistakes
  As a math idiot
  I want to be told the sum of two numbers

  Scenario Outline: Add two numbers
    Given I have entered '1' into the calculator
    And I have entered '1' into the calculator
    When I press add
    Then the result should be '2' on the screen
]]


ZEN:parse(addition)
-- content(ZEN.matches)
print("Matches: " .. #ZEN.matches)
ZEN:run()
