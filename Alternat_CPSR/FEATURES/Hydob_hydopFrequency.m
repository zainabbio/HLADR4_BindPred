function [ hyb_hyp ] = Hydob_hydopFrequency(x)

len=size(x,2);
hyb=0;
hyp=0;
for i=1:len
    if(x(i)=='A' || x(i)=='C'|| x(i)=='F'|| x(i)=='I'|| x(i)=='L'|| x(i)=='M'|| x(i)=='P'|| x(i)=='V'|| x(i)=='W'|| x(i)=='Y')
        hyb=hyb+1;
    elseif(x(i)=='D' || x(i)=='E'|| x(i)=='G'|| x(i)=='H'|| x(i)=='K'|| x(i)=='N'|| x(i)=='Q'|| x(i)=='R'|| x(i)=='S'|| x(i)=='T')
        hyp=hyp+1;
    end
end
hyb_hyp=hyb;
hyb_hyp=[hyb_hyp hyp];
return;
end

