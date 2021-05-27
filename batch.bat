@echo off
echo This should find that file2 is too much and file5 is missing

    set test=test
    echo test: %test%
:: interating over all files
for %%f in (*.*) do (
    set wasexpected=test
    echo wasexpected: %wasexpected%

    echo found: %%f
    for /f %%e in (expected) do (
        if %%e==%%f set wasexpected="true"
    )
    @REM if %wasexpected%=="false" echo test
)


:: iterating over the content of expected
@REM for /f %%e in (expected) do (
@REM     echo expected: %%e
@REM )


REM pause