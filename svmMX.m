clear all;  

% window before MX
c1 = [121 180; 136 180; 151 180; 166 180]; 
% window after MX
c2 = [181 240; 181 225; 181 210; 181 205]; 

load('ri.mat'); load('rr.mat')
crossN = 4; repeatN = 1; sampleN = 400; 


%% ri or rr: : match RI trialN and RR trialN
i=0; rrRw={};
for ci=1:size(c1,1)
    ci
    for cj=1:size(c2,1)
        t = [c1(ci,1) c1(ci,2) c2(cj,1) c2(cj,2)];
        i = i+1;
        aucs=[];accs=[];specs=[]; senss=[]; xxs={}; yys={}; k=0;
        
        for s=1:sampleN
            % rr = 120+170 = 290     
             % rr = 117+173 = 290     
            rrn = svmdata (rr0nx, t(1), t(2), t(3), t(4));            
            rrr = svmdata (rr0rx, t(1), t(2), t(3), t(4));
            
            % ri   58 in reward 549 in noreward
            % 290-58 = 232
            % 290-63 = 227
            rir = svmdata (ri0rx, t(1), t(2), t(3), t(4));
            
%             rin = randperm(549,232);
            rin = randperm(544,227);
            rin = ri0nx(rin,:);
            rin = svmdata (rin, t(1), t(2), t(3), t(4));
            
            % svm
            % indata = [frn; frr; rrn; rrr; rin; rir];
            indata = [rrn; rrr; rin; rir];
            x = ones(290,1);
            x2 = zeros(290,1);
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
end
rirrMX_matchTn = rrRw;
save rirrMX_matchTn rirrMX_matchTn

%% ri or rr: match rewardN and NoRewardN 
i=0; rrRw={};
for ci=1:size(c1,1)
    ci
    for cj=1:size(c2,1)
        t = [c1(ci,1) c1(ci,2) c2(cj,1) c2(cj,2)];
        i = i+1;
        aucs=[];accs=[];specs=[]; senss=[]; xxs={}; yys={}; k=0;
        
        for s=1:sampleN
%             rrn = randperm(120,58);
            rrn = randperm(117,63);
            rrn = rr0nx(rrn,:);
            rrn = svmdata (rrn, t(1), t(2), t(3), t(4));
            
%             rrr = randperm(170,58);
            rrr = randperm(173,63);
            rrr = rr0rx(rrr,:);
            rrr = svmdata (rrr, t(1), t(2), t(3), t(4));
            
            % ri   58 in reward 549 in noreward
            % 290-58 = 232
            rir = svmdata (ri0rx, t(1), t(2), t(3), t(4));
            
%             rin = randperm(549,58);
            rin = randperm(544,63);
            rin = ri0nx(rin,:);
            rin = svmdata (rin, t(1), t(2), t(3), t(4));
            
            % svm
            % indata = [frn; frr; rrn; rrr; rin; rir];
            indata = [rrn; rrr; rin; rir];
%             x = ones(116,1);            
%             x2 = zeros(116,1);
            x = ones(126,1);            
            x2 = zeros(126,1);
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
end
rirrMX_matchRwTn = rrRw;
save rirrMX_matchRwTn rirrMX_matchRwTn

