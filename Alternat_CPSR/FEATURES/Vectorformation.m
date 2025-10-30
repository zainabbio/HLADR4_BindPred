function [PpseAA]=Vectorformation(x)

Frequency=AminoAcidFrequency(x);
leng=size(x,2);
   exchange=ExchangeFrequency(x);
   hydob_hydop=Hydob_hydopFrequency(x);
   Elect_group=Electronic_group(x);
   R_group=R_groupFrequency(x);
   sum_hydrobic=sum_hydrob(x);
 PpseAA=[Frequency leng  exchange hydob_hydop Elect_group R_group sum_hydrobic];

return