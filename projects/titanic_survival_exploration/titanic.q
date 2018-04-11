t:(12#"IBI*SFII*F*S",12#"*";enlist csv)0: `:titanic_data.csv

c:`Sex`Pclass`Embarked`SibSp`Parch`Age
p:raze {[c;n] x where n={count distinct (),x}each x:(cross)over n#enlist c}[c]each 1+til count c
r:raze {`gby xkey update gby:enlist x from select max cpc,idx:last i where cpc=max cpc from update cpc:sums pc from `pc xdesc update pc:{(x-y-x)%z}[n;gbyn;sum n] from ![;();0b;enlist[`gbyn]!enlist parse"(sum;n) fby ([]",sv[";";string x],")"] ?[t;();{x!x}`Survived,x;enlist[`n]!enlist (count;`i)]}each (),/:p;
update mean:avg correct from update correct:prediction=outcome from select prediction:Age<18,outcome:Survived from t where not null Age
`idx xasc select from r where cpc>.8
