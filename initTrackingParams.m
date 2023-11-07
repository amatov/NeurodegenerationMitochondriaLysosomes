function initTrackingParames

for dataset = 1:2 %; % set this to 1 or 2 for dataset 1 or 2

tic

if dataset == 1
    N = 1759;
    namepattern = '\cands1\feats%04d';
    resfile = '\tracks1.mat';
elseif dataset == 2
    N = 1646;
    namepattern = '\cands2\feats%04d';
    resfile = '\tracks2.mat';
end

%             .xCoord      : x-coordinates of detected features.
%                            1st column: value, 2nd column: standard
%                            deviation (zeros if not available).
%             .yCoord      : y-coordinates of detected features.
%                            1st column: value, 2nd column: standard
%                            deviation (zeros if not available).
%             .zCoord      : z-coordinates of detected features.
%                            1st column: value, 2nd column: standard
%                            deviation (zeros if not available).
%                            Optional. Skipped if problem is 2D. Default: zeros.
%             .amp         : "Intensities" of detected features.
%                            1st column: values (ones if not available),
%                            2nd column: standard deviation (zeros if not
%                            available).

spots = [];
for i = 1:N
    load(sprintf(namepattern, i));
    pad = zeros(size(feats.pos, 1),1);
    % Which one is x? 1 or 2?
    spots(i,1).xCoord = [feats.pos(:,1), pad];
    spots(i,1).yCoord = [feats.pos(:,2), pad];
    spots(i,1).amp    = [ones(size(pad)), pad];
    clear feats;
end

costMatrices(1).funcName = 'costMatRandomDirectedSwitchingMotionLink';
costMatrices(1).parameters.linearMotion = 0;
costMatrices(1).parameters.minSearchRadius = 2;
costMatrices(1).parameters.maxSearchRadius = 5;
costMatrices(1).parameters.brownStdMult = 3;
costMatrices(1).parameters.useLocalDensity = 1;
costMatrices(1).parameters.nnWindow = 5;
costMatrices(1).parameters.kalmanInitParam = [];
costMatrices(1).parameters.diagnostics = 1758;

costMatrices(2).funcName = 'costMatRandomDirectedSwitchingMotionCloseGaps';
costMatrices(2).parameters.linearMotion = 0;
costMatrices(2).parameters.minSearchRadius = 2;
costMatrices(2).parameters.maxSearchRadius = 5;
costMatrices(2).parameters.brownStdMult = [3; 3; 3; 3; 3];
costMatrices(2).parameters.useLocalDensity = 1;
costMatrices(2).parameters.nnWindow = 5;
costMatrices(2).parameters.brownScaling = [0.5000 0.0100];
costMatrices(2).parameters.timeReachConfB = 5;
costMatrices(2).parameters.ampRatioLimit = [0.5000 2];
costMatrices(2).parameters.lenForClassify = 5;
costMatrices(2).parameters.linStdMult = [3; 3; 3; 3; 3];
costMatrices(2).parameters.linScaling = [1 0.0100];
costMatrices(2).parameters.timeReachConfL = 5;
costMatrices(2).parameters.maxAngleVV = 30;
costMatrices(2).parameters.gapPenalty = 1.5000;
costMatrices(2).parameters.resLimit = [];

gapCloseParam.timeWindow = 5;
gapCloseParam.minTrackLen = 1;
gapCloseParam.diagnostics = 1;
gapCloseParam.mergeSplit = 0;

kalmanFunctions.reserveMem = 'kalmanResMemLM';
kalmanFunctions.initialize = 'kalmanInitLinearMotion';
kalmanFunctions.calcGain = 'kalmanGainLinearMotion';
kalmanFunctions.timeReverse = 'kalmanReverseLinearMotion';

probDim = 2;

verbose = 1;

tracksFinal = trackCloseGapsKalmanSparse(spots, costMatrices, gapCloseParam, kalmanFunctions, probDim, 0, verbose);

save(resfile, 'tracksFinal');

toc

end % dataset

end % function
