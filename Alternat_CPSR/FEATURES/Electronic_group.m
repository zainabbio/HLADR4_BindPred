function [ Elec ] = Electronic_group(x)
len=size(x,2);
ed=0;
wed=0;
ea=0;
wea=0;
n=0;
saa=0;
for i=1:len
    if(x(i)=='D' || x(i)=='E'|| x(i)=='P'|| x(i)=='A')
        ed=ed+1;     %Electron donor
    elseif(x(i)=='V'|| x(i)=='L'|| x(i)=='I')
        wed=wed+1;    %weak electron donor
    elseif(x(i)=='K'|| x(i)=='N'|| x(i)=='R')
        ea=ea+1;     %electron acceptor
    elseif(x(i)=='F' || x(i)=='Y'|| x(i)=='M'|| x(i)=='T'|| x(i)=='Q')
        wea=wea+1;   %weak electron acceptor
    elseif(x(i)=='G'|| x(i)=='H'|| x(i)=='W'|| x(i)=='S')
        n=n+1;   %Neutral
    elseif(x(i)=='C')
        saa=saa+1;      %Special AA
    end
end
Elec=[ed wed ea wea n saa];
return;
end

