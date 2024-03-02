count=0;
for www=2.5:0.5:6.5
count=count+1
for j=1:20000
    j
    m=tt(j,:);
    a=reshape(m,46,23);
for i=1:23
[pk,lk,w,p] = findpeaks(a(:,i),'MinPeakHeight',0,'MinPeakDistance',4,'NPeaks',3,'Sortstr','descend');
pk=pk(w>www&pk>0.3);
[s(j,i) c]=size(pk);
end
end

s(s==0)=1;
s(s>1)=2;
y_true=reshape(k,20000*23,1);
y_pred=reshape(s,20000*23,1);

% Generate confusion matrix
[C, order] = confusionmat(y_true,y_pred);
% Display the confusion matrix
disp('Confusion Matrix:');
disp(C);

% Calculate metrics
TP = C(1,1);
TN = C(2,2);
FP = C(2,1);
FN = C(1,2);

accuracy = (TP + TN) / sum(C(:));
precision = TP / (TP + FP);
recall = TP / (TP + FN);
f1Score = 2 * ((precision * recall) / (precision + recall));
f(count)=f1Score
end

