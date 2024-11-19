<< EOF
ubuntu $ at 08:26
warning: commands will be executed using /bin/sh
at> bash test.sh # press enter
at> <EOT> # ctrl+d
EOF

# echo "bash test.sh" | at 08:31
<< ATQ
atq  # to see the pending jobs
1       Tue Nov 19 08:19:00 2024 a root
ATQ

<<ATRM
to remove a job 
atrm 1 # atrm [jobid]
ATRM
