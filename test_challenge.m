
% This demo script runs the ECO tracker with deep features on the
% included "Crossing" video.

% Add paths
setup_paths();

% Load video information
data_path = [getenv('HOME'), '/dataset/VisDrone Dataset/3 - Single-Object Tracking/VisDrone2018-SOT-test-challenge/'];
video_path = [data_path, 'sequences/'];
list = dir(video_path);  
disp(list);


% Run ECO
% results = testing_ECO_gpu(seq);