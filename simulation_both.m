filePath = 'end_effector_positions.csv';
filePath2 = 'end_effector_positions_random.csv';

data1 = readmatrix(filePath);
data2 = readmatrix(filePath2);

data = [data1; data2];

x = data(:, 1);
y = data(:, 2);
z = data(:, 3);

numBins = 10;

binX = discretize(x, linspace(min(x), max(x), numBins));
binY = discretize(y, linspace(min(y), max(y), numBins));
binZ = discretize(z, linspace(min(z), max(z), numBins));

counts = zeros(numBins, numBins, numBins);

for i = 1:length(x)
    if ~isnan(binX(i)) && ~isnan(binY(i)) && ~isnan(binZ(i))
        counts(binX(i), binY(i), binZ(i)) = counts(binX(i), binY(i), binZ(i)) + 1;
    end
end

density = counts(sub2ind(size(counts), binX, binY, binZ));

figure;
scatter3(x, y, z, 20, density, 'filled');
xlabel('X');
ylabel('Y');
zlabel('Z');
title('3D Plot of XYZ Points with Density');

colorbar;
axis equal;
