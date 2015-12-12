function mysetup(varargin)

[q,s] = prep;

if nargin == 0
    % list
    for I=1:length(q)
        disp(sprintf('Name: %10s',q(I).name));
    end
else
    % each item 
    fp = mfilename('fullpath');
    p = fileparts(fp);
    for I=1:nargin
        if isfield(s,varargin{I})
            qi = s.(varargin{I});
            ffp = [p filesep qi.folder]
            if exist(ffp,'dir') == 0
                u = qi.url;
                if isempty(u)
                    u = qi.website;
                end                   
                error(sprintf('Package %s not downloaded. Look at %s',qi.name,u));
            end
            if isempty(qi.startup)
                if qi.folder(end) == '*'
                    addpath(genpath(ffp(1:end-1)));
                else                    
                    addpath(ffp);
                end
            else
                disp(sprintf('Initing %s',qi.name));
                run([ffp filesep qi.startup]);
            end
        else
            error(sprintf('Unknown %s',varargin{I}));
        end
    end
    
end


function [q,s] = prep()

%NOTE: folder with asterisk means to use genpath
sbtk = struct('name','btk','folder','btk','website','https://code.google.com/p/b-tk/','url','','startup','');
seeg = struct('name','eeglab','folder','eeglab13_4_3b','website','http://sccn.ucsd.edu/eeglab/','url','','startup','');
sfig = struct('name','exportfig','folder','export_fig','website','http://it.mathworks.com/matlabcentral/fileexchange/23629-export-fig','url','http://it.mathworks.com/matlabcentral/mlc-downloads/downloads/submissions/23629/versions/100/download/zip','startup','');
squat =  struct('name','quaternions','folder','quaternions','website','http://it.mathworks.com/matlabcentral/fileexchange/1176-quaternion-toolbox','url','http://it.mathworks.com/matlabcentral/mlc-downloads/downloads/submissions/1176/versions/2/download/zip','startup','');
srosbag = struct('name','rosbag','folder','rosbag','website','https://github.com/bcharrow/matlab_rosbag/releases','url','','startup','');
srobot = struct('name','robot','folder','rvctools','website','http://petercorke.com/Robotics_Toolbox.html','url','','startup','startup_rvc.m');
sbnt = struct('name','bnt','folder','bnt*','website','https://github.com/bayesnet/bnt','url','','startup','');
spmtk = struct('name','pmtk','folder','pmtk','website','https://github.com/probml/pmtk3','url','','startup','');
sdimple = struct('name','dimple','folder','dimple_v0_07','website','http://dimple.probprog.org/','url','https://s3.amazonaws.com/files.dimple.probprog.org/dimple_v0_07.zip','startup','startup.m');
sgraph = struct('name','graphviz','folder','graphviz4matlab','website','http://it.mathworks.com/matlabcentral/fileexchange/21652-graphviz4matlab','url','http://it.mathworks.com/matlabcentral/mlc-downloads/downloads/submissions/21652/versions/4/download/zip','startup','');
sgpml = struct('name','gpml','folder','gpml','website','http://www.gaussianprocess.org/gpml/code/matlab/doc/','url','http://gaussianprocess.org/gpml/code/matlab/release/gpml-matlab-v3.6-2015-07-07.zip','startup','startup.m');
snetlab = struct('name','netlab','folder','netlab','website','http://it.mathworks.com/matlabcentral/fileexchange/2654-netlab/','url','http://it.mathworks.com/matlabcentral/mlc-downloads/downloads/submissions/2654/versions/1/download/zip','startup','');
sekfukf = struct('name','ekfukf','folder','ekfukf','website','http://becs.aalto.fi/en/research/bayes/ekfukf/install.html','url','','startup','');
sjson = struct('name','json','folder','jsonlab','website','','url','','startup','');
sjsonmex = struct('name','jsonmex','folder','matlab-json','website','','url','','startup','');
swobj = struct('name','wobj','folder','wobj','website','http://it.mathworks.com/matlabcentral/fileexchange/27982-wavefront-obj-toolbox','url','http://it.mathworks.com/matlabcentral/mlc-downloads/downloads/submissions/27982/versions/5/download/zip','startup','');
q = [sbtk,seeg,sfig,sekfukf,squat,srosbag,srobot,sbnt,spmtk,sdimple,sgraph,sgpml,snetlab,sjson,sjsonmex,swobj];

if nargout == 2
    s = [];
    for I=1:length(q)
        s.(q(I).name) = q(I);
    end   
end
