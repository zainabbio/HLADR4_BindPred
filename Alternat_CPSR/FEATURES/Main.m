clc;clear all;



   feature_train=[];
   feature_test=[];
   feature_d_test1=[];

[ Nam_seq_train seqdata_train] = fastaread('alt-tr-neg.txt');
%[ Nam_seq_test seqdata_test] = fastaread('testdata1.doc');


Total_Seq_train=size(Nam_seq_train,2);
%Total_Seq_test=size(Nam_seq_test,2);

    for i=1:Total_Seq_train
        i
       seq=seqdata_train(i);
       seq=cell2mat(seq);
      feature_train=[feature_train ; Vectorformation(seq)];
    end
    HLA_alternat_neg_CPCR=feature_train;
    save HLA_alternat_neg_CPCR HLA_alternat_neg_CPCR;
    
    csvwrite('HLA_alternat_neg_CPCR.csv',HLA_alternat_neg_CPCR)
%     for i=1:Total_Seq_test
%        seq=seqdata_test(i);
%        seq=cell2mat(seq);
%       feature_test=[feature_test ; Vectorformation(seq)];
%     end
%     feature_d_test1=feature_test';
%     save split_train feature_d1;
%     save split_test feature_d_test1;
%    
   
% av1=mean(feature_d1(1:435))
% av2=mean(feature_d1(436:587))
% av3=mean(feature_d1(588:1898))
% av4=mean(feature_d1(1899:1949))
% av5=mean(feature_d1(1950:2059))
