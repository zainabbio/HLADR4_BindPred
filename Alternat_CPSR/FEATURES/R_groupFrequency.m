function [ R_group ] = R_groupFrequency(x)
len=size(x,2);
npa=0;
g=0;
ch=0;
np=0;
pu=0;

for i=1:len
    if(x(i)=='A' || x(i)=='I'|| x(i)=='L'|| x(i)=='V')
        npa=npa+1;     %Non polar aliphatic
    elseif(x(i)=='G')
        g=g+1;  %Glyscine
    elseif(x(i)=='F'|| x(i)=='M'|| x(i)=='P'|| x(i)=='W')
        np=np+1;    %non polar
    elseif(x(i)=='D'|| x(i)=='E'|| x(i)=='H'|| x(i)=='K'|| x(i)=='R')
        ch=ch+1;     %charged
    elseif(x(i)=='C' || x(i)=='N'|| x(i)=='Q'|| x(i)=='S'|| x(i)=='T'|| x(i)=='Y')
        pu=pu+1;   %Polar uncharged
    
    end
end
R_group=[npa g np pu ch];
return;

end

