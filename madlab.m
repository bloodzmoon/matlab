function varargout = madlab(varargin)
% MADLAB MATLAB code for madlab.fig
%      MADLAB, by itself, creates a new MADLAB or raises the existing
%      singleton*.
%
%      H = MADLAB returns the handle to a new MADLAB or the handle to
%      the existing singleton*.
%
%      MADLAB('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MADLAB.M with the given input arguments.
%
%      MADLAB('Property','Value',...) creates a new MADLAB or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before madlab_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to madlab_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help madlab

% Last Modified by GUIDE v2.5 06-Dec-2019 00:18:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @madlab_OpeningFcn, ...
                   'gui_OutputFcn',  @madlab_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before madlab is made visible.
function madlab_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
set(gcf,'Position',[0 0 790 450])
% Reposition each panel to same location as panel 1
set(handles.P2,'position',get(handles.P1,'position'));
set(handles.P2, 'visible', 'off');

% Load all images here
logo = imread('logo.jpg');
axes(handles.logo_box);
imshow(logo);
logomini = imread('logobw.jpg');
axes(handles.logomini_box);
imshow(logomini);
sizeicon = imread('size.jpg');
axes(handles.size_icon);
imshow(sizeicon);

% Update ALL variables
handles.scene = "-HOME-";
handles.mouseSelect = "NONE";
handles.matrix_size = 3;
guidata(hObject, handles);




% --- Outputs from this function are returned to the command line.
function varargout = madlab_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


% --- Executes on button press in start_button.
function start_button_Callback(hObject, eventdata, handles)
handles.scene = "-MENU-";
set(handles.P1, 'visible', 'off');
set(handles.P2, 'visible', 'on');
setfigptr('circle', handles.madlab);
guidata(hObject, handles);



% --- Executes on mouse motion over figure - except title and menu.
function madlab_WindowButtonMotionFcn(hObject, eventdata, handles)
mouse = hittest(hObject);
setfigptr('circle', handles.madlab);
handles.mouseSelect = "NONE";
disp(mouse.Value);
switch handles.scene
    case "-HOME-"
        if mouse.Value == 50
            handles.mouseSelect = "START";
            setfigptr('cross', handles.madlab);
        end
    case "-MENU-"
        % reset color of size button
        if handles.size2_check.Value == 0
            set(handles.size2_check, 'BackgroundColor', [0.65 0.65 0.65]);
        end
        if handles.size3_check.Value == 0
            set(handles.size3_check, 'BackgroundColor', [0.65 0.65 0.65]);
        end
        if handles.size4_check.Value == 0
            set(handles.size4_check, 'BackgroundColor', [0.65 0.65 0.65]);
        end
        
        % hover size button
        if mouse.Value == 62 && handles.size2_check.Value ~= 1
            handles.mouseSelect = "SIZE2";
            setfigptr('cross', handles.madlab);
            set(handles.size2_check, 'BackgroundColor', [0.5 0.5 0.5]);
        end
        if mouse.Value == 63 && handles.size3_check.Value ~= 1
            handles.mouseSelect = "SIZE3";
            setfigptr('cross', handles.madlab);
            set(handles.size3_check, 'BackgroundColor', [0.5 0.5 0.5]);
        end
        if mouse.Value == 64 && handles.size4_check.Value ~= 1
            handles.mouseSelect = "SIZE4";
            setfigptr('cross', handles.madlab);
            set(handles.size4_check, 'BackgroundColor', [0.5 0.5 0.5]);
        end
end
guidata(hObject, handles);


% --- Executes on mouse press over figure background, over a disabled or
function madlab_WindowButtonDownFcn(hObject, eventdata, handles)
switch handles.mouseSelect % must set button enable = inactive !!
    case "SIZE2"
        set(handles.size2_check, 'Value', 1, 'BackgroundColor', [0.77 0.00 0.24]);
        set(handles.size3_check, 'Value', 0, 'BackgroundColor', [0.65 0.65 0.65]);
        set(handles.size4_check, 'Value', 0, 'BackgroundColor', [0.65 0.65 0.65]);
        set(handles.size2, 'FontWeight', 'bold');
        set(handles.size3, 'FontWeight', 'normal');
        set(handles.size4, 'FontWeight', 'normal');
    case "SIZE3"
        set(handles.size2_check, 'Value', 0, 'BackgroundColor', [0.65 0.65 0.65]);
        set(handles.size3_check, 'Value', 1, 'BackgroundColor', [0.77 0.00 0.24]);
        set(handles.size4_check, 'Value', 0, 'BackgroundColor', [0.65 0.65 0.65]);
        set(handles.size2, 'FontWeight', 'normal');
        set(handles.size3, 'FontWeight', 'bold');
        set(handles.size4, 'FontWeight', 'normal');
    case "SIZE4"
        set(handles.size2_check, 'Value', 0, 'BackgroundColor', [0.65 0.65 0.65]);
        set(handles.size3_check, 'Value', 0, 'BackgroundColor', [0.65 0.65 0.65]);
        set(handles.size4_check, 'Value', 1, 'BackgroundColor', [0.77 0.00 0.24]);
        set(handles.size2, 'FontWeight', 'normal');
        set(handles.size3, 'FontWeight', 'normal');
        set(handles.size4, 'FontWeight', 'bold');
end
guidata(hObject, handles);

