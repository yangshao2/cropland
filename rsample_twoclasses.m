img=temp1;

ind1s = find(img == 1);
ind2s = find(img == 2);

nSamples = 10000; % for example, 10000 samples from each category

% Randomly sample indices
randomSampledIndicesOf1s = randsample(ind1s, nSamples);
randomSampledIndicesOf0s = randsample(ind2s, nSamples);

[row1s, col1s] = ind2sub(size(img), randomSampledIndicesOf1s);
[row2s, col2s] = ind2sub(size(img), randomSampledIndicesOf0s);


