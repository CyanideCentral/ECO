
% This demo script runs the ECO tracker with deep features on the
% included "Crossing" video.

% Add paths
setup_paths();

% Load video information
data_path = [getenv('HOME'), '/dataset/VisDrone Dataset/3 - Single-Object Tracking/VisDrone2018-SOT-test-challenge/'];
video_path = [data_path, 'sequences/'];
init_path = [data_path, 'annotations/'];
list = dir(video_path);  
disp(list);

for k = 3:size(list, 1)
    vid = list(k).name;
    frames_dir = [video_path, vid, '/'];
    frames_list = dir(frames_dir);
    seq.len = size(frames_list,1);
    init_file = [init_path, vid, '.txt'];
    seq.init_rect = fscanf(fopen(init_file), '%f,%f,%f,%f');
    filenames = extractfield(frames_list(3:seq.len), 'name')';
    seq.format = 'otb';
    seq.s_frames = strcat(frames_dir, filenames);
end

% Run ECO
% results = testing_ECO_gpu(seq);