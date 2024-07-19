-- EXAMPLE USAGE FOR MACROS -|- For the newbies
-- LQ_getFEnv
LQ_getFEnv(0) -- STACK SET TO 0 -|- returns the global environment of the current script.
LQ_getFEnv()["print"]("Hello, World!") -- access the 'print' function in the environment
LQ_getFEnv().VariableTest = "Hi!"

-- LQ_encryptString
LQ_encryptString("Hello, World!") -- PROTECTS THE FOLLOWING STRING: "Hello, World!" -|- EXPECTED OUTPUT: LQ_encryptString("48656c6c6f2c20576f726c6421")
-- NO's:
local TestVariable = "Hi!"
LQ_encryptString(TestVariable) -- WILL RETURN NIL

LQ_encryptString(someOtherFunction("Hello, World!")) -- WILL RETURN NIL

LQ_encryptString(123) -- WILL RETURN A STRING BUT NOT WHAT YOU WOULD EXPECT
-- YES'
local TestVariable = LQ_encryptString("Hi!") -- WORKS

someOtherFunction(LQ_encryptString("Hello, World!")) -- WORKS

LQ_encryptString("{") -- WORKS

-- LQ_protectFunction
LQ_protectFunction({print, loadstring}) -- PROTECTS THE FOLLOWING FUNCTIONS: print and loadstring
LQ_protectFunction({someOtherFunction}) -- PROTECTS "someOtherFunction"
LQ_protectFunction({function()return "foobar" end}) -- ALSO WORKS

-- LQ_protectTable
local TableExample = {"Hello",","," ","World","!"}
LQ_protectTable(TableExample) -- WORKS, PROTECTS YOUR TABLE
LQ_protectTable({"foo","/","bar"}) -- WORKS

-- NO's:
LQ_protectTable(TableExample)
LQ_protectTable(TableExample) -- YOU CANT PROTECT THE TABLE TWICE, WILL NOT WORK

LQ_protectTable(TableExample)
TableExample[1] = "Hi" -- WILL ERROR BECAUSE IT IS PROTECTED

-- YES':
LQ_protectTable(TableExample) -- Only use function once

LQ_protectTable(TableExample)
local TestVariable2 = TableExample[1] -- You can access the table's contents but not overwrite it
someOtherFunction(TestVariable2)

-- Filler Macros
-- LQ_gaslightBenchmark

LQ_gaslightBenchmark() -- initializes time manipulation
