% Please refer the following link for details: https://github.com/Soumyabrata/rough-sets

% =========================================================
function [Precision,Recall,FScore,acc] = accuracy(ThreshImage,GroundTruth)
% This function calculates the accuracy.

    [r1,c1]=size(ThreshImage);
    %[r2,c2]=size(GroundTruth);
    
    GroundTruth1=GroundTruth;
    [r,c]=size(GroundTruth1);
GroundTruth=zeros(r,c);
for i=1:r
    for j=1:c
        if GroundTruth1(i,j)<128
            GroundTruth(i,j)=0;
        else
            GroundTruth(i,j)=1;
        end
    end
end
    
    
%     if (r1==r)&& (c1==c)
%         disp ('Dimension of the two images are equal.');
%     else
%         disp ('Dimension of the two images are not in order');
%     end
    
    TP=0;   FP=0;   TN=0;   FN=0;
    

    for i=1:r1
        for j=1:c1
            if (GroundTruth(i,j)==1 && ThreshImage(i,j)==1)   % TP condition
                TP=TP+1;
            elseif ((GroundTruth(i,j)==0)&& (ThreshImage(i,j)==1))   % FP condition
                FP=FP+1;
            elseif ((GroundTruth(i,j)==0)&& (ThreshImage(i,j)==0))   % TN condition
                TN=TN+1;
            elseif ((GroundTruth(i,j)==1)&&(ThreshImage(i,j)==0))   % FN condition
                FN=FN+1;
            end
        end
    end
    
    Precision=TP/(TP+FP);
    Recall=TP/(TP+FN);
    
    FScore=(2*Precision*Recall)/(Precision+Recall);
    
    P = FN + TP;
    N = FP + TN;
    acc = (TP+TN)/(P+N);
    
%     TF1 = isnan(Precision);
%     TF2 = isnan(Recall);
%     TF3 = isnan(FScore);
%     
%     if (TF1==1)
%         Precision=1;
%     elseif (TF2==1)
%         Recall=1;
%     elseif (TF3==1)
%         FScore=1;
%     end

%     if (TP==0 && FP==0)
%         Precision=1;
%     else
%         Precision=TP/(TP+FP);
%     end
%     
%     if (TP==0 && FN==0)
%         Recall=1;
%     else
%         Recall=TP/(TP+FN);
%     end
%     
%     FScore=(2*Precision*Recall)/(Precision+Recall);
    
    