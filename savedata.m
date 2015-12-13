function savedata( options,roc_results,file )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    if isstruct(roc_results)
        fprintf(file,'%f,',roc_results.area);
        fprintf(file,'%f,',roc_results.error);
        fprintf(file,'%f',roc_results.threshold);
    else
        fprintf(file,',,,');
    end;
    if isstruct(options)
        if isfield(options,'Scheme') < 1
            options.Scheme = 'R';
        end;
        if isfield(options,'T') < 1
            options.T = 5;
        end;
        if isfield(options,'dt') < 1
            if options.Scheme == 'S' || options.Scheme == 'N'
                options.dt = 0.15;
            else
                options.dt = 1;
            end;
        end;
        if isfield(options,'sigma') < 1
            options.sigma = 1;
        end;
        if isfield(options,'rho') < 1
            options.rho = 1;
        end;
        if isfield(options,'eigenmode') < 1
            options.eigenmode = 0;
        end;
        if isfield(options,'C') < 1
            options.C = 1e-10;
        end;
        if isfield(options,'m') < 1
            options.m = 1;
        end;
        if isfield(options,'alpha') < 1
            options.alpha = 0.001;
        end;
        if isfield(options,'lambda_e') < 1
            options.lambda_e = 0.02;
        end;
        if isfield(options,'lambda_c') < 1
            options.lambda_c = 0.02;
        end;
        if isfield(options,'lambda_h') < 1
            options.lambda_h = 0.02;
        end;
        fprintf(file,'%s,',options.Scheme);
        fprintf(file,'%f,',options.T);
        fprintf(file,'%f,',options.dt);
        fprintf(file,'%f,',options.sigma);
        fprintf(file,'%f,',options.rho);
        fprintf(file,'%f,',options.eigenmode);
        fprintf(file,'%f,',options.C);
        fprintf(file,'%f,',options.m);
        fprintf(file,'%f,',options.alpha);
        fprintf(file,'%f,',options.lambda_e);
        fprintf(file,'%f,',options.lambda_c);
        fprintf(file,'%f,',options.lambda_h);
    else
        fprintf(file,',,,,,,,,,,,,');
    end;
end

