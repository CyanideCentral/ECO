
% This demo script runs the ECO tracker with deep features on the
% included "Crossing" video.

% Add paths
setup_paths();

% Load video information
data_path = [getenv('HOME'), '/dataset/VisDrone Dataset/3 - Single-Object Tracking/VisDrone2018-SOT-test-challenge/'];
video_path = [data_path, 'sequences/'];
list = dir(video_path);  
disp(list);

for k = 3:size(list, 1)
    vid = list(k).name;
    frames_dir = [video_path, vid, '/'];
    frames_list = dir(frames_dir);
    filenames = extractfield(frames_list(3:size(frames_list,1)), 'name');
end

% Run ECO
% results = testing_ECO_gpu(seq);