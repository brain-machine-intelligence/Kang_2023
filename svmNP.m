clear all;  

% window before NP
c1 = [121 180; 136 180; 151 180; 166 180]; 
% window after NP
c2 = [181 240; 181 225; 181 210; 181 205]; 
c = [c1 c2]; 

load('riNPrnr.mat'); load('rrNPrnr.mat')
crossN = 4; repeatN = 1; sampleN = 400; 


%% ri or rr: match RI trialN and RR trialN
rrRw={};
for i=1:size(c,1)
    t = c(i,:);
    aucs=[];accs=[];specs=[]; senss=[]; xxs={}; yys={}; k=0; 
    for s=1:sampleN
        % rr = 1045+64 = 1109
        rin = svmdata (ri_znpn, t(1), t(2), t(3), t(4));
        rir = svmdata (ri_znpr, t(1), t(2), t(3), t(4));
        
        % ri   64 in reward 549 in noreward
        % 1109-174 = 935
        rrr = svmdata (rr_znpr, t(1), t(2), t(3), t(4));
        
        rrn = randperm(3035,935);
        rrn = rr_znpn(rrn,:);
        rrn = svmdata (rrn, t(1), t(2), t(3), t(4));
        
        % svm
        % indata = [frn; frr; rrn; rrr; rin; rir];
        indata = [rrn; rrr; rin; rir];
        x = ones(1109,1);
        x2 = zeros(1109,1);
        outdata = [x; x2];
        [auc, acc, spec, sens, xx, yy] = SampleNsvm (indata, outdata, crossN, repeatN);
        
        aucs=[aucs; auc];
        accs=[accs; acc];
        specs=[specs; spec];
        senss=[senss; sens];
        
        for j=1:size(xx,1)
            k=k+1;
            xxs{k,1} = xx{j,1};
            yys{k,1} = yy{j,1};
        end
    end
    
    rrRw{i,1}.aucs = aucs;
    rrRw{i,1}.accs = accs;
    rrRw{i,1}.specs = specs;
    rrRw{i,1}.senss = senss;
    rrRw{i,1}.xxs = xxs;
    rrRw{i,1}.yys = yys;
    rrRw{i,1}.input = t;
end
% rirrNP = rrRw;
rirrNP_matchTn = rrRw;
save rirrNP_matchTn rirrNP_matchTn

%% ri or rr: match rewardN and NoRewardN 
rrRw={};
for i=1:size(c,1)
    t = c(i,:);
    aucs=[];accs=[];specs=[]; senss=[]; xxs={}; yys={}; k=0; 
    for s=1:sampleN
        rrn = randperm(3035,64);
        rrn = rr_0npn(rrn,:);
        rrn = svmdata (rrn, t(1), t(2), t(3), t(4));
        
        rrr = randperm(174,64);
        rrr = rr_0npr(rrr,:);
        rrr = svmdata (rrr, t(1), t(2), t(3), t(4));
        
        % ri   64 in reward 1045 in noreward
        rir = svmdata (ri_0npr, t(1), t(2), t(3), t(4));
        
        rin = randperm(1045,64);
        rin = ri_0npn(rin,:);
        rin = svmdata (rin, t(1), t(2), t(3), t(4));
        
        % svm
        % indata = [frn; frr; rrn; rrr; rin; rir];
        indata = [rrn; rrr; rin; rir];
        r = [zeros(64,1); ones(64,1); zeros(64,1); ones(64,1)];
        indata = [indata r];
        
        x = ones(128,1);
        x2 = zeros(128,1);
        outdata = [x; x2];
        [auc, acc, spec, sens, xx, yy] = SampleNsvm (indata, outdata, crossN, repeatN);
        
        aucs=[aucs; auc];
        accs=[accs; acc];
        specs=[specs; spec];
        senss=[senss; sens];
        
        for j=1:size(xx,1)
            k=k+1;
            xxs{k,1} = xx{j,1};
            yys{k,1} = yy{j,1};
        end
    end
    
    rrRw{i,1}.aucs = aucs;
    rrRw{i,1}.accs = accs;
    rrRw{i,1}.specs = specs;
    rrRw{i,1}.senss = senss;
    rrRw{i,1}.xxs = xxs;
    rrRw{i,1}.yys = yys;
    rrRw{i,1}.input = t;
end
% rirrNP = rrRw;
rirrNP_matchRwTn = rrRw;
save rirrNP_matchRwTn rirrNP_matchRwTn
% save NP_1s

