# Time Console

Line Based time command

usage:
```
$ timeconsole ls -l
1:0.006576:total 72
1:0.000007:-rw-r--r--  1 alanhawkins  staff  18043 16 May 07:11 LICENSE
2:0.000001:-rw-r--r--  1 alanhawkins  staff   1237 16 May 17:34 Main.hs
2:0.000006:-rw-r--r--  1 alanhawkins  staff     30 16 May 17:35 README.md
3:0.000007:-rw-r--r--  1 alanhawkins  staff     46 16 May 07:11 Setup.hs
3:0.000006:drwxr-xr-x  5 alanhawkins  staff    170 16 May 17:36 dist
4:0.000002:-rw-r--r--  1 alanhawkins  staff   1955 16 May 17:14 timeconsole.cabal
```

sometimes you need to force the output of the other command to be buffered to fix this use:

```
$timeconsole script -qc <COMMAND>
```

to make it do this always add
```
alias timeconsole='timeconsole script -qc'
```

to your .bashrc
