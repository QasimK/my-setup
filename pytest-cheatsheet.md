# py.test cheat-sheet

```
--version   # shows where pytest was imported from
--fixtures  # show available builtin function arguments
-h | --help # show help on command line and config file options

-pdb        # Open pdb on failure
# Note that on any failure the exception information is stored on sys.last_value, sys.last_type and sys.last_traceback.

-x          # Stop after first failure
--maxfail=2 # Stop after 2 failures

-l | --showlocals # Show local variables

--tb=long    # the default informative traceback formatting
--tb=native  # the Python standard library formatting
--tb=short   # a shorter traceback format
--tb=line    # only one line per failure

--durations=10 # Slowest ten tests

# Running particular tests
py.test test_mod.py   # run tests in module
py.test somepath      # run all tests below somepath
py.test -k stringexpr # only run tests with names that match the
                      # "string expression", e.g. "MyClass and not method"
                      # will select TestMyClass.test_something
                      # but not TestMyClass.test_method_simple
py.test test_mod.py::test_func  # only run tests that match the "node ID",
                                # e.g "test_mod.py::test_func" will select
                                # only test_func in test_mod.py
py.test test_mod.py::TestClass::test_method  # run a single method in
                                             # a single class
```

https://pytest.org/latest/usage.html
