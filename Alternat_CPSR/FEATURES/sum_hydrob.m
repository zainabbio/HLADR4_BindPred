function [V1]=sum_hydrob(x)
HP;

VC =[];
V1=0;
for i=1:size(x,2)
    switch(x(i))
        case 'A'
            VC= [VC A];
        case 'C'
            VC= [VC C];
        case 'D'
            VC= [VC D];
        case 'E'
            VC= [VC E];
        case 'F'
            VC= [VC F];
        case 'G'
            VC= [VC G];
        case 'H'
            VC= [VC H];
        case 'I'
            VC= [VC I];
        case 'K'
            VC= [VC K];
        case 'L'
            VC= [VC L];
         case 'M'
            VC= [VC M];
        case 'N'
            VC= [VC N];
        case 'P'
            VC= [VC P];
        case 'Q'
            VC= [VC Q];
        case 'R'
            VC= [VC R];
         case 'S'
            VC= [VC S];
        case 'T'
            VC= [VC T];
        case 'V'
            VC= [VC V];
        case 'W'
            VC= [VC W];
        case 'Y'
            VC= [VC Y];
                            
    end

end
V1=sum(VC);

return