function varargout = GUI_Trab_Final(varargin)
% GUI_TRAB_FINAL MATLAB code for GUI_Trab_Final.fig
%      GUI_TRAB_FINAL, by itself, creates a new GUI_TRAB_FINAL or raises the existing
%      singleton*.
%
%      H = GUI_TRAB_FINAL returns the handle to a new GUI_TRAB_FINAL or the handle to
%      the existing singleton*.
%
%      GUI_TRAB_FINAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_TRAB_FINAL.M with the given input arguments.
%
%      GUI_TRAB_FINAL('Property','Value',...) creates a new GUI_TRAB_FINAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_Trab_Final_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_Trab_Final_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_Trab_Final

% Last Modified by GUIDE v2.5 17-Dec-2020 23:54:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_Trab_Final_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_Trab_Final_OutputFcn, ...
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


% --- Executes just before GUI_Trab_Final is made visible.
function GUI_Trab_Final_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_Trab_Final (see VARARGIN)

% Choose default command line output for GUI_Trab_Final
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_Trab_Final wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_Trab_Final_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in B_VLA.
function B_VLA_Callback(hObject, eventdata, handles)
% hObject    handle to B_VLA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
VLA


% --- Executes on button press in B_EQ.
function B_EQ_Callback(hObject, eventdata, handles)
% hObject    handle to B_EQ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
EQ


% --- Executes on button press in B_EH.
function B_EH_Callback(hObject, eventdata, handles)
% hObject    handle to B_EH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
EH


% --- Executes on button press in B_VLNA.
function B_VLNA_Callback(hObject, eventdata, handles)
% hObject    handle to B_VLNA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
VLNA


% --- Executes on button press in B_CT.
function B_CT_Callback(hObject, eventdata, handles)
% hObject    handle to B_CT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CargaTransiente


% --- Executes on button press in Sair.
function Sair_Callback(hObject, eventdata, handles)
% hObject    handle to Sair (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
closereq();
