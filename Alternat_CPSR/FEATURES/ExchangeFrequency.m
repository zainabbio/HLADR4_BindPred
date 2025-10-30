function [ Frequency ] = ExchangeFrequency(x)
len=size(x,2);

e11=0;
e12=0;
e13=0;
e14=0;
e15=0;
e16=0;
e21=0;
e22=0;
e23=0;
e24=0;
e25=0;
e26=0;
e31=0;
e32=0;
e33=0;
e34=0;
e35=0;
e36=0;
e41=0;
e42=0;
e43=0;
e44=0;
e45=0;
e46=0;
e51=0;
e52=0;
e53=0;
e54=0;
e55=0;
e56=0;
e61=0;
e62=0;
e63=0;
e64=0;
e65=0;
e66=0;

for i=1:len
    if(x(i)=='K' ||x(i)=='H' ||x(i)=='R')
         x(i)=1;
    elseif(x(i)=='D' ||x(i)=='E' ||x(i)=='N'||x(i)=='Q')
         x(i)=2;
    elseif(x(i)=='C')
        x(i)=3;
   elseif(x(i)=='A' ||x(i)=='S' ||x(i)=='P'||x(i)=='G'||x(i)=='T')
        x(i)=4;
   elseif(x(i)=='I' ||x(i)=='L' ||x(i)=='M'||x(i)=='V')  
        x(i)=5;
   elseif(x(i)=='F' ||x(i)=='Y' ||x(i)=='W')
        x(i)=6;
   end
end

for j=1:len-1
    if(x(j)==1 && x(j+1)==1)
        e11=e11+1;
    elseif(x(j)==1 && x(j+1)==2)
        e12=e12+1;
    elseif(x(j)==1 && x(j+1)==3)
        e13=e13+1;
        
   elseif(x(j)==1 && x(j+1)==4)
        e14=e14+1;
        
   elseif(x(j)==1 && x(j+1)==5)
        e15=e15+1;
        
   elseif(x(j)==1 && x(j+1)==6)
        e16=e16+1;
    end
        
end
for j=1:len-1
    if(x(j)==2 && x(j+1)==6)
        e21=e21+1;
    elseif(x(j)==2 && x(j+1)==6)
        e22=e22+1;
    elseif(x(j)==2 && x(j+1)==6)
        e23=e213+1;
        
   elseif(x(j)==2 && x(j+1)==6)
        e24=e24+1;
        
   elseif(x(j)==2 && x(j+1)==6)
        e25=e25+1;
        
   elseif(x(j)==2 && x(j+1)==6)
        e26=e26+1;
    end
        
end
for j=1:len-1
    if(x(j)==3 && x(j+1)==1)
        e31=e11+1;
    elseif(x(j)==3 && x(j+1)==2)
        e32=e32+1;
    elseif(x(j)==3 && x(j+1)==3)
        e33=e33+1;
        
   elseif(x(j)==3 && x(j+1)==4)
        e34=e34+1;
        
   elseif(x(j)==3 && x(j+1)==5)
        e35=e35+1;
        
   elseif(x(j)==3 && x(j+1)==6)
        e36=e36+1;
    end
        
end
for j=1:len-1
    if(x(j)==4 && x(j+1)==1)
        e41=e41+1;
    elseif(x(j)==4 && x(j+1)==2)
        e42=e42+1;
    elseif(x(j)==4 && x(j+1)==3)
        e43=e43+1;
        
   elseif(x(j)==4 && x(j+1)==4)
        e44=e44+1;
        
   elseif(x(j)==4 && x(j+1)==5)
        e45=e45+1;
        
   elseif(x(j)==4 && x(j+1)==6)
        e46=e46+1;
    end
        
end
for j=1:len-1
    if(x(j)==5 && x(j+1)==1)
        e51=e51+1;
    elseif(x(j)==5 && x(j+1)==2)
        e52=e52+1;
    elseif(x(j)==5 && x(j+1)==3)
        e53=e53+1;
        
   elseif(x(j)==5 && x(j+1)==4)
        e54=e54+1;
        
   elseif(x(j)==5 && x(j+1)==5)
        e55=e55+1;
        
   elseif(x(j)==5 && x(j+1)==6)
        e56=e56+1;
    end
        
end
for j=1:len-1
    if(x(j)==6 && x(j+1)==1)
        e61=e61+1;
    elseif(x(j)==6 && x(j+1)==2)
        e62=e62+1;
    elseif(x(j)==6 && x(j+1)==3)
        e63=e63+1;
        
   elseif(x(j)==6 && x(j+1)==4)
        e64=e64+1;
        
   elseif(x(j)==6 && x(j+1)==5)
        e65=e65+1;
        
   elseif(x(j)==6 && x(j+1)==6)
        e66=e66+1;
    end
        
end     
 
    
    Frequency=e11;

Frequency=[Frequency e12];
Frequency=[Frequency e13];
Frequency=[Frequency e14];
Frequency=[Frequency e15];
Frequency=[Frequency e16];
Frequency=[Frequency e21];
Frequency=[Frequency e22];
Frequency=[Frequency e23];
Frequency=[Frequency e24];
Frequency=[Frequency e25];
Frequency=[Frequency e26];
Frequency=[Frequency e31];
Frequency=[Frequency e32];
Frequency=[Frequency e33];
Frequency=[Frequency e34];
Frequency=[Frequency e35];
Frequency=[Frequency e36];
Frequency=[Frequency e41];
Frequency=[Frequency e42];
Frequency=[Frequency e43];
Frequency=[Frequency e44];
Frequency=[Frequency e45];
Frequency=[Frequency e46];
Frequency=[Frequency e51];
Frequency=[Frequency e52];
Frequency=[Frequency e53];
Frequency=[Frequency e54];
Frequency=[Frequency e55];
Frequency=[Frequency e56];
Frequency=[Frequency e61];
Frequency=[Frequency e62];
Frequency=[Frequency e63];
Frequency=[Frequency e64];
Frequency=[Frequency e65];
Frequency=[Frequency e66];

return
end

