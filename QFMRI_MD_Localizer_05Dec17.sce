# QFMRI Multidomain Localizer Task (for use in BCP Studies)
# version 08Nov17
# Basic Task: Tapping & Vigilance Localizer	
#			
#  BLOCKED FMRI DESIGN
#	TR = 4200 ms, 140 total acquisitions, total time = 9m 48s
# 		
#		Dead Time, 16.80 sec (4 TRs)
#		Motor-Visual sequence, 33.6 sec (8TRs)
#		Rest, 33.6 sec (8TRs)
#		Motor-Visual sequence, 33.6 sec (8TRs)
#		Rest, 33.6 sec (8TRs)
#		Motor-Visual sequence, 33.6 sec (8TRs)
#		Rest, 33.6 sec (8TRs)
#		Signal-Number Task, 8.4 sec (2 TRs)
#		Vigilance - High Prob, 33.6 sec (8TRs)
#		Vigilance - Low Prob, 33.6 sec (8TRs)
#		Vigilance - High Prob, 33.6 sec (8TRs)
#		Vigilance - Low Prob, 33.6 sec (8TRs)
#		Vigilance - High Prob, 33.6 sec (8TRs)
#		Vigilance - Low Prob, 33.6 sec (8TRs)
#		Padding, 16.8 sec (4 TRs)
#     Resting State, 2 min 22.8 sec (34 TRs)#		
#  

# Header Parameters
scenario = "BCP Localizer v1" ;
scenario_type = trials;

active_buttons = 5;
button_codes = 1, 2, 3, 4, 255;
target_button_codes = 1,2,3,4,255;
response_logging = log_all; 

screen_width = 1024;
screen_height = 768;
screen_bit_depth = 32;

default_background_color = 224,224,224;		# define very light gray as background

# text defaults
default_text_color = 0, 0, 0;			# define black as text color
default_font = "Helvetica Bold";
default_font_size = 48;

#default_path = "c:\\Users\\frank\\Desktop\\Experiments\\Experiments-sync\\QFMRI_multidomain_localizer\\";

default_trial_type = fixed;
default_all_responses = true;
default_max_responses = 1;

# End of Header Parameters

begin;

# ------------begin Stimulus definitions ----------------

picture {background_color = 224,224,224;} default;

picture {
    text { 
        font = "Helvetica Bold"; 
        caption = "+"; 
        font_size = 112 ; 
#        background_color = 224,224,224;
		}; 
        x=0; y=0;
} fixation;

picture {
    text { 
        font = "Helvetica Bold"; 
        caption = "+"; 
        font_size = 112 ; 
		  font_color = 255,0,0 ;
		};
        x=0; y=0;
} Signal;

picture {
    text { 
        font = "Helvetica Bold"; 
        caption = "Number Task Next"; 
        font_size = 48 ; 
		}; 
        x=0; y=0;
} num_signal;

picture {
    text { 
        font = "Helvetica Bold"; 
        caption = "Eyes Open Resting"; 
        font_size = 48 ; 
		}; 
        x=0; y=0;
} resting_signal;
	
# Define Instructions

picture {
	text { caption = "QFMRI Multidomain Localizer\
			Acquisitions = 140 TRs (4200 ms), Time 9 min 48 sec";
			font_size = 10 ; 
#			background_color = 224,224,224;
		}; 
			x=0; y=0;
} intro1	;

picture {
		text {
			caption = "Remember to keep your eyes on the screen.\
				In the first tasks you will press buttons using \
				your right hand with the sequence 1-3-2-4 when  \
				you see a large red dot appear in the middle of
				a checkerboard circle that is flashing. This means to \
				press your index finger, ring finger, \
				middle finger, then pinky finger in sequence.";
			font_size = 20;
			font_color = 0,0,0;
		};
		x = 0;
		y = 0;
} instruct1 ;

picture {
		text {
			caption = "In the second set of tasks, you will 
				press the button for the side with the \
				digit of the largest magnitude (not size). \
				Try to respond as quickly and accurately as possible.\
				\
				The study will end with 2 minutes of resting.\
				During rest, keep your eyes open and \
				look at the cross in the center of the screen. \
				\
				Do you have any questions?";
			font_size = 20;
			font_color = 0,0,0;
		};
		x = 0;
		y = 0;
} instruct2 ;
	

picture {text { caption = "We are ready to begin.\
					Space to start."
; font_size = 28 ;}; x=0; y=0;} instruct3	;


# -------- end stimulus definitions -------------

# -------- begin Trials definitions -------------


trial {
trial_duration = 1672; # 1680 ms 

	picture fixation ;
		time =0 ;
		duration = 1672 ;  # 1680 sec
} null;


trial {
trial_duration = 33592; #33.6 sec 

	picture fixation ;
		time =0 ;
		duration = 31592 ;  # 31.6 sec

	picture Signal ;
		time = 31600 ;		# 31.6 sec
		duration = 1992 ;  # 2 sec
} off_block;

trial {
trial_duration = 8392 ;   # 8.4 sec

	picture num_signal ;
		time =0 ;
		duration = 6392 ;  # 6.4 sec

	picture Signal ;
		time = 6400 ;		# 6.4 sec
		duration = 1992 ;	# 2 sec
} number_signal;

trial {
   # play entire video - 33.34s
   video {
      filename = "motor_visual_movie.avi"; # relative to default stimuli directory
   };
	time = 0 ;
	duration = 33592; 
	code = "motor_vis" ;
} motor_vis;


# -------- end Trials definitions -------------


# -------- begin Experiment Trials -------------

# Instructions

trial { picture intro1 ;
	duration = response;
} ;

trial { picture instruct1 ;
	duration = response;
} ;

trial { picture instruct2 ;
	duration = response;
} ;

trial { picture instruct3 ;
	duration = response;
} ;

# TRIALS FOR EXPERIMENT

# First four "dead" TRs (4 x 4200 ms = 16.8 s)
trial {
	trial_duration = 16792 ; # 16.8 sec 
	
	picture fixation ;
		time =0 ;
		duration = 16792 ; # 16.8 sec
		code = "Dead_trials" ;
};


# Block 1 - Motor-Visual 
trial	motor_vis ;

# Block 2: OFF block
trial off_block ;  

# Block 3 -  Motor-Visual 
trial	motor_vis ;

# Block 4: OFF block
trial off_block ; 

# Block 5 -  Motor-Visual 
trial	motor_vis ;

# Block 6: OFF block
trial off_block ; 

#Signal transition
trial number_signal ;

# Block 7 - High Prob Vigilance
TEMPLATE "QFMRI_multidomain_localizer_vigilance_stim_definition.tem"	{
StimL	StimR	SizeL	SizeR	Button_code	NumDistance	;			 
8	5	48	96	1	3	;
1	6	48	96	2	5	;
};
trial null;
TEMPLATE "QFMRI_multidomain_localizer_vigilance_stim_definition.tem"	{
StimL	StimR	SizeL	SizeR	Button_code	NumDistance	;
3	9	96	48	2	6	;
7	2	48	96	1	5	;
};
trial null;
trial null;
TEMPLATE "QFMRI_multidomain_localizer_vigilance_stim_definition.tem"	{
StimL	StimR	SizeL	SizeR	Button_code	NumDistance	;
3	9	48	96	2	6	;
2	4	48	96	2	2	;
};
trial null;
TEMPLATE "QFMRI_multidomain_localizer_vigilance_stim_definition.tem"	{
StimL	StimR	SizeL	SizeR	Button_code	NumDistance	;
6	3	48	96	1	3	;
};
trial null;
trial null;
trial null;
TEMPLATE "QFMRI_multidomain_localizer_vigilance_stim_definition.tem"	{
StimL	StimR	SizeL	SizeR	Button_code	NumDistance	;
3	7	48	96	2	4	;
8	2	48	96	1	6	;
};
trial null;
TEMPLATE "QFMRI_multidomain_localizer_vigilance_stim_definition.tem"	{
StimL	StimR	SizeL	SizeR	Button_code	NumDistance	;
7	5	96	48	1	2	;
2	5	48	96	2	3	;
2	9	96	48	2	7	;
};

# Block 8: Low Prob Vigilance
trial null;
trial null;
trial null;
TEMPLATE "QFMRI_multidomain_localizer_vigilance_stim_definition.tem"	{
StimL	StimR	SizeL	SizeR	Button_code	NumDistance	;
8	1	48	96	1	7	;  
};
trial null;
trial null;
TEMPLATE "QFMRI_multidomain_localizer_vigilance_stim_definition.tem"	{
StimL	StimR	SizeL	SizeR	Button_code	NumDistance	;
3	2	48	96	1	1	;
};
trial null;
trial null;
trial null;
TEMPLATE "QFMRI_multidomain_localizer_vigilance_stim_definition.tem"	{
StimL	StimR	SizeL	SizeR	Button_code	NumDistance	;
2	7	48	96	2	5	;
};
trial null;
trial null;
TEMPLATE "QFMRI_multidomain_localizer_vigilance_stim_definition.tem"	{
StimL	StimR	SizeL	SizeR	Button_code	NumDistance	;
2	1	96	48	1	1	;
};
trial null;
trial null;
TEMPLATE "QFMRI_multidomain_localizer_vigilance_stim_definition.tem"	{
StimL	StimR	SizeL	SizeR	Button_code	NumDistance	;
8	2	96	48	1	6	;
};
trial null;
trial null;
trial null;
TEMPLATE "QFMRI_multidomain_localizer_vigilance_stim_definition.tem"	{
StimL	StimR	SizeL	SizeR	Button_code	NumDistance	;
3	4	96	48	2	1	;
};


# Block 9 - High Prob Vigilance
trial null;
TEMPLATE "QFMRI_multidomain_localizer_vigilance_stim_definition.tem"	{
StimL	StimR	SizeL	SizeR	Button_code	NumDistance	;			 
5	7	96	48	2	2	;
7	4	48	96	1	3	;
7	9	48	96	2	2	;
};
trial null;
trial null;
TEMPLATE "QFMRI_multidomain_localizer_vigilance_stim_definition.tem"	{
StimL	StimR	SizeL	SizeR	Button_code	NumDistance	;			 
5	9	48	96	2	4	;
2	1	96	48	1	1	;
};
trial null;
TEMPLATE "QFMRI_multidomain_localizer_vigilance_stim_definition.tem"	{
StimL	StimR	SizeL	SizeR	Button_code	NumDistance	;			 
2	7	48	96	2	5	;
};
trial null;
trial null;
TEMPLATE "QFMRI_multidomain_localizer_vigilance_stim_definition.tem"	{
StimL	StimR	SizeL	SizeR	Button_code	NumDistance	;			 
7	2	96	48	1	5	;
5	3	96	48	1	2	;
1	6	48	96	2	5	;
};
trial null;
TEMPLATE "QFMRI_multidomain_localizer_vigilance_stim_definition.tem"	{
StimL	StimR	SizeL	SizeR	Button_code	NumDistance	;			 
7	6	96	48	1	1	;
5	2	96	48	1	3	;
};
trial null;
TEMPLATE "QFMRI_multidomain_localizer_vigilance_stim_definition.tem"	{
StimL	StimR	SizeL	SizeR	Button_code	NumDistance	;			 
6	5	48	96	1	1	;
};


# Block 10: Low Prob Vigilance
trial null;
trial null;
TEMPLATE "QFMRI_multidomain_localizer_vigilance_stim_definition.tem"	{
StimL	StimR	SizeL	SizeR	Button_code	NumDistance	;			 
4	8	48	96	2	4	;
};
trial null;
trial null;
trial null;
TEMPLATE "QFMRI_multidomain_localizer_vigilance_stim_definition.tem"	{
StimL	StimR	SizeL	SizeR	Button_code	NumDistance	;			 
7	3	48	96	1	4	;
};
trial null;
trial null;
TEMPLATE "QFMRI_multidomain_localizer_vigilance_stim_definition.tem"	{
StimL	StimR	SizeL	SizeR	Button_code	NumDistance	;			 
2	4	48	96	2	2	;
};
trial null;
trial null;
trial null;
TEMPLATE "QFMRI_multidomain_localizer_vigilance_stim_definition.tem"	{
StimL	StimR	SizeL	SizeR	Button_code	NumDistance	;			 
7	8	96	48	2	1	;
};
trial null;
TEMPLATE "QFMRI_multidomain_localizer_vigilance_stim_definition.tem"	{
StimL	StimR	SizeL	SizeR	Button_code	NumDistance	;			 
7	1	48	96	1	6	;
};
trial null;
trial null;
TEMPLATE "QFMRI_multidomain_localizer_vigilance_stim_definition.tem"	{
StimL	StimR	SizeL	SizeR	Button_code	NumDistance	;			 
8	9	96	48	2	1	;
};
trial null;


# Block 11 - High Prob Vigilance
TEMPLATE "QFMRI_multidomain_localizer_vigilance_stim_definition.tem"	{
StimL	StimR	SizeL	SizeR	Button_code	NumDistance	;			 
6	4	48	96	1	2	;
4	6	48	96	2	2	;
};
trial null;
trial null;
TEMPLATE "QFMRI_multidomain_localizer_vigilance_stim_definition.tem"	{
StimL	StimR	SizeL	SizeR	Button_code	NumDistance	;			 
8	7	48	96	1	1	;
};
trial null;
TEMPLATE "QFMRI_multidomain_localizer_vigilance_stim_definition.tem"	{
StimL	StimR	SizeL	SizeR	Button_code	NumDistance	;			 
2	8	96	48	2	6	;
2	9	96	48	2	7	;
};
trial null;
TEMPLATE "QFMRI_multidomain_localizer_vigilance_stim_definition.tem"	{
StimL	StimR	SizeL	SizeR	Button_code	NumDistance	;			 
1	7	48	96	2	6	;
};
trial null;
trial null;
TEMPLATE "QFMRI_multidomain_localizer_vigilance_stim_definition.tem"	{
StimL	StimR	SizeL	SizeR	Button_code	NumDistance	;			 
8	4	96	48	1	4	;
2	4	48	96	2	2	;
8	6	96	48	1	2	;
};
trial null;
TEMPLATE "QFMRI_multidomain_localizer_vigilance_stim_definition.tem"	{
StimL	StimR	SizeL	SizeR	Button_code	NumDistance	;			 
2	3	48	96	2	1	;
};
trial null;
TEMPLATE "QFMRI_multidomain_localizer_vigilance_stim_definition.tem"	{
StimL	StimR	SizeL	SizeR	Button_code	NumDistance	;			 
4	3	96	48	1	1	;
7	3	48	96	1	4	;
};

# Block 12: Low Prob Vigilance
trial null;
trial null;
TEMPLATE "QFMRI_multidomain_localizer_vigilance_stim_definition.tem"	{
StimL	StimR	SizeL	SizeR	Button_code	NumDistance	;			 
7	4	48	96	1	3	;
};
trial null;
trial null;
trial null;
TEMPLATE "QFMRI_multidomain_localizer_vigilance_stim_definition.tem"	{
StimL	StimR	SizeL	SizeR	Button_code	NumDistance	;			 
3	9	48	96	2	6	;
};
trial null;
trial null;
trial null;
TEMPLATE "QFMRI_multidomain_localizer_vigilance_stim_definition.tem"	{
StimL	StimR	SizeL	SizeR	Button_code	NumDistance	;			 
3	7	96	48	2	4	;
};
trial null;
trial null;
TEMPLATE "QFMRI_multidomain_localizer_vigilance_stim_definition.tem"	{
StimL	StimR	SizeL	SizeR	Button_code	NumDistance	;			 
6	5	48	96	1	1	;
};
trial null;
TEMPLATE "QFMRI_multidomain_localizer_vigilance_stim_definition.tem"	{
StimL	StimR	SizeL	SizeR	Button_code	NumDistance	;			 
1	9	96	48	2	8	;
};
trial null;
trial null;
trial null;
TEMPLATE "QFMRI_multidomain_localizer_vigilance_stim_definition.tem"	{
StimL	StimR	SizeL	SizeR	Button_code	NumDistance	;			 
2	5	48	96	2	3	;
};

# Run-out
trial {
	trial_duration = 16792 ; # 16.8 sec 
	
	picture fixation ;
		time =0 ;
		duration = 16792 ; # 16.8 sec
		code = "Padding" ;
};

# 1 min 45 sec  resting state

trial {
trial_duration = 142792 ;   # 142.8 sec

	picture resting_signal ;
		time =0 ; 
		duration = 1992 ;  # 2 sec

	picture fixation ;
		time = 2000 ;
		duration = 140792 ;  # 140.8 sec

	
};  


# End of task signal
trial {
trial_duration = 3000 ;
picture {text { caption = "End of task"; font_size = 36 ; background_color = 224,224,224 ;}; x=0; y=0;} ;
time =0 ;
duration = 2000 ;
};

# End of trials
# End of scenario
