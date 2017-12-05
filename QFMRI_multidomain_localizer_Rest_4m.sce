#QFRMI Perception GESSE Resting State

scenario = "QFMRI_perception_GESSE_Rest_8m";
scenario_type = trials;
no_logfile = false;
pcl_file = "QFMRI_multidomain_localizer_Rest_4m.pcl";

#---------------------------------------HEADER-------------------------------------#
active_buttons = 1; 
button_codes = 255; # space
target_button_codes = 255;

#screen settings
default_background_color = 180,180,180; #set to gray
screen_width = 1024;
screen_height = 768;
screen_bit_depth = 32;

default_trial_start_delay = 0; #no ITI built in
default_trial_duration = stimuli_length; #each trial runs as long as the stim in it
default_trial_type = fixed; #don't end trials based on responses

#default fonts
default_font = "Helvetica Bold" ;

#-----------------------------------END HEADER-------------------------------------#

begin;

#------------------------------STIMULUS DECLARATIONS-------------------------------#

picture {
	text {
		caption = "+";
		font_size = 72;
		font_color = 0,0,0; #black
	};
	x = 0; y = 0;
} fix; 


#------------------------------TRIAL DECLARATIONS----------------------------------#


trial {
	trial_duration = forever;
	trial_type = specific_response;
	terminator_button = 1; 
		picture {
			text {
				caption = "This is a resting scan.\
								Simply keep your eyes open \
								and look at the cross on the screen. \
								
							\
								Press Space to start \
								\
								Resting State - 4 m";
				font_size = 24;
				font_color = 0,0,0;
			};
			x = 0; y = 0;
		}; 
		code = "start";
} start;

trial {
	trial_duration = 239992; # 4 min 
	picture fix;
	code = "rest";
} resting;

trial {
	start_time = 1;
	trial_duration = forever;
	trial_type = specific_response;
	terminator_button = 1;
		picture {
			text {
				caption = "Done";
				font_size = 72;
				font_color = 0,0,0;
			};
			x = 0; y = 0;
			}; 
			code = "done";
} done;


